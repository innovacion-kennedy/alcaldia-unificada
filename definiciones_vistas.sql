-- vista_despacho
CREATE OR REPLACE VIEW vista_despacho AS
 SELECT dp.primer_nombre,
    dp.segundo_nombre,
    dp.apellido_paterno,
    dp.apellido_materno,
    i.numero_identificacion AS identificacion,
    COALESCE(he.fecha_entrevista, CURRENT_DATE) AS fecha_entrevista,
    COALESCE(dp.telefono, 'No especificado'::bpchar) AS telefono,
    COALESCE(dp.correo, 'No especificado'::character varying) AS correo,
    COALESCE(he.nivel_actual, 'Desconocido'::character varying) AS nivel_actual,
    COALESCE(he.area_actual, 'No especificado'::character varying) AS area_actual,
    COALESCE(he.url_hv, ('No especificado'::character varying)::text) AS url_hv,
    COALESCE(dnh.perfil_sipse, 'Sin perfil'::text) AS perfil_sipse,
    COALESCE(a.nombre_area, 'No especificado'::character varying) AS areas,
    COALESCE(s.nombre_subgrupo, 'No especificado'::character varying) AS subgrupos,
    COALESCE(r.nombre_rol, 'No especificado'::character varying) AS roles,
    COALESCE(nr.nivel, 0) AS riesgo,
    COALESCE(dc.contrato, 'Sin contrato'::character varying) AS contrato,
    COALESCE(dnh.sipse, 'No especificado'::character varying) AS sipse,
    COALESCE(dnh.numero_no_hay, 'No asignado'::character varying) AS numero_no_hay,
    COALESCE(dnh.fecha_solicitud, CURRENT_DATE) AS fecha_solicitud,
    COALESCE(dnh.fecha_vencimiento, ((CURRENT_DATE + '30 days'::interval))::date) AS fecha_vencimiento_no_hay,
    COALESCE(dc.cdp, 'Sin CDP'::character varying) AS cdp,
    COALESCE(dc.crp, 'Sin CRP'::character varying) AS crp,
    COALESCE(dc.estado_proceso, 'En proceso'::character varying) AS estado_proceso,
    COALESCE((na.numero_nota)::integer, 0) AS numero_nota,
    COALESCE(tm.nombre_tipo, 'Sin tipo'::character varying) AS tipo_movimiento,
    COALESCE(dc.fecha_inicio, CURRENT_DATE) AS fecha_inicio,
    COALESCE(dc.fecha_terminacion, ((CURRENT_DATE + '1 year'::interval))::date) AS fecha_terminacion,
    COALESCE(dc.honorarios, (0)::numeric) AS honorarios,
    COALESCE(dnh.abogado_a_cargo, 'No asignado'::character varying) AS abogado_a_cargo
   FROM ((((((((((((datos_personales dp
     JOIN identificacion i ON ((dp.id_identificacion = i.id_identificacion)))
     LEFT JOIN historico_entrevistas he ON ((dp.id_persona = he.id_persona)))
     LEFT JOIN personas_no_hay pnh ON ((dp.id_persona = pnh.id_persona)))
     LEFT JOIN datos_no_hay dnh ON ((pnh.id_no_hay = dnh.id_no_hay)))
     LEFT JOIN persona_roles pr ON ((dp.id_persona = pr.id_persona)))
     LEFT JOIN roles r ON ((pr.id_rol = r.id_rol)))
     LEFT JOIN subgrupos s ON ((r.id_subgrupo = s.id_subgrupo)))
     LEFT JOIN areas a ON ((s.id_area = a.id_area)))
     LEFT JOIN datos_contractuales dc ON ((dp.id_persona = dc.id_persona)))
     LEFT JOIN tipo_movimiento tm ON ((dc.id_tipo_movimiento = tm.id_tipo)))
     LEFT JOIN nivel_riesgo nr ON ((dc.id_nivel_riesgo = nr.id_riesgo)))
     LEFT JOIN notas_alcaldia na ON ((dp.id_persona = na.id_persona)));;


