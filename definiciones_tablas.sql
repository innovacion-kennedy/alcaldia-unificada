-- areas
CREATE TABLE areas
(
    id_area integer,
    nombre_area character varying(255)
);

-- auth_group
CREATE TABLE auth_group
(
    id integer,
    name character varying(150)
);

-- auth_group_permissions
CREATE TABLE auth_group_permissions
(
    id bigint,
    group_id integer,
    permission_id integer
);

-- auth_permission
CREATE TABLE auth_permission
(
    id integer,
    name character varying(255),
    content_type_id integer,
    codename character varying(100)
);

-- auth_user
CREATE TABLE auth_user
(
    id integer,
    password character varying(128),
    last_login timestamp with time zone,
    is_superuser boolean,
    username character varying(150),
    first_name character varying(150),
    last_name character varying(150),
    email character varying(254),
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone
);

-- auth_user_groups
CREATE TABLE auth_user_groups
(
    id bigint,
    user_id integer,
    group_id integer
);

-- auth_user_user_permissions
CREATE TABLE auth_user_user_permissions
(
    id bigint,
    user_id integer,
    permission_id integer
);

-- contratacion_contratacion
CREATE TABLE contratacion_contratacion
(
    id bigint,
    tipo_proceso character varying(100),
    modalidad_seleccion character varying(100),
    estado character varying(50),
    porcentaje_tiempo_transcurrido numeric(5,2),
    numero_orden integer,
    numero_proceso character varying(50),
    contrato character varying(50),
    abogado character varying(100),
    tipo_persona character varying(10),
    contratista character varying(200),
    numero_identificacion bigint,
    domicilio character varying(255),
    telefono bigint,
    email character varying(254),
    sexo character varying(1),
    fecha_nacimiento date,
    edad integer,
    plataforma character varying(50),
    link_plataforma character varying(200),
    objeto_contrato text,
    tipo_recurso character varying(50),
    no_hay integer,
    fecha_expedicion_no_hay date,
    numero_sipse integer,
    numero_cdp integer,
    valor_cdp bigint,
    fecha_cdp date,
    numero_proyecto integer,
    nombre_proyecto character varying(255),
    fecha_suscripcion date,
    acta_inicio boolean,
    fecha_inicio_contrato date,
    fecha_terminacion_incl_prorroga date,
    fecha_terminacion_inicial date,
    dias_para_terminar integer,
    tiempo_contrato_dias integer,
    tiempo_contrato_meses integer,
    valor_inicial_contrato bigint,
    valor_total_con_adiciones bigint,
    honorarios_mensuales bigint,
    valor_total_contrato_letras text,
    numero_rp integer,
    valor_rp bigint,
    fecha_rp date,
    fecha_aprobacion_poliza date,
    designacion character varying(50),
    supervisor character varying(100),
    apoyo_supervision character varying(100),
    dependencia character varying(100),
    sub_dependencia_rol character varying(100),
    rol character varying(100),
    arl_nombre character varying(100),
    nivel_riesgo_arl character varying(10),
    fecha_inicio_suspension date,
    fecha_final_suspension date,
    plazo_suspension integer,
    unidad_plazo character varying(20),
    fecha_inicio_suspension2 date,
    fecha_final_suspension3 date,
    plazo_suspension4 integer,
    unidad_plazo5 character varying(20),
    cedente character varying(100),
    cesionario character varying(100),
    direccion_cedente character varying(255),
    telefono_cedente bigint,
    correo_cedente character varying(254),
    identificacion_cedente bigint,
    fecha_modificacion_cesion date,
    fecha_inicio_cesion date,
    numero_sipse_adicion integer,
    fecha_terminacion_con_adicion date,
    tiempo_adicion integer,
    cdp_adicion integer,
    fecha_cdp_adicion date,
    valor_adicion bigint,
    fecha_adicion date,
    rp_adicion integer,
    fecha_rp_adicion date,
    numero_sipse_adicion_2 integer,
    fecha_terminacion_con_adicion_2 date,
    tiempo_adicion_2 integer,
    cdp_2 integer,
    fecha_cdp2 date,
    valor_adicion_2 bigint,
    fecha_adicion_2 date,
    rp_adicion_2 integer,
    fecha_rp_adicion_2 date,
    fecha_prorroga date,
    plazo_prorroga integer,
    nueva_fecha_terminacion date,
    fecha_prorroga_2 date,
    plazo_prorroga_2 integer,
    nueva_fecha_terminacion_2 date,
    fecha_prorroga_3 date,
    plazo_prorroga_3 integer,
    nueva_fecha_terminacion_3 date,
    revision_contractual text
);

