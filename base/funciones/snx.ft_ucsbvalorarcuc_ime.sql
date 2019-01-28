-- FUNCTION: snx.ft_ucsbvalorarcuc_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbvalorarcuc_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbvalorarcuc_ime(
	p_administrador integer,
	p_id_usuario integer,
	p_tabla character varying,
	p_transaccion character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_ucsbvalorarcuc_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucsbvalorarcuc'
 AUTOR: 		 (admin)
 FECHA:	        09-11-2018 18:38:46
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				09-11-2018 18:38:46								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucsbvalorarcuc'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucsvalorarcuc	integer;
	id_terrenosbint integer;
	id_revistaint integer;
	potenciaint numeric;
	calculoaislamiento numeric;
	altura numeric;
	id_claseaislacionint integer;
BEGIN

    v_nombre_funcion = 'snx.ft_ucsbvalorarcuc_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_SBVC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-11-2018 18:38:46
	***********************************/

	if(p_transaccion='SNX_SBVC_INS')then
        begin
			altura := (SELECT valor.altura FROM snx.tucsbvalorar valor WHERE id_ucsbvalorar = v_parametros.id_ucsbvalorar);
			calculoaislamiento := (SELECT 		COALESCE(NULLIF(regexp_replace(A.tensionservicio, '\D','','g'), '')::numeric, 0) / (1 - (altura - 1000.0) / 10000.0)  AS result 
								   FROM 		snx.ttensionservicio A
								   INNER JOIN	snx.tunidadconstructivasb B ON A.id_tensionservicio = B.id_tensionservicio
								   WHERE 		B.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb);
			id_claseaislacionint := (SELECT	id_claseaislacion
									FROM	(
											SELECT id_claseaislacion,
													CASE REPLACE(claseaislacion,regexp_replace(claseaislacion, '\d+\.?\d*','','g'),'')
														WHEN '' THEN 0
														ELSE REPLACE(claseaislacion,regexp_replace(claseaislacion, '\d+\.?\d*','','g'),'')::numeric
													END AS valor
											FROM snx.tclaseaislacion
											) Valores
									WHERE	(Valores.valor - calculoaislamiento > 0 AND Valores.valor > calculoaislamiento) OR (id_claseaislacion = 9 AND Valores.valor <= calculoaislamiento)
									ORDER BY valor ASC limit 1);
			
			--Actualizar Equipos
			PERFORM snx.calcularcantidadequiposusb(v_parametros.id_unidadconstructivasb,id_claseaislacionint);
			
			--Actualizar maquinaria
			UPDATE	snx.tmaquinaria
			SET		potencia = v_parametros.potencia
			FROM 	snx.tucsbmaquinaria ucsbm			
			WHERE	tmaquinaria.id_maquinaria = ucsbm.id_maquinaria AND 
					tmaquinaria.id_tipopreciomaquinaria = 2 AND
					ucsbm.cantidadmaq > 0;
					
			--Actualizar valores UCSB
			UPDATE	snx.tunidadconstructivasb
			SET		alturainstalacion = tucsbvalorar.altura,
					distanciatransporte = tucsbvalorar.distanciatransext,
					distanciatransportemate  = tucsbvalorar.distanciatransnac,
					numerobahias = tucsbvalorar.numerobahias,
					id_claseaislacion = id_claseaislacionint
			FROM	snx.tucsbvalorar
			WHERE	tunidadconstructivasb.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb AND tucsbvalorar.id_ucsbvalorar = v_parametros.id_ucsbvalorar;
			
			id_terrenosbint := (SELECT id_terrenosb FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar = v_parametros.id_ucsbvalorar);
			id_revistaint := (SELECT id_revista FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar = v_parametros.id_ucsbvalorar);			
			
			--Actualizar Cálculos
			PERFORM snx.calcularprecioucsbsingle(v_parametros.id_unidadconstructivasb,id_terrenosbint,id_revistaint);
			
        	--Sentencia de la insercion
        	insert into snx.tucsbvalorarcuc
			(
				cantidaditem,
				potencia,
				codigo,
				valorucsbcont,
				valorucsbog,
				descripcion,
				valorucsbm,
				id_tensionservicio,
				estado_reg,
				valorucsbtotal,
				valorucsbmate,
				valorucsbe,
				id_ucsbvalorar,
				id_usuario_ai,
				id_usuario_reg,
				fecha_reg,
				usuario_ai,
				id_usuario_mod,
				fecha_mod
          	) 
			SELECT		v_parametros.cantidaditem,
						v_parametros.potencia,
						ucsb.codigo,
						ucsb.valorucsdcont,
						ucsb.valorucsog,
						ucsb.descripcion,
						ucsb.valorucsbm,
						ucsb.id_tensionservicio,
						'activo',
						ucsb.valorucstotal,
						ucsb.valorucsbmate,
						ucsb.valorucsbe,
						v_parametros.id_ucsbvalorar,
						v_parametros._id_usuario_ai,
						p_id_usuario,
						now(),
						v_parametros._nombre_usuario_ai,
						null,
						null
			FROM		snx.tunidadconstructivasb ucsb
			WHERE		ucsb.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb
			RETURNING 	id_ucsvalorarcuc into v_id_ucsvalorarcuc;			
			
			--Equipo
			INSERT INTO snx.tucsbvalorarcuce
			(
				id_ucsbvalorarcuc, id_equipo, equipo, unidadabrer, cantidadequ, valorunitario, valortotal,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			select		v_id_ucsvalorarcuc AS id_ucsbvalorarcuc,
						ucsbe.id_equipo,									
						equ.equipo,
						'' AS unidadabrer,
						ucsbe.cantidadequ,
						cast(snx.calcularprecioequipo(ucsbe.id_equipo) as numeric(18,2)) AS valorunitario,
						cast(ucsbe.cantidadequ * snx.calcularprecioequipo(ucsbe.id_equipo) as numeric(18,2)) AS valortotal,
						'activo' AS estado_reg,
						v_parametros._id_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						now() AS fecha_reg,
						v_parametros._nombre_usuario_ai AS usuario_ai,
						null AS fecha_mod
			from 		snx.tucsbequipo ucsbe
			inner join 	snx.tequipo equ on ucsbe.id_equipo = equ.id_equipo
			where 		ucsbe.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb AND ucsbe.cantidadequ > 0;			
			
																												  
			--Maquinaria
			INSERT INTO snx.tucsbvalorarcucm
			(
				id_ucsbvalorarcuc, id_maquinaria, maquinaria, cantidadmaq, valorunitario, valortotal,
				estado_reg,id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			select		v_id_ucsvalorarcuc AS id_ucsbvalorarcuc,			
						ucsbm.id_maquinaria,
						maq.maquinaria,
						ucsbm.cantidadmaq,
						cast(snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) as numeric(18,2)) AS valorunitario,
						cast(ucsbm.cantidadmaq * snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) as numeric(18,2)) AS valortotal,
						'activo' AS estado_reg,
						v_parametros._id_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						now() AS fecha_reg,
						v_parametros._nombre_usuario_ai AS usuario_ai,
						null AS fecha_mod
			from 		snx.tucsbmaquinaria ucsbm
			inner join 	snx.tmaquinaria maq on ucsbm.id_maquinaria = maq.id_maquinaria
			where		ucsbm.id_ucsbmaquinaria = v_parametros.id_unidadconstructivasb AND ucsbm.cantidadmaq > 0;

			--Materiales
			INSERT INTO snx.tucsbvalorarcucmate
			(
				id_ucsbvalorarcuc, id_material, material, unidadbrev, cantidadmate, valorunitarioext, valortotalext, valorunitarionac, valortotalnac,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			SELECT  	v_id_ucsvalorarcuc AS id_ucsbvalorarcuc,          
						mate.id_material,
						mate.material,
						uni.unidadabrev AS unidadbrev,
						cast(SUM(mate.cantidadmate) as numeric(18,2)) AS cantidadmate,
						cast(snx.calcularpreciomaterial(id_material) as numeric(18,2)) AS valorunitarioext,
						cast(SUM(mate.cantidadmate) * snx.calcularpreciomaterial(id_material) as numeric(18,2)) AS valortotalext,			
						0.0 AS valorunitarionac, 
						0.0 AS valortotalnac,
						'activo' AS estado_reg,
						v_parametros._id_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						now() AS fecha_reg,
						v_parametros._nombre_usuario_ai AS usuario_ai,
						null AS fecha_mod
			FROM 		(
						SELECT 		ucsb.id_unidadconstructivasb,
									ucsb.codigo,
									ucsb.descripcion,                                           
									mate.id_material,
									mate.material,
									mate.id_unidad,
									emate.cantidadequimat * ucsbe.cantidadequ AS cantidadmate
						FROM 		snx.tucsbequipo ucsbe
						INNER JOIN 	snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
						INNER JOIN 	snx.tequipomaterial emate ON ucsbe.id_equipo = emate.id_equipo
						INNER JOIN 	snx.tmaterial mate ON emate.id_material = mate.id_material
						WHERE 		ucsbe.cantidadequ > 0 AND emate.cantidadequimat > 0 AND ucsb.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb
						GROUP BY 	ucsb.id_unidadconstructivasb,
									ucsb.codigo,
									ucsb.descripcion,                                           
									mate.id_material,
									mate.material,
									mate.id_unidad,
									emate.cantidadequimat,
									ucsbe.cantidadequ
						UNION ALL
						SELECT 		ucsb.id_unidadconstructivasb,
									ucsb.codigo,
									ucsb.descripcion,                                           
									mate.id_material,
									mate.material,
									mate.id_unidad,
									mmate.cantidadmate * ucsbm.cantidadmaq AS cantidadmate
									FROM snx.tucsbmaquinaria ucsbm
									INNER JOIN snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
									INNER JOIN snx.tmaquinariamaterial mmate ON ucsbm.id_maquinaria = mmate.id_maquinaria
									INNER JOIN snx.tmaterial mate ON mmate.id_material = mate.id_material
						WHERE 		ucsbm.cantidadmaq > 0 AND mmate.cantidadmate > 0 AND ucsb.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb
						GROUP BY 	ucsb.id_unidadconstructivasb,
									ucsb.codigo,
									ucsb.descripcion,                                           
									mate.id_material,
									mate.material,
									mate.id_unidad,
									mmate.cantidadmate,
									ucsbm.cantidadmaq) mate
			left join 	snx.tunidad uni on mate.id_unidad = uni.id_unidad
			GROUP BY 	mate.id_material,
						mate.material,
						uni.unidadabrev;
			
			--Gastos Contratista
			INSERT INTO snx.tucsbvalorarcuccont
			(
				id_ucsbvalorarcuc, id_obracivil, obracivil, unidadbrev, cantidadpeso, valorunitario, valorobracivil,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			select  v_id_ucsvalorarcuc AS id_ucsbvalorarcuc,
                               calc.id_obracivil,
                               calc.obracivil,
                               calc.unidadabrev,
                               cast(calc.cantidadpeso as numeric(18,2)) as cantidadpeso,                               
                               cast(calc.valorunitario as numeric(18,2)) as valorunitario,
							   cast(calc.valorobracivil as numeric(18,2)) as valorobracivil,
							   'activo' AS estado_reg,
								v_parametros._id_usuario_ai,
								p_id_usuario AS id_usuario_reg,
								now() AS fecha_reg,
								v_parametros._nombre_usuario_ai AS usuario_ai,
								null AS fecha_mod	
			from      snx.calcularobracivilucsb(v_parametros.id_unidadconstructivasb, id_revistaint) calc;
			
			--Otros Gastos
			INSERT INTO snx.tucsbvalorarcucog
			(
				id_ucsbvalorarcuc, id_item, otrosgastos, cantidadog, valorunitario, valorog,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			SELECT 	v_id_ucsvalorarcuc AS id_ucsbvalorarcuc,
								ogas.id_item,
								ogas.otrosgastos,
								ogas.cantidadog,
								ogas.valorunitario,
								ogas.valorog,
								'activo' AS estado_reg,
								v_parametros._id_usuario_ai,
								p_id_usuario AS id_usuario_reg,
								now() AS fecha_reg,
								v_parametros._nombre_usuario_ai AS usuario_ai,
								null AS fecha_mod	
			FROM snx.calcularotrosgastosucsb(v_parametros.id_unidadconstructivasb) ogas;	
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Subestacion ValorarC almacenado(a) con exito (id_ucsvalorarcuc'||v_id_ucsvalorarcuc||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsvalorarcuc',v_id_ucsvalorarcuc::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SBVC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-11-2018 18:38:46
	***********************************/

	elsif(p_transaccion='SNX_SBVC_MOD')then
		begin
			altura := (SELECT valor.altura FROM snx.tucsbvalorar valor WHERE id_ucsbvalorar = v_parametros.id_ucsbvalorar);
			calculoaislamiento := (SELECT 		COALESCE(NULLIF(regexp_replace(A.tensionservicio, '\D','','g'), '')::numeric, 0) / (1 - (altura - 1000.0) / 10000.0)  AS result 
								   FROM 		snx.ttensionservicio A
								   INNER JOIN	snx.tunidadconstructivasb B ON A.id_tensionservicio = B.id_tensionservicio
								   WHERE 		B.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb);
			id_claseaislacionint := (SELECT	id_claseaislacion
									FROM	(
											SELECT id_claseaislacion,
													CASE REPLACE(claseaislacion,regexp_replace(claseaislacion, '\d+\.?\d*','','g'),'')
														WHEN '' THEN 0
														ELSE REPLACE(claseaislacion,regexp_replace(claseaislacion, '\d+\.?\d*','','g'),'')::numeric
													END AS valor
											FROM snx.tclaseaislacion
											) Valores
									WHERE	(Valores.valor - calculoaislamiento > 0 AND Valores.valor > calculoaislamiento) OR (id_claseaislacion = 9 AND Valores.valor <= calculoaislamiento)
									ORDER BY valor ASC limit 1);					   
			
			--Actualizar Equipos
			PERFORM snx.calcularcantidadequiposusb(v_parametros.id_unidadconstructivasb,id_claseaislacionint);
						
			--Actualizar maquinaria
			UPDATE	snx.tmaquinaria
			SET		potencia = v_parametros.potencia
			FROM 	snx.tucsbmaquinaria ucsbm			
			WHERE	tmaquinaria.id_maquinaria = ucsbm.id_maquinaria AND 
					tmaquinaria.id_tipopreciomaquinaria = 2 AND
					ucsbm.cantidadmaq > 0;
																   
			--Actualizar valores UCSB
			UPDATE	snx.tunidadconstructivasb
			SET		alturainstalacion = tucsbvalorar.altura,
					distanciatransporte = tucsbvalorar.distanciatransext,
					distanciatransportemate  = tucsbvalorar.distanciatransnac,
					numerobahias = tucsbvalorar.numerobahias,
					id_claseaislacion = id_claseaislacionint
			FROM	snx.tucsbvalorar
			WHERE	tunidadconstructivasb.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb AND tucsbvalorar.id_ucsbvalorar = v_parametros.id_ucsbvalorar;
			
			id_terrenosbint := (SELECT id_terrenosb FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar = v_parametros.id_ucsbvalorar);
			id_revistaint := (SELECT id_revista FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar = v_parametros.id_ucsbvalorar);			
			
			--Actualizar Cálculos
			PERFORM snx.calcularprecioucsbsingle(v_parametros.id_unidadconstructivasb,id_terrenosbint,id_revistaint);
																   
			--Sentencia de la modificacion
			update 		snx.tucsbvalorarcuc 
			set																		   
			cantidaditem = v_parametros.cantidaditem,
			potencia = v_parametros.potencia,
			codigo = datosuc.codigo,
			valorucsbcont = datosuc.valorucsdcont,
			valorucsbog = datosuc.valorucsog,
			descripcion = datosuc.descripcion,
			valorucsbm = datosuc.valorucsbm,
			id_tensionservicio = datosuc.id_tensionservicio,
			valorucsbtotal = datosuc.valorucstotal,
			valorucsbmate = datosuc.valorucsbmate,
			valorucsbe = datosuc.valorucsbe,
			id_ucsbvalorar = v_parametros.id_ucsbvalorar,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			FROM	(
					SELECT		v_parametros.id_ucsvalorarcuc AS id_ucsvalorarcuc,
								ucsb.codigo,
								ucsb.valorucsdcont,
								ucsb.valorucsog,
								ucsb.descripcion,
								ucsb.valorucsbm,
								ucsb.id_tensionservicio,
								ucsb.valorucstotal,
								ucsb.valorucsbmate,
								ucsb.valorucsbe
					FROM		snx.tunidadconstructivasb ucsb
					WHERE		ucsb.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb
					) datosuc															   
			where 	tucsbvalorarcuc.id_ucsvalorarcuc=v_parametros.id_ucsvalorarcuc AND 
					tucsbvalorarcuc.id_ucsvalorarcuc = datosuc.id_ucsvalorarcuc;
																   
			DELETE FROM snx.tucsbvalorarcuce WHERE id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			DELETE FROM snx.tucsbvalorarcucm WHERE id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			DELETE FROM snx.tucsbvalorarcucmate WHERE id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			DELETE FROM snx.tucsbvalorarcuccont WHERE id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			DELETE FROM snx.tucsbvalorarcucog WHERE id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;				   
																   
			--Equipo
			INSERT INTO snx.tucsbvalorarcuce
			(
				id_ucsbvalorarcuc, id_equipo, equipo, unidadabrer, cantidadequ, valorunitario, valortotal,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			select		v_parametros.id_ucsvalorarcuc AS id_ucsbvalorarcuc,
						ucsbe.id_equipo,									
						equ.equipo,
						'' AS unidadabrer,
						ucsbe.cantidadequ,
						cast(snx.calcularprecioequipo(ucsbe.id_equipo) as numeric(18,2)) AS valorunitario,
						cast(ucsbe.cantidadequ * snx.calcularprecioequipo(ucsbe.id_equipo) as numeric(18,2)) AS valortotal,
						'activo' AS estado_reg,
						v_parametros._id_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						now() AS fecha_reg,
						v_parametros._nombre_usuario_ai AS usuario_ai,
						null AS fecha_mod
			from 		snx.tucsbequipo ucsbe
			inner join 	snx.tequipo equ on ucsbe.id_equipo = equ.id_equipo
			where 		ucsbe.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb AND ucsbe.cantidadequ > 0;			
			
																												  
			--Maquinaria
			INSERT INTO snx.tucsbvalorarcucm
			(
				id_ucsbvalorarcuc, id_maquinaria, maquinaria, cantidadmaq, valorunitario, valortotal,
				estado_reg,id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			select		v_parametros.id_ucsvalorarcuc AS id_ucsbvalorarcuc,			
						ucsbm.id_maquinaria,
						maq.maquinaria,
						ucsbm.cantidadmaq,
						cast(snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) as numeric(18,2)) AS valorunitario,
						cast(ucsbm.cantidadmaq * snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) as numeric(18,2)) AS valortotal,
						'activo' AS estado_reg,
						v_parametros._id_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						now() AS fecha_reg,
						v_parametros._nombre_usuario_ai AS usuario_ai,
						null AS fecha_mod
			from 		snx.tucsbmaquinaria ucsbm
			inner join 	snx.tmaquinaria maq on ucsbm.id_maquinaria = maq.id_maquinaria
			where		ucsbm.id_ucsbmaquinaria = v_parametros.id_unidadconstructivasb AND ucsbm.cantidadmaq > 0;

			--Materiales
			INSERT INTO snx.tucsbvalorarcucmate
			(
				id_ucsbvalorarcuc, id_material, material, unidadbrev, cantidadmate, valorunitarioext, valortotalext, valorunitarionac, valortotalnac,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			SELECT  	v_parametros.id_ucsvalorarcuc AS id_ucsbvalorarcuc,          
						mate.id_material,
						mate.material,
						uni.unidadabrev AS unidadbrev,
						cast(SUM(mate.cantidadmate) as numeric(18,2)) AS cantidadmate,
						cast(snx.calcularpreciomaterial(id_material) as numeric(18,2)) AS valorunitarioext,
						cast(SUM(mate.cantidadmate) * snx.calcularpreciomaterial(id_material) as numeric(18,2)) AS valortotalext,			
						0.0 AS valorunitarionac, 
						0.0 AS valortotalnac,
						'activo' AS estado_reg,
						v_parametros._id_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						now() AS fecha_reg,
						v_parametros._nombre_usuario_ai AS usuario_ai,
						null AS fecha_mod
			FROM 		(
						SELECT 		ucsb.id_unidadconstructivasb,
									ucsb.codigo,
									ucsb.descripcion,                                           
									mate.id_material,
									mate.material,
									mate.id_unidad,
									emate.cantidadequimat * ucsbe.cantidadequ AS cantidadmate
						FROM 		snx.tucsbequipo ucsbe
						INNER JOIN 	snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
						INNER JOIN 	snx.tequipomaterial emate ON ucsbe.id_equipo = emate.id_equipo
						INNER JOIN 	snx.tmaterial mate ON emate.id_material = mate.id_material
						WHERE 		ucsbe.cantidadequ > 0 AND emate.cantidadequimat > 0 AND ucsb.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb
						GROUP BY 	ucsb.id_unidadconstructivasb,
									ucsb.codigo,
									ucsb.descripcion,                                           
									mate.id_material,
									mate.material,
									mate.id_unidad,
									emate.cantidadequimat,
									ucsbe.cantidadequ
						UNION ALL
						SELECT 		ucsb.id_unidadconstructivasb,
									ucsb.codigo,
									ucsb.descripcion,                                           
									mate.id_material,
									mate.material,
									mate.id_unidad,
									mmate.cantidadmate * ucsbm.cantidadmaq AS cantidadmate
									FROM snx.tucsbmaquinaria ucsbm
									INNER JOIN snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
									INNER JOIN snx.tmaquinariamaterial mmate ON ucsbm.id_maquinaria = mmate.id_maquinaria
									INNER JOIN snx.tmaterial mate ON mmate.id_material = mate.id_material
						WHERE 		ucsbm.cantidadmaq > 0 AND mmate.cantidadmate > 0 AND ucsb.id_unidadconstructivasb = v_parametros.id_unidadconstructivasb
						GROUP BY 	ucsb.id_unidadconstructivasb,
									ucsb.codigo,
									ucsb.descripcion,                                           
									mate.id_material,
									mate.material,
									mate.id_unidad,
									mmate.cantidadmate,
									ucsbm.cantidadmaq) mate
			left join 	snx.tunidad uni on mate.id_unidad = uni.id_unidad
			GROUP BY 	mate.id_material,
						mate.material,
						uni.unidadabrev;
			
			--Gastos Contratista
			INSERT INTO snx.tucsbvalorarcuccont
			(
				id_ucsbvalorarcuc, id_obracivil, obracivil, unidadbrev, cantidadpeso, valorunitario, valorobracivil,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			select  v_parametros.id_ucsvalorarcuc AS id_ucsbvalorarcuc,
                               calc.id_obracivil,
                               calc.obracivil,
                               calc.unidadabrev,
                               cast(calc.cantidadpeso as numeric(18,2)) as cantidadpeso,                               
                               cast(calc.valorunitario as numeric(18,2)) as valorunitario,
							   cast(calc.valorobracivil as numeric(18,2)) as valorobracivil,
							   'activo' AS estado_reg,
								v_parametros._id_usuario_ai,
								p_id_usuario AS id_usuario_reg,
								now() AS fecha_reg,
								v_parametros._nombre_usuario_ai AS usuario_ai,
								null AS fecha_mod	
			from      snx.calcularobracivilucsb(v_parametros.id_unidadconstructivasb, id_revistaint) calc;
			
			--Otros Gastos
			INSERT INTO snx.tucsbvalorarcucog
			(
				id_ucsbvalorarcuc, id_item, otrosgastos, cantidadog, valorunitario, valorog,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			SELECT 	v_parametros.id_ucsvalorarcuc AS id_ucsbvalorarcuc,
								ogas.id_item,
								ogas.otrosgastos,
								ogas.cantidadog,
								ogas.valorunitario,
								ogas.valorog,
								'activo' AS estado_reg,
								v_parametros._id_usuario_ai,
								p_id_usuario AS id_usuario_reg,
								now() AS fecha_reg,
								v_parametros._nombre_usuario_ai AS usuario_ai,
								null AS fecha_mod	
			FROM snx.calcularotrosgastosucsb(v_parametros.id_unidadconstructivasb) ogas;																   
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Subestacion ValorarC modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsvalorarcuc',v_parametros.id_ucsvalorarcuc::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SBVC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-11-2018 18:38:46
	***********************************/

	elsif(p_transaccion='SNX_SBVC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucsbvalorarcuce where id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			delete from snx.tucsbvalorarcucm where id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			delete from snx.tucsbvalorarcucmate where id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			delete from snx.tucsbvalorarcuccont where id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			delete from snx.tucsbvalorarcucog where id_ucsbvalorarcuc = v_parametros.id_ucsvalorarcuc;
			
			--Tabla principal
			delete from snx.tucsbvalorarcuc where id_ucsvalorarcuc = v_parametros.id_ucsvalorarcuc;               
			
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Subestacion ValorarC eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsvalorarcuc',v_parametros.id_ucsvalorarcuc::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;

$BODY$;

ALTER FUNCTION snx.ft_ucsbvalorarcuc_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;