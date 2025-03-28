# 📘 Documentación de la Base de Datos `alcaldia_unificada`

## 🧱 areas

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_area | integer | NO |
| 2 | nombre_area | character varying | YES |

## 🧱 auth_group

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | integer | NO |
| 2 | name | character varying | NO |

## 🧱 auth_group_permissions

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | bigint | NO |
| 2 | group_id | integer | NO |
| 3 | permission_id | integer | NO |

## 🧱 auth_permission

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | integer | NO |
| 2 | name | character varying | NO |
| 3 | content_type_id | integer | NO |
| 4 | codename | character varying | NO |

## 🧱 auth_user

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | integer | NO |
| 2 | password | character varying | NO |
| 3 | last_login | timestamp with time zone | YES |
| 4 | is_superuser | boolean | NO |
| 5 | username | character varying | NO |
| 6 | first_name | character varying | NO |
| 7 | last_name | character varying | NO |
| 8 | email | character varying | NO |
| 9 | is_staff | boolean | NO |
| 10 | is_active | boolean | NO |
| 11 | date_joined | timestamp with time zone | NO |

## 🧱 auth_user_groups

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | bigint | NO |
| 2 | user_id | integer | NO |
| 3 | group_id | integer | NO |

## 🧱 auth_user_user_permissions

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | bigint | NO |
| 2 | user_id | integer | NO |
| 3 | permission_id | integer | NO |

## 🧱 contratacion_contratacion

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | bigint | NO |
| 2 | tipo_proceso | character varying | NO |
| 3 | modalidad_seleccion | character varying | NO |
| 4 | estado | character varying | NO |
| 5 | porcentaje_tiempo_transcurrido | numeric | NO |
| 6 | numero_orden | integer | NO |
| 7 | numero_proceso | character varying | NO |
| 8 | contrato | character varying | NO |
| 9 | abogado | character varying | NO |
| 10 | tipo_persona | character varying | NO |
| 11 | contratista | character varying | NO |
| 12 | numero_identificacion | bigint | NO |
| 13 | domicilio | character varying | NO |
| 14 | telefono | bigint | NO |
| 15 | email | character varying | NO |
| 16 | sexo | character varying | NO |
| 17 | fecha_nacimiento | date | NO |
| 18 | edad | integer | NO |
| 19 | plataforma | character varying | YES |
| 20 | link_plataforma | character varying | YES |
| 21 | objeto_contrato | text | NO |
| 22 | tipo_recurso | character varying | YES |
| 23 | no_hay | integer | NO |
| 24 | fecha_expedicion_no_hay | date | NO |
| 25 | numero_sipse | integer | NO |
| 26 | numero_cdp | integer | NO |
| 27 | valor_cdp | bigint | NO |
| 28 | fecha_cdp | date | NO |
| 29 | numero_proyecto | integer | NO |
| 30 | nombre_proyecto | character varying | NO |
| 31 | fecha_suscripcion | date | NO |
| 32 | acta_inicio | boolean | NO |
| 33 | fecha_inicio_contrato | date | NO |
| 34 | fecha_terminacion_incl_prorroga | date | NO |
| 35 | fecha_terminacion_inicial | date | YES |
| 36 | dias_para_terminar | integer | NO |
| 37 | tiempo_contrato_dias | integer | NO |
| 38 | tiempo_contrato_meses | integer | NO |
| 39 | valor_inicial_contrato | bigint | NO |
| 40 | valor_total_con_adiciones | bigint | NO |
| 41 | honorarios_mensuales | bigint | NO |
| 42 | valor_total_contrato_letras | text | NO |
| 43 | numero_rp | integer | NO |
| 44 | valor_rp | bigint | NO |
| 45 | fecha_rp | date | NO |
| 46 | fecha_aprobacion_poliza | date | NO |
| 47 | designacion | character varying | NO |
| 48 | supervisor | character varying | NO |
| 49 | apoyo_supervision | character varying | NO |
| 50 | dependencia | character varying | NO |
| 51 | sub_dependencia_rol | character varying | NO |
| 52 | rol | character varying | NO |
| 53 | arl_nombre | character varying | YES |
| 54 | nivel_riesgo_arl | character varying | NO |
| 55 | fecha_inicio_suspension | date | YES |
| 56 | fecha_final_suspension | date | YES |
| 57 | plazo_suspension | integer | YES |
| 58 | unidad_plazo | character varying | YES |
| 59 | fecha_inicio_suspension2 | date | YES |
| 60 | fecha_final_suspension3 | date | YES |
| 61 | plazo_suspension4 | integer | YES |
| 62 | unidad_plazo5 | character varying | YES |
| 63 | cedente | character varying | YES |
| 64 | cesionario | character varying | YES |
| 65 | direccion_cedente | character varying | YES |
| 66 | telefono_cedente | bigint | YES |
| 67 | correo_cedente | character varying | YES |
| 68 | identificacion_cedente | bigint | YES |
| 69 | fecha_modificacion_cesion | date | YES |
| 70 | fecha_inicio_cesion | date | YES |
| 71 | numero_sipse_adicion | integer | YES |
| 72 | fecha_terminacion_con_adicion | date | YES |
| 73 | tiempo_adicion | integer | YES |
| 74 | cdp_adicion | integer | YES |
| 75 | fecha_cdp_adicion | date | YES |
| 76 | valor_adicion | bigint | YES |
| 77 | fecha_adicion | date | YES |
| 78 | rp_adicion | integer | YES |
| 79 | fecha_rp_adicion | date | YES |
| 80 | numero_sipse_adicion_2 | integer | YES |
| 81 | fecha_terminacion_con_adicion_2 | date | YES |
| 82 | tiempo_adicion_2 | integer | YES |
| 83 | cdp_2 | integer | YES |
| 84 | fecha_cdp2 | date | YES |
| 85 | valor_adicion_2 | bigint | YES |
| 86 | fecha_adicion_2 | date | YES |
| 87 | rp_adicion_2 | integer | YES |
| 88 | fecha_rp_adicion_2 | date | YES |
| 89 | fecha_prorroga | date | YES |
| 90 | plazo_prorroga | integer | YES |
| 91 | nueva_fecha_terminacion | date | YES |
| 92 | fecha_prorroga_2 | date | YES |
| 93 | plazo_prorroga_2 | integer | YES |
| 94 | nueva_fecha_terminacion_2 | date | YES |
| 95 | fecha_prorroga_3 | date | YES |
| 96 | plazo_prorroga_3 | integer | YES |
| 97 | nueva_fecha_terminacion_3 | date | YES |
| 98 | revision_contractual | text | YES |

