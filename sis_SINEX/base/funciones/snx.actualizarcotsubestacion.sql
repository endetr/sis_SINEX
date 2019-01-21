-- FUNCTION: snx.actualizarcotsubestacion(integer)

-- DROP FUNCTION snx.actualizarcotsubestacion(integer);

CREATE OR REPLACE FUNCTION snx.actualizarcotsubestacion(
	id_ucsbvalorar_ent integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	_id_usuario_ai INTEGER := 0;
	_nombre_usuario_ai character varying := '';
	id_unidadconstructivasb_ent INTEGER := 0;
	id_revistaint_ent INTEGER := 0;
	id_terrenosb_ent INTEGER := 0;
	id_ucsvalorarcuc_ent INTEGER := 0;	
	potenciadet NUMERIC(18,2) := 0;
	distanciatransint NUMERIC := 0;
	numerobahiasint INTEGER := 0;
	id_otraunidadent INTEGER := 0;
	calculoaislamiento numeric;
	alturaent numeric := 0;
	id_claseaislacionint integer := 0;
	rec_otrosgast RECORD;
	
	db_cursor CURSOR(id_ucsbvalorar_entcab INTEGER) 
 	FOR SELECT id_ucsvalorarcuc
 	FROM snx.tucsbvalorarcuc
 	WHERE id_ucsbvalorar = id_ucsbvalorar_entcab;
	
	db_cursorotrosgast CURSOR(id_ucsbvalorar_entcabe INTEGER) 
 	FOR SELECT id_otraunidad, id_ucsbvalorarouc
 	FROM snx.tucsbvalorarouc
 	WHERE id_ucsbvalorar = id_ucsbvalorar_entcabe;
Begin

	id_revistaint_ent:= (SELECT id_revista FROM snx.tucsbvalorar WHERE id_ucsbvalorar = id_ucsbvalorar_ent);
	id_terrenosb_ent:= (SELECT id_terrenosb FROM snx.tucsbvalorar WHERE id_ucsbvalorar = id_ucsbvalorar_ent);
	numerobahiasint := (SELECT numerobahias FROM snx.tucsbvalorar WHERE id_ucsbvalorar = id_ucsbvalorar_ent);
	distanciatransint := (SELECT distanciatransnac FROM snx.tucsbvalorar WHERE id_ucsbvalorar = id_ucsbvalorar_ent);
	
	OPEN db_cursor(id_ucsbvalorar_ent);
	
	LOOP
	-- fetch row into the film
      FETCH db_cursor INTO id_ucsvalorarcuc_ent;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;
	  
	_id_usuario_ai := (SELECT id_usuario_ai FROM snx.tucsbvalorarcuc WHERE id_ucsvalorarcuc = id_ucsvalorarcuc_ent);
	_nombre_usuario_ai := (SELECT usuario_ai FROM snx.tucsbvalorarcuc WHERE id_ucsvalorarcuc = id_ucsvalorarcuc_ent);
	potenciadet := (SELECT potencia FROM snx.tucsbvalorarcuc WHERE id_ucsvalorarcuc = id_ucsvalorarcuc_ent);
	id_unidadconstructivasb_ent:= (SELECT sub.id_unidadconstructivasb FROM snx.tucsbvalorarcuc cuc
								   inner join snx.tunidadconstructivasb sub on sub.codigo = cuc.codigo  and sub.descripcion = cuc.descripcion
								   WHERE cuc.id_ucsvalorarcuc = id_ucsvalorarcuc_ent);
								   
	alturaent := (SELECT valor.altura FROM snx.tucsbvalorar valor WHERE id_ucsbvalorar = id_ucsbvalorar_ent);
	calculoaislamiento := (SELECT 	COALESCE(NULLIF(regexp_replace(A.tensionservicio, '\D','','g'), '')::numeric, 0) / (1 - (alturaent - 1000.0) / 10000.0)  AS result 
						   FROM 		snx.ttensionservicio A
						   INNER JOIN	snx.tunidadconstructivasb B ON A.id_tensionservicio = B.id_tensionservicio
						   WHERE 		B.id_unidadconstructivasb = id_unidadconstructivasb_ent);
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
	PERFORM snx.calcularcantidadequiposusb(id_unidadconstructivasb_ent,id_claseaislacionint);
			
	--Actualizar maquinaria
	UPDATE	snx.tmaquinaria
	SET		potencia = potenciadet
	FROM 	snx.tucsbmaquinaria ucsbm			
	WHERE	tmaquinaria.id_maquinaria = ucsbm.id_maquinaria AND 
			tmaquinaria.id_tipopreciomaquinaria = 2 AND
			ucsbm.cantidadmaq > 0;
					
	--Actualizar Cálculos
	UPDATE	snx.tunidadconstructivasb
	SET		alturainstalacion = tucsbvalorar.altura,
			distanciatransporte = tucsbvalorar.distanciatransext,
			distanciatransportemate  = tucsbvalorar.distanciatransnac,
			numerobahias = tucsbvalorar.numerobahias,
			id_claseaislacion = id_claseaislacionint
	FROM	snx.tucsbvalorar
	WHERE	tunidadconstructivasb.id_unidadconstructivasb = id_unidadconstructivasb_ent and tucsbvalorar.id_ucsbvalorar = id_ucsbvalorar_ent;
			
	PERFORM snx.calcularprecioucsbsingle(id_unidadconstructivasb_ent,id_terrenosb_ent,id_revistaint_ent);	
		
		--Sentencia de la modificacion
			update 		snx.tucsbvalorarcuc 
			set	
			codigo = datosuc.codigo,
			valorucsbcont = datosuc.valorucsdcont,
			valorucsbog = datosuc.valorucsog,
			descripcion = datosuc.descripcion,
			valorucsbm = datosuc.valorucsbm,
			id_tensionservicio = datosuc.id_tensionservicio,
			valorucsbtotal = datosuc.valorucstotal,
			valorucsbmate = datosuc.valorucsbmate,
			valorucsbe = datosuc.valorucsbe,
			fecha_mod = now()
			FROM	(
					SELECT		id_ucsvalorarcuc_ent AS id_ucsvalorarcuc,
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
					WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasb_ent
					) datosuc
			where 	tucsbvalorarcuc.id_ucsvalorarcuc = id_ucsvalorarcuc_ent AND tucsbvalorarcuc.id_ucsvalorarcuc = datosuc.id_ucsvalorarcuc;
							
	DELETE FROM snx.tucsbvalorarcuce WHERE tucsbvalorarcuce.id_ucsbvalorarcuc = id_ucsvalorarcuc_ent;
	DELETE FROM snx.tucsbvalorarcucm WHERE tucsbvalorarcucm.id_ucsbvalorarcuc = id_ucsvalorarcuc_ent;
	DELETE FROM snx.tucsbvalorarcucmate WHERE tucsbvalorarcucmate.id_ucsbvalorarcuc = id_ucsvalorarcuc_ent;
	DELETE FROM snx.tucsbvalorarcuccont WHERE tucsbvalorarcuccont.id_ucsbvalorarcuc = id_ucsvalorarcuc_ent;
	DELETE FROM snx.tucsbvalorarcucog WHERE tucsbvalorarcucog.id_ucsbvalorarcuc = id_ucsvalorarcuc_ent;
		
	--Equipo
			INSERT INTO snx.tucsbvalorarcuce
			(
				id_ucsbvalorarcuc, id_equipo, equipo, unidadabrer, cantidadequ, valorunitario, valortotal,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			select		id_ucsvalorarcuc_ent AS id_ucsbvalorarcuc,
						ucsbe.id_equipo,									
						equ.equipo,
						'' AS unidadabrer,
						ucsbe.cantidadequ,
						cast(snx.calcularprecioequipo(ucsbe.id_equipo) as numeric(18,2)) AS valorunitario,
						cast(ucsbe.cantidadequ * snx.calcularprecioequipo(ucsbe.id_equipo) as numeric(18,2)) AS valortotal,
						'activo' AS estado_reg,
						_id_usuario_ai,
						_id_usuario_ai AS id_usuario_reg,
						now() AS fecha_reg,
						_nombre_usuario_ai,
						null AS fecha_mod
			from 		snx.tucsbequipo ucsbe
			inner join 	snx.tequipo equ on ucsbe.id_equipo = equ.id_equipo
			where 		ucsbe.id_unidadconstructivasb = id_unidadconstructivasb_ent AND ucsbe.cantidadequ > 0;
			
			
					
			--Maquinaria
			INSERT INTO snx.tucsbvalorarcucm
			(
				id_ucsbvalorarcuc, id_maquinaria, maquinaria, cantidadmaq, valorunitario, valortotal,
				estado_reg,id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			select		id_ucsvalorarcuc_ent AS id_ucsbvalorarcuc,			
						ucsbm.id_maquinaria,
						maq.maquinaria,
						ucsbm.cantidadmaq,
						cast(snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) as numeric(18,2)) AS valorunitario,
						cast(ucsbm.cantidadmaq * snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) as numeric(18,2)) AS valortotal,
						'activo' AS estado_reg,
						_id_usuario_ai,
						_id_usuario_ai AS id_usuario_reg,
						now() AS fecha_reg,
						_nombre_usuario_ai AS usuario_ai,
						null AS fecha_mod
			from 		snx.tucsbmaquinaria ucsbm
			inner join 	snx.tmaquinaria maq on ucsbm.id_maquinaria = maq.id_maquinaria
			where		ucsbm.id_ucsbmaquinaria = id_unidadconstructivasb_ent AND ucsbm.cantidadmaq > 0;
	
			--Materiales
			INSERT INTO snx.tucsbvalorarcucmate
			(
				id_ucsbvalorarcuc, id_material, material, unidadbrev, cantidadmate, valorunitarioext, valortotalext, valorunitarionac, valortotalnac,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			SELECT  	id_ucsvalorarcuc_ent AS id_ucsbvalorarcuc,          
						mate.id_material,
						mate.material,
						uni.unidadabrev AS unidadbrev,
						cast(SUM(mate.cantidadmate) as numeric(18,2)) AS cantidadmate,
						cast(snx.calcularpreciomaterial(id_material) as numeric(18,2)) AS valorunitarioext,
						cast(SUM(mate.cantidadmate) * snx.calcularpreciomaterial(id_material) as numeric(18,2)) AS valortotalext,			
						0.0 AS valorunitarionac, 
						0.0 AS valortotalnac,
						'activo' AS estado_reg,
						_id_usuario_ai,
						_id_usuario_ai AS id_usuario_reg,
						now() AS fecha_reg,
						_nombre_usuario_ai AS usuario_ai,
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
						WHERE 		ucsbe.cantidadequ > 0 AND emate.cantidadequimat > 0 AND ucsb.id_unidadconstructivasb = id_unidadconstructivasb_ent
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
						WHERE 		ucsbm.cantidadmaq > 0 AND mmate.cantidadmate > 0 AND ucsb.id_unidadconstructivasb = id_unidadconstructivasb_ent
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
			select  id_ucsvalorarcuc_ent AS id_ucsbvalorarcuc,
                               calc.id_obracivil,
                               calc.obracivil,
                               calc.unidadabrev,
                               cast(calc.cantidadpeso as numeric(18,2)) as cantidadpeso,                               
                               cast(calc.valorunitario as numeric(18,2)) as valorunitario,
							   cast(calc.valorobracivil as numeric(18,2)) as valorobracivil,
							   'activo' AS estado_reg,
								_id_usuario_ai,
								_id_usuario_ai AS id_usuario_reg,
								now() AS fecha_reg,
								_nombre_usuario_ai AS usuario_ai,
								null AS fecha_mod	
			from      snx.calcularobracivilucsb(id_unidadconstructivasb_ent, id_revistaint_ent) calc;
			
			--Otros Gastos
			INSERT INTO snx.tucsbvalorarcucog
			(
				id_ucsbvalorarcuc, id_item, otrosgastos, cantidadog, valorunitario, valorog,
				estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod
			)
			SELECT 	id_ucsvalorarcuc_ent AS id_ucsbvalorarcuc,
								ogas.id_item,
								ogas.otrosgastos,
								ogas.cantidadog,
								ogas.valorunitario,
								ogas.valorog,
								'activo' AS estado_reg,
								_id_usuario_ai,
								_id_usuario_ai AS id_usuario_reg,
								now() AS fecha_reg,
								_nombre_usuario_ai AS usuario_ai,
								null AS fecha_mod	
			FROM snx.calcularotrosgastosucsb(id_unidadconstructivasb_ent) ogas;
			
	END LOOP;		
	-- Close the cursor
   CLOSE db_cursor;
   
   	OPEN db_cursorotrosgast(id_ucsbvalorar_ent);	
	LOOP
	-- fetch row into the film
      FETCH db_cursorotrosgast INTO rec_otrosgast;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;
			update 	snx.tucsbvalorarouc 
			set		valortotal = OUCSB.valortotal,
					codigo = OUCSB.codigo,
					descripcion = OUCSB.descripcion,
					fecha_mod = now(),
					id_usuario_mod = 1
			FROM	snx.obtenerotrasunidadesconstructivas(CAST(rec_otrosgast.id_otraunidad AS character varying), numerobahiasint, id_revistaint_ent) OUCSB
			where 	tucsbvalorarouc.id_ucsbvalorar = id_ucsbvalorar_ent;
																   
			DELETE FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = rec_otrosgast.id_ucsbvalorarouc;
			DELETE FROM snx.tucsbvaloraroucog WHERE tucsbvaloraroucog.id_ucsbvalorarouc = rec_otrosgast.id_ucsbvalorarouc;
			
			PERFORM snx.insertarotrasucsb(rec_otrosgast.id_otraunidad, rec_otrosgast.id_ucsbvalorarouc, numerobahiasint, id_revistaint_ent, distanciatransint);																   
	  END LOOP;	  
			
   	-- Close the cursor
   CLOSE db_cursorotrosgast;
   
	RETURN;
end;

$BODY$;

ALTER FUNCTION snx.actualizarcotsubestacion(integer)
    OWNER TO dbkerp_conexion;
