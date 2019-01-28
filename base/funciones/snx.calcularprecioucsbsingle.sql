-- FUNCTION: snx.calcularprecioucsbsingle(integer, integer, integer)

-- DROP FUNCTION snx.calcularprecioucsbsingle(integer, integer, integer);

CREATE OR REPLACE FUNCTION snx.calcularprecioucsbsingle(
	id_unidadconstructivasbint integer,
	id_terrenosbint integer,
	id_revistaint integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Begin
	DROP TABLE if exists ttempucsequipos;
	DROP TABLE if exists ttempucsmaquinaria;
	DROP TABLE if exists ttempucsmateriales;
	DROP TABLE if exists ttempucsoc;
	DROP TABLE if exists ttempucsbog;
	
	--Valores equipos
	CREATE TEMP TABLE ttempucsequipos AS
	SELECT		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				SUM(snx.calcularprecioequipo(ucsbe.id_equipo) * ucsbe.cantidadequ) AS cantidades
	FROM		snx.tucsbequipo ucsbe
	INNER JOIN	snx.tequipo equ on ucsbe.id_equipo = equ.id_equipo
	INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb	
	WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint
	GROUP BY	ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion;
				
	--Valores maquinarias
	CREATE TEMP TABLE ttempucsmaquinaria AS
	SELECT		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,				
				SUM(snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) * ucsbm.cantidadmaq) AS cantidades				
	FROM		snx.tucsbmaquinaria ucsbm
	INNER JOIN	snx.tmaquinaria maq on ucsbm.id_maquinaria = maq.id_maquinaria
	INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb	
	WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint
	GROUP BY	ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion;
				
	--Valores materiales
	CREATE TEMP TABLE ttempucsmateriales AS
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
				WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND EM.cantidadequimat <> 0 AND ucsbe.cantidadequ <> 0
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
				WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND MM.cantidadmate <> 0 AND ucsbm.cantidadmaq <> 0
				) tunion
	GROUP BY	tunion.id_unidadconstructivasb,
				tunion.codigo,
				tunion.descripcion;
				
	--Valores Directos
	CREATE TEMP	TABLE ttempucsoc AS 
	SELECT		ucsboc.*
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	snx.calcularobracivilucsbsingle(ucsb.id_unidadconstructivasb,id_terrenosbint,id_revistaint) ucsboc ON ucsb.id_unidadconstructivasb = ucsboc.id_unidadconstructivasb
	WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;
	
	--Valores Otros Gastos
	CREATE TEMP	TABLE ttempucsbog AS 
	SELECT		ucsbog.*
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	snx.calcularotrosgastosucsb(ucsb.id_unidadconstructivasb) ucsbog ON ucsb.id_unidadconstructivasb = ucsbog.id_unidadconstructivasb
	WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;
	
	--Equipos
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsbe = tB.cantidades
	FROM		ttempucsequipos tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Maquinaria
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsbm = tB.cantidades
	FROM		ttempucsmaquinaria tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Materiales
	UPDATE		snx.tunidadconstructivasb
	SET			valorucsbmate = tB.cantidades
	FROM		ttempucsmateriales tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Directo Contratista
	UPDATE		snx.tunidadconstructivasb 
	SET			valorucsdcont = tB.valorobracivil
	FROM		(
				SELECT		ttempucsoc.id_unidadconstructivasb,
							SUM(ttempucsoc.valorobracivil) AS valorobracivil
				FROM		ttempucsoc
				GROUP BY	ttempucsoc.id_unidadconstructivasb
				) tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Otros gastos
	UPDATE		snx.tunidadconstructivasb 
	SET			valorucsog = tB.valorog
	FROM		(
				SELECT		ttempucsbog.id_unidadconstructivasb,
							SUM(ttempucsbog.valorog) AS valorog
				FROM		ttempucsbog
				GROUP BY	ttempucsbog.id_unidadconstructivasb
				) tB 
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = tB.id_unidadconstructivasb;
	
	--Total Directo
	UPDATE		snx.tunidadconstructivasb
	SET			valorucstotal = valorucsbe + valorucsbm + valorucsbmate + valorucsdcont + valorucsog
	WHERE		tunidadconstructivasb.id_unidadconstructivasb = id_unidadconstructivasbint;
	
	RETURN;
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioucsbsingle(integer, integer, integer)
    OWNER TO dbkerp_admin;