## 🧱 cps_planta_cpsplanta

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | duplicar | integer | NO |
| 2 | cedula | bigint | NO |
| 3 | nombres | character varying | NO |
| 4 | fecha_terminacion_contrato | date | NO |
| 5 | proyecto | character varying | NO |
| 6 | actividad | character varying | YES |
| 7 | objeto | text | NO |
| 8 | honorarios | integer | NO |
| 9 | vlr_presupuesto | integer | NO |
| 10 | tiempo_meses | integer | NO |
| 11 | numero_personas_solicitadas | integer | NO |
| 12 | nivel_academico | character varying | NO |
| 13 | riesgo | character varying | NO |
| 14 | sipse | integer | YES |
| 15 | responsable | character varying | NO |
| 16 | vto_nohay | date | NO |
| 17 | gestor | character varying | YES |
| 18 | cdp | boolean | NO |
| 19 | memorando | boolean | NO |
| 20 | contratacion | boolean | NO |
| 21 | insumo_paa | boolean | YES |
| 22 | dependencia | character varying | NO |
| 23 | sub_dependencia | character varying | NO |
| 24 | obligaciones | text | NO |
| 25 | observaciones | text | YES |
| 26 | envio_2 | text | YES |
| 27 | notas | integer | YES |
| 28 | estado_nohay | character varying | YES |
| 29 | perfil | character varying | YES |

## 🧱 datos_contractuales

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_contrato | integer | NO |
| 2 | id_persona | integer | NO |
| 3 | contrato | character varying | YES |
| 4 | honorarios | numeric | YES |
| 5 | cdp | character varying | YES |
| 6 | crp | character varying | YES |
| 7 | fecha_inicio | date | YES |
| 8 | fecha_terminacion | date | YES |
| 9 | estado_proceso | character varying | YES |
| 10 | id_tipo_movimiento | integer | YES |
| 11 | id_nivel_riesgo | integer | YES |

## 🧱 datos_no_hay

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_no_hay | integer | NO |
| 2 | sipse | character varying | YES |
| 3 | fecha_solicitud | date | YES |
| 4 | fecha_vencimiento | date | YES |
| 5 | perfil_sipse | text | YES |
| 6 | numero_no_hay | character varying | YES |
| 7 | abogado_a_cargo | character varying | YES |

## 🧱 datos_personales

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_persona | integer | NO |
| 2 | id_identificacion | integer | NO |
| 3 | primer_nombre | character varying | YES |
| 4 | segundo_nombre | character varying | YES |
| 5 | apellido_paterno | character varying | YES |
| 6 | apellido_materno | character varying | YES |
| 7 | telefono | character | YES |
| 8 | correo | character varying | YES |