-- cps_planta_cpsplanta
CREATE TABLE cps_planta_cpsplanta
(
    duplicar integer,
    cedula bigint,
    nombres character varying(200),
    fecha_terminacion_contrato date,
    proyecto character varying(200),
    actividad character varying(200),
    objeto text,
    honorarios integer,
    vlr_presupuesto integer,
    tiempo_meses integer,
    numero_personas_solicitadas integer,
    nivel_academico character varying(100),
    riesgo character varying(10),
    sipse integer,
    responsable character varying(100),
    vto_nohay date,
    gestor character varying(100),
    cdp boolean,
    memorando boolean,
    contratacion boolean,
    insumo_paa boolean,
    dependencia character varying(100),
    sub_dependencia character varying(100),
    obligaciones text,
    observaciones text,
    envio_2 text,
    notas integer,
    estado_nohay character varying(100),
    perfil character varying(100)
);

-- datos_contractuales
CREATE TABLE datos_contractuales
(
    id_contrato integer,
    id_persona integer,
    contrato character varying(50),
    honorarios numeric(15,2),
    cdp character varying(50),
    crp character varying(50),
    fecha_inicio date,
    fecha_terminacion date,
    estado_proceso character varying(100),
    id_tipo_movimiento integer,
    id_nivel_riesgo integer
);

-- datos_no_hay
CREATE TABLE datos_no_hay
(
    id_no_hay integer,
    sipse character varying(50),
    fecha_solicitud date,
    fecha_vencimiento date,
    perfil_sipse text,
    numero_no_hay character varying(50),
    abogado_a_cargo character varying(100)
);

-- datos_personales
CREATE TABLE datos_personales
(
    id_persona integer,
    id_identificacion integer,
    primer_nombre character varying(100),
    segundo_nombre character varying(100),
    apellido_paterno character varying(100),
    apellido_materno character varying(100),
    telefono character(10),
    correo character varying(150)
);

-- django_admin_log
CREATE TABLE django_admin_log
(
    id integer,
    action_time timestamp with time zone,
    object_id text,
    object_repr character varying(200),
    action_flag smallint,
    change_message text,
    content_type_id integer,
    user_id integer
);

-- django_content_type
CREATE TABLE django_content_type
(
    id integer,
    app_label character varying(100),
    model character varying(100)
);

-- django_migrations
CREATE TABLE django_migrations
(
    id bigint,
    app character varying(255),
    name character varying(255),
    applied timestamp with time zone
);

-- django_session
CREATE TABLE django_session
(
    session_key character varying(40),
    session_data text,
    expire_date timestamp with time zone
);

-- geo_referencia
CREATE TABLE geo_referencia
(
    id_georeferencia integer,
    id_persona integer,
    direccion character varying(200),
    barrio character varying(100),
    localidad character varying(100),
    ciudad character varying(100),
    departamento character varying(100)
);

-- historico_entrevistas
CREATE TABLE historico_entrevistas
(
    id_entrevista integer,
    id_persona integer,
    fecha_entrevista date,
    nivel_actual character varying(100),
    area_actual character varying(100),
    titulo_academico character varying(200),
    url_hv text,
    hv_modificada boolean,
    observaciones text
);

-- identificacion
CREATE TABLE identificacion
(
    id_identificacion integer,
    numero_identificacion bigint,
    lugar_expedicion character varying(100),
    fecha_expedicion date,
    tipo_documento character varying(50)
);

-- nivel_riesgo
CREATE TABLE nivel_riesgo
(
    id_riesgo integer,
    nivel integer,
    descripcion character varying(100)
);

-- notas_alcaldia
CREATE TABLE notas_alcaldia
(
    id_nota integer,
    id_persona integer,
    numero_nota smallint,
    observaciones text
);

-- persona_roles
CREATE TABLE persona_roles
(
    id_persona integer,
    id_rol integer
);

-- personas_no_hay
CREATE TABLE personas_no_hay
(
    id_persona integer,
    id_no_hay integer
);

-- roles
CREATE TABLE roles
(
    id_rol integer,
    id_subgrupo integer,
    nombre_rol character varying(255)
);

-- subgrupos
CREATE TABLE subgrupos
(
    id_subgrupo integer,
    id_area integer,
    nombre_subgrupo character varying(255)
);

-- tipo_movimiento
CREATE TABLE tipo_movimiento
(
    id_tipo integer,
    nombre_tipo character varying(50)
);

-- v_id_persona
CREATE TABLE v_id_persona
(
    id_persona integer
);

