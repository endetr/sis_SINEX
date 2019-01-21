-- FUNCTION: snx.calcularprecioucsb(integer, integer)

-- DROP FUNCTION snx.calcularprecioucsb(integer, integer);

CREATE OR REPLACE FUNCTION snx.calcularprecioucsb(
	id_unidadconstructivasbint integer,
	id_terrenosbint integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Begin
	DROP TABLE if exists ttempequipos;
	DROP TABLE if exists ttempmaquinaria;
	DROP TABLE if exists ttempmateriales;
	DROP TABLE if exists ttempoc;
	DROP TABLE if exists ttempog;
	
	--Cantidades equipos
	CREATE TEMP TABLE ttempequipos AS
	SELECT		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				SUM(snx.calcularprecioequipo(ucsbe.id_equipo) * ucsbe.cantidadequ) AS cantidades
	FROM		snx.tucsbequipo ucsbe
	INNER JOIN	snx.tequipo equ on ucsbe.id_equipo = equ.id_equipo
	INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
	WHERE		(ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND id_unidadconstructivasbint <> 0) OR id_unidadconstructivasbint = 0
	GROUP BY	ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion;
				
	--Cantidades maquinarias
	CREATE TEMP TABLE ttempmaquinaria AS
	SELECT		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,				
				SUM(snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) * ucsbm.cantidadmaq) AS cantidades				
	FROM		snx.tucsbmaquinaria ucsbm
	INNER JOIN	snx.tmaquinaria maq on ucsbm.id_maquinaria = maq.id_maquinaria
	INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
	WHERE		(ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND id_unidadconstructivasbint <> 0) OR id_unidadconstructivasbint = 0
	GROUP BY	ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion;
				
	--Cantidades materiales
	CREATE TEMP TABLE ttempmateriales AS
	SELECT		tunion.id_unidadconstructivasb,
				tunion.codigo,
				tunion.descripcion,
				SUM(tunion.cantidades) AS cantidades
	FROM		(
				SELECT		ucsb.id_unidadconstructivasb,
							ucsb.codigo,
							ucsb.descripcion,
							(snx.calcularpreciomaterial(MP.id_material) * EM.cantidadequimat * ucsbe.cantidadequ) AS cantidades
				FROM		snx.tequipomaterial EM
				INNER JOIN	snx.tmaterial mate ON EM.id_material = mate.id_material
				INNER JOIN	snx.tmaterialprecio MP ON EM.id_material = MP.id_material
				INNER JOIN	snx.tucsbequipo ucsbe on EM.id_equipo = ucsbe.id_equipo
				INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb	
				WHERE		(ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND id_unidadconstructivasbint <> 0) OR id_unidadconstructivasbint = 0
				UNION ALL
				SELECT		ucsb.id_unidadconstructivasb,
							ucsb.codigo,
							ucsb.descripcion,				
							(snx.calcularpreciomaterial(MP.id_material) * MM.cantidadmate * ucsbm.cantidadmaq) AS cantidades
				FROM		snx.tmaquinariamaterial MM
				INNER JOIN	snx.tmaterial mate ON MM.id_material = mate.id_material
				INNER JOIN	snx.tmaterialprecio MP ON MM.id_material = MP.id_material
				INNER JOIN	snx.tucsbmaquinaria ucsbm on MM.id_maquinaria = ucsbm.id_maquinaria
				INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb				
				WHERE		(ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND id_unidadconstructivasbint <> 0) OR id_unidadconstructivasbint = 0
				) tunion
	GROUP BY	tunion.id_unidadconstructivasb,
				tunion.codigo,
				tunion.descripcion;
				
	--Equipos
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsbe = tB.cantidades
	FROM		ttempequipos tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Maquinaria
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsbm = tB.cantidades
	FROM		ttempmaquinaria tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Materiales
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsbmate = tB.cantidades
	FROM		ttempmateriales tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Directo Contratista
	UPDATE		snx.tunidadconstructivasb 
	SET			valorucsdcont = tB.valorobracivil
	FROM		(
				SELECT		ucsb.id_unidadconstructivasb,
							SUM(toc.valorobracivil) AS valorobracivil
				FROM		snx.tunidadconstructivasb ucsb 
				INNER JOIN	snx.calcularobracivilucsbsingle(ucsb.id_unidadconstructivasb, id_terrenosbint, 1) toc ON ucsb.id_unidadconstructivasb = toc.id_unidadconstructivasb
				WHERE		(ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND id_unidadconstructivasbint <> 0) OR id_unidadconstructivasbint = 0
				GROUP BY	ucsb.id_unidadconstructivasb
				) tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Fletes, Internacionalización y otros gastos
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsflete = tB.valorucsflete,
				valorucsdinter = tB.valorucsdinter,
				valorucsog = tB.valorucsog
	FROM		(
				SELECT	tresum.id_unidadconstructivasb,
						SUM(tresum.valorucsflete) AS valorucsflete,
						SUM(tresum.valorucsdinter) AS valorucsdinter,
						SUM(tresum.valorucsog) - SUM(tresum.valorucsflete) - SUM(tresum.valorucsdinter) AS valorucsog
				FROM	(
						SELECT		ucsb.id_unidadconstructivasb,
									CASE tog.otrosgastos
										WHEN 'FLETES Y SEGUROS' THEN SUM(tog.valorog)
									END AS valorucsflete,
									CASE tog.otrosgastos
										WHEN 'DERECHOS DE INTERNACION' THEN SUM(tog.valorog)
									END AS valorucsdinter,
									SUM(tog.valorog) AS valorucsog
						FROM		snx.tunidadconstructivasb ucsb 
						INNER JOIN	snx.calcularotrosgastosucsb(ucsb.id_unidadconstructivasb) tog ON ucsb.id_unidadconstructivasb = tog.id_unidadconstructivasb
						WHERE		(ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND id_unidadconstructivasbint <> 0) OR id_unidadconstructivasbint = 0
						GROUP BY	ucsb.id_unidadconstructivasb,
									tog.otrosgastos
					    ) tresum
				GROUP BY tresum.id_unidadconstructivasb
				) tb 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Imprevistos
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsimprevito = (valorucsbe + valorucsbm + valorucsbmate + valorucsflete + valorucsdinter + valorucsdcont + valorucsog) * (SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 20) / 100;
	
	--Sub Total
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsb = (valorucsbe + valorucsbm + valorucsbmate + valorucsflete + valorucsdinter + valorucsdcont + valorucsog + valorucsimprevito);
	
	--Ingeniería
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsing = valorucsb * (SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 21) / 100;
	
	--Supervisión de Obra
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsbsuperobra = valorucsb * (SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 22) / 100;
	
	--Inspección
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsinsp = valorucsb * (SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 23) / 100;
	
	--Total Directo
	UPDATE		snx.tunidadconstructivasb
	SET			valorucstotal = valorucsb + valorucsing + valorucsbsuperobra + valorucsinsp;
	
	RETURN;
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioucsb(integer, integer)
    OWNER TO dbkerp_admin;