## 🧱 django_admin_log

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | integer | NO |
| 2 | action_time | timestamp with time zone | NO |
| 3 | object_id | text | YES |
| 4 | object_repr | character varying | NO |
| 5 | action_flag | smallint | NO |
| 6 | change_message | text | NO |
| 7 | content_type_id | integer | YES |
| 8 | user_id | integer | NO |

## 🧱 django_content_type

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | integer | NO |
| 3 | app_label | character varying | NO |
| 4 | model | character varying | NO |

## 🧱 django_migrations

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id | bigint | NO |
| 2 | app | character varying | NO |
| 3 | name | character varying | NO |
| 4 | applied | timestamp with time zone | NO |

## 🧱 django_session

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | session_key | character varying | NO |
| 2 | session_data | text | NO |
| 3 | expire_date | timestamp with time zone | NO |

## 🧱 geo_referencia

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_georeferencia | integer | NO |
| 2 | id_persona | integer | NO |
| 3 | direccion | character varying | YES |
| 4 | barrio | character varying | YES |
| 5 | localidad | character varying | YES |
| 6 | ciudad | character varying | YES |
| 7 | departamento | character varying | YES |

## 🧱 historico_entrevistas

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_entrevista | integer | NO |
| 2 | id_persona | integer | NO |
| 3 | fecha_entrevista | date | YES |
| 4 | nivel_actual | character varying | YES |
| 5 | area_actual | character varying | YES |
| 6 | titulo_academico | character varying | YES |
| 7 | url_hv | text | YES |
| 8 | hv_modificada | boolean | YES |
| 9 | observaciones | text | YES |

## 🧱 identificacion

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_identificacion | integer | NO |
| 2 | numero_identificacion | bigint | NO |
| 3 | lugar_expedicion | character varying | YES |
| 4 | fecha_expedicion | date | YES |
| 5 | tipo_documento | character varying | YES |

## 🧱 nivel_riesgo

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_riesgo | integer | NO |
| 2 | nivel | integer | YES |
| 3 | descripcion | character varying | YES |

## 🧱 notas_alcaldia

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_nota | integer | NO |
| 2 | id_persona | integer | NO |
| 3 | numero_nota | smallint | NO |
| 4 | observaciones | text | YES |

## 🧱 persona_roles

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_persona | integer | NO |
| 2 | id_rol | integer | NO |

## 🧱 personas_no_hay

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_persona | integer | NO |
| 2 | id_no_hay | integer | NO |

## 🧱 roles

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_rol | integer | NO |
| 2 | id_subgrupo | integer | NO |
| 3 | nombre_rol | character varying | NO |

## 🧱 subgrupos

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_subgrupo | integer | NO |
| 2 | id_area | integer | NO |
| 3 | nombre_subgrupo | character varying | NO |

## 🧱 tipo_movimiento

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_tipo | integer | NO |
| 2 | nombre_tipo | character varying | YES |

## 🧱 v_id_persona

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | id_persona | integer | YES |

## 🧱 vista_despacho

| Posición | Columna | Tipo de Dato | Acepta NULL |
|----------|---------|---------------|--------------|
| 1 | primer_nombre | character varying | YES |
| 2 | segundo_nombre | character varying | YES |
| 3 | apellido_paterno | character varying | YES |
| 4 | apellido_materno | character varying | YES |
| 5 | identificacion | bigint | YES |
| 6 | fecha_entrevista | date | YES |
| 7 | telefono | character | YES |
| 8 | correo | character varying | YES |
| 9 | nivel_actual | character varying | YES |
| 10 | area_actual | character varying | YES |
| 11 | url_hv | text | YES |
| 12 | perfil_sipse | text | YES |
| 13 | areas | character varying | YES |
| 14 | subgrupos | character varying | YES |
| 15 | roles | character varying | YES |
| 16 | riesgo | integer | YES |
| 17 | contrato | character varying | YES |
| 18 | sipse | character varying | YES |
| 19 | numero_no_hay | character varying | YES |
| 20 | fecha_solicitud | date | YES |
| 21 | fecha_vencimiento_no_hay | date | YES |
| 22 | cdp | character varying | YES |
| 23 | crp | character varying | YES |
| 24 | estado_proceso | character varying | YES |
| 25 | numero_nota | integer | YES |
| 26 | tipo_movimiento | character varying | YES |
| 27 | fecha_inicio | date | YES |
| 28 | fecha_terminacion | date | YES |
| 29 | honorarios | numeric | YES |
| 30 | abogado_a_cargo | character varying | YES |

