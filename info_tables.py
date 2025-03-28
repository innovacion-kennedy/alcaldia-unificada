from sshtunnel import SSHTunnelForwarder
import psycopg2
import pandas as pd
from dotenv import load_dotenv
import os
import logging
import time
from rich.console import Console
from rich.progress import track

# Cargar variables de entorno
load_dotenv()

# Consola interactiva
console = Console()

# Logging
logging.basicConfig(
    filename='info_tables.log',
    level=logging.INFO,
    format='%(asctime)s | %(levelname)s | %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

# Variables del entorno
SSH_HOST = os.getenv("SSH_HOST")
SSH_PORT = int(os.getenv("SSH_PORT"))
SSH_USER = os.getenv("SSH_USER")
SSH_PASSWORD = os.getenv("SSH_PASSWORD")
PG_USER = os.getenv("PG_USER")
PG_PASSWORD = os.getenv("PG_PASSWORD")
PG_DB = os.getenv("PG_DB")
PG_LOCAL_PORT = int(os.getenv("PG_LOCAL_PORT"))

# Decorador para medir tiempo
def medir_tiempo(func):
    def wrapper(*args, **kwargs):
        inicio = time.perf_counter()
        logging.info(f"Iniciando función: {func.__name__}")
        resultado = func(*args, **kwargs)
        fin = time.perf_counter()
        duracion = fin - inicio
        logging.info(f"Finalizó {func.__name__} en {duracion:.2f} segundos")
        return resultado
    return wrapper

@medir_tiempo
def abrir_tunel_ssh():
    tunnel = SSHTunnelForwarder(
        (SSH_HOST, SSH_PORT),
        ssh_username=SSH_USER,
        ssh_password=SSH_PASSWORD,
        remote_bind_address=('127.0.0.1', 5432),
        local_bind_address=('127.0.0.1', PG_LOCAL_PORT)
    )
    tunnel.start()
    logging.info("Túnel SSH abierto")
    console.log("[green]Túnel SSH abierto exitosamente[/]")
    return tunnel

@medir_tiempo
def probar_conexion_postgres(tunnel):
    conn = psycopg2.connect(
        host='127.0.0.1',
        port=tunnel.local_bind_port,
        user=PG_USER,
        password=PG_PASSWORD,
        dbname=PG_DB
    )
    logging.info("Conexión a PostgreSQL establecida")
    console.log("[green]Conexión a PostgreSQL establecida[/]")
    return conn

@medir_tiempo
def listar_tablas(conn):
    cursor = conn.cursor()
    cursor.execute("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
        ORDER BY table_name;
    """)
    tablas = [row[0] for row in cursor.fetchall()]
    cursor.close()
    logging.info(f"Se encontraron {len(tablas)} tablas.")
    console.log(f"[cyan]📄 {len(tablas)} tablas encontradas[/]")
    return tablas

@medir_tiempo
def listar_vistas(conn):
    cursor = conn.cursor()
    cursor.execute("""
        SELECT table_name
        FROM information_schema.views
        WHERE table_schema = 'public'
        ORDER BY table_name;
    """)
    vistas = [row[0] for row in cursor.fetchall()]
    cursor.close()
    logging.info(f"Se encontraron {len(vistas)} vistas.")
    console.log(f"[cyan]👁️ {len(vistas)} vistas encontradas[/]")
    return vistas

@medir_tiempo
def extraer_esquema_columnas(conn, tablas_y_vistas):
    cursor = conn.cursor()
    registros = []

    query = """
        SELECT 
            table_name,
            column_name,
            data_type,
            is_nullable,
            ordinal_position
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = %s
        ORDER BY ordinal_position;
    """

    for item in track(tablas_y_vistas, description="📊 Extrayendo columnas..."):
        cursor.execute(query, (item,))
        columnas = cursor.fetchall()
        for col in columnas:
            registros.append({
                "tabla_o_vista": col[0],
                "columna": col[1],
                "tipo_dato": col[2],
                "acepta_null": col[3],
                "posicion": col[4]
            })

    cursor.close()
    df = pd.DataFrame(registros)
    df.to_csv("estructura_completa_alcaldia_unificada.csv", index=False)
    exportar_esquema_a_markdown(df)
    logging.info("Exportadas columnas a CSV y Markdown")
    console.log("[green]📄 estructura_completa_alcaldia_unificada.csv y estructura_bd.md generados[/]")

def exportar_esquema_a_markdown(df):
    with open("estructura_bd.md", "w") as f:
        f.write("# 📘 Documentación de la Base de Datos `alcaldia_unificada`\n\n")
        for tabla in df['tabla_o_vista'].unique():
            f.write(f"## 🧱 {tabla}\n\n")
            f.write("| Posición | Columna | Tipo de Dato | Acepta NULL |\n")
            f.write("|----------|---------|---------------|--------------|\n")
            sub_df = df[df['tabla_o_vista'] == tabla]
            for _, row in sub_df.iterrows():
                f.write(f"| {row['posicion']} | {row['columna']} | {row['tipo_dato']} | {row['acepta_null']} |\n")
            f.write("\n")

@medir_tiempo
def exportar_sql_definiciones_tablas(conn):
    cursor = conn.cursor()
    cursor.execute("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
        ORDER BY table_name;
    """)
    tablas = cursor.fetchall()
    definiciones = []

    for tabla in track(tablas, description="📐 Generando definiciones de tablas..."):
        cursor.execute(f"""
            SELECT 'CREATE TABLE ' || c.relname || E'\n(\n' ||
                   string_agg('    ' || a.attname || ' ' || pg_catalog.format_type(a.atttypid, a.atttypmod), E',\n')
                   || E'\n);'
            FROM pg_class c
            JOIN pg_namespace n ON n.oid = c.relnamespace
            JOIN pg_attribute a ON a.attrelid = c.oid
            WHERE c.relname = '{tabla[0]}' AND n.nspname = 'public' AND a.attnum > 0 AND NOT a.attisdropped
            GROUP BY c.relname;
        """)
        result = cursor.fetchone()
        if result and result[0]:
            definiciones.append(f"-- {tabla[0]}\n{result[0]}\n\n")

    with open("definiciones_tablas.sql", "w") as f:
        f.writelines(definiciones)
    cursor.close()
    console.log("[blue]🧾 definiciones_tablas.sql generado[/]")
    logging.info("Archivo definiciones_tablas.sql generado")

@medir_tiempo
def exportar_sql_definiciones_vistas(conn):
    cursor = conn.cursor()
    cursor.execute("""
        SELECT table_name, view_definition
        FROM information_schema.views
        WHERE table_schema = 'public'
        ORDER BY table_name;
    """)
    vistas = cursor.fetchall()
    definiciones = []

    for vista in vistas:
        definicion = f"CREATE OR REPLACE VIEW {vista[0]} AS\n{vista[1]};\n"
        definiciones.append(f"-- {vista[0]}\n{definicion}\n\n")

    with open("definiciones_vistas.sql", "w") as f:
        f.writelines(definiciones)
    cursor.close()
    console.log("[blue]🧾 definiciones_vistas.sql generado[/]")
    logging.info("Archivo definiciones_vistas.sql generado")

# EJECUCIÓN FINAL
if __name__ == "__main__":
    console.print("[bold cyan]🚀 Iniciando documentación de la base de datos[/]")

    with console.status("[green]Abriendo túnel SSH..."):
        tunel = abrir_tunel_ssh()

    if tunel:
        with console.status("[green]Conectando a PostgreSQL..."):
            conn = probar_conexion_postgres(tunel)

        if conn:
            tablas = listar_tablas(conn)
            vistas = listar_vistas(conn)
            todas = tablas + vistas
            extraer_esquema_columnas(conn, todas)
            exportar_sql_definiciones_tablas(conn)
            exportar_sql_definiciones_vistas(conn)
            conn.close()

        tunel.stop()
        console.log("[red]🔒 Túnel SSH cerrado[/]")

    console.print("[bold green]✅ Proceso completado exitosamente[/]")
