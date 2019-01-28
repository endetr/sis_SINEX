-- FUNCTION: snx.obtenerucltmontaje(integer)

-- DROP FUNCTION snx.obtenerucltmontaje(integer);

CREATE OR REPLACE FUNCTION snx.obtenerucltmontaje(
	id_unidadconstructivaltint integer)
    RETURNS TABLE(id_unidadconstructivalt integer, id_grupo integer, grupo character varying, id_item integer, item character varying, id_unidad integer, unidadabrev character varying, cantidaditem numeric, costounitari numeric, costototal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

BEGIN
	DROP TABLE if exists ttempoceqmate;
	DROP TABLE if exists ttempmontaje;
	DROP TABLE if exists ttempestrumate_mont;
	
	CREATE TEMP table ttempoceqmate AS 
	SELECT	eqmate.*
	FROM	snx.obteneruclteqmate(id_unidadconstructivaltint) eqmate;
	
	CREATE TEMP table ttempestrumate_mont AS 
	SELECT		uclt.id_unidadconstructivalt, tmatecan.id_funcionestructura,
							SUM(snx.calcularpreciomontajelt(tmate.id_montajelt) * tmatecan.cantidadmontajelt) costounitario
				FROM		snx.tmontajelt tmate
				INNER JOIN	snx.tmontajecantidadlt tmatecan ON tmate.id_montajelt = tmatecan.id_montajelt
				INNER JOIN	snx.tunidadconstructivalt uclt ON tmatecan.id_tensionservicio = uclt.id_tensionservicio AND tmatecan.id_tipoestructura = uclt.id_tipoestructura AND 
															   ((tmatecan.id_configuracionlt = uclt.id_configuracionlt AND uclt.id_unidadconstructivalt NOT IN (9,18)) OR
												   			   (tmatecan.id_configuracionlt = 1 AND uclt.id_unidadconstructivalt IN (9,18))) AND 
															   tmatecan.id_tipolinea = uclt.id_tipolinea
				WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND tmatecan.cantidadmontajelt > 0
				GROUP BY 	uclt.id_unidadconstructivalt, tmatecan.id_funcionestructura;
	
	CREATE TEMP table ttempmontaje AS 
	SELECT		DISTINCT uclt.id_unidadconstructivalt,
				ucltgrupo.id_grupo,
				ucltgrupo.grupo,
				ucltitem.id_item,
				ucltitem.item,
				und.id_unidad,
				und.unidadabrev,
				CASE
					WHEN eqmate.id_item = 1 THEN eqmate.cantidaditem / uclt.conductorfase
					ELSE eqmate.cantidaditem
				END AS cantidaditem,
				CASE
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea <> 2 AND uclt.conductorfase = 4 THEN snx.calcularpreciomontajelt(49)
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea <> 2 AND uclt.conductorfase = 2 THEN snx.calcularpreciomontajelt(48)
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea <> 2 AND uclt.id_tensionservicio = 1 THEN snx.calcularpreciomontajelt(43)
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea <> 2 AND uclt.id_tensionservicio = 2 THEN snx.calcularpreciomontajelt(44)
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea <> 2 AND uclt.id_tensionservicio = 5 THEN snx.calcularpreciomontajelt(45)
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea <> 2 AND uclt.id_tensionservicio = 3 THEN snx.calcularpreciomontajelt(46)
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea <> 2 AND uclt.id_tensionservicio = 6 THEN snx.calcularpreciomontajelt(47)					
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea = 2 AND uclt.id_tensionservicio = 1 THEN snx.calcularpreciomontajelt(55)
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea = 2 AND uclt.id_tensionservicio = 2 THEN snx.calcularpreciomontajelt(56)
					WHEN eqmate.id_item = 1 AND uclt.id_tipolinea = 2 AND uclt.id_tensionservicio = 3 THEN snx.calcularpreciomontajelt(57)					
					WHEN eqmate.id_item = 10 AND ucltmontaje.id_codigo = 0 AND COALESCE(testrumate.id_funcionestructura,0) = 3 THEN COALESCE(testrumate.costounitario,0)
					WHEN eqmate.id_item = 13 AND ucltmontaje.id_codigo = 0 AND COALESCE(testrumate.id_funcionestructura,0) = 2 THEN COALESCE(testrumate.costounitario,0)
					WHEN eqmate.id_item = 10 AND ucltmontaje.id_codigo <> 0 THEN snx.calcularpreciomontajelt(ucltmontaje.id_codigo)
					WHEN eqmate.id_item = 13 AND ucltmontaje.id_codigo <> 0 THEN snx.calcularpreciomontajelt(ucltmontaje.id_codigo)
					WHEN eqmate.id_item = 16 OR eqmate.id_item = 23 THEN snx.calcularpreciomontajelt(ucltmontaje.id_codigo) * 2
					WHEN ucltmontaje.id_codigo <> 0 THEN snx.calcularpreciomontajelt(ucltmontaje.id_codigo)
					WHEN eqmate.id_item = 28 AND uclt.id_tipolinea = 2 AND uclt.id_tensionservicio = 3 THEN snx.calcularpreciomontajelt(60)
					WHEN eqmate.id_item = 28 AND uclt.id_tipolinea = 2 AND uclt.id_tensionservicio <> 3 THEN snx.calcularpreciomontajelt(58)
					WHEN eqmate.id_item = 29 AND uclt.id_tipolinea = 2 AND uclt.id_tensionservicio = 3 THEN snx.calcularpreciomontajelt(61)
					WHEN eqmate.id_item = 29 AND uclt.id_tipolinea = 2 AND uclt.id_tensionservicio <> 3 THEN snx.calcularpreciomontajelt(59)
					WHEN eqmate.id_item = 31 THEN snx.calcularpreciomontajelt(65)
					WHEN eqmate.id_item = 34 THEN snx.calcularpreciomontajelt(62)
					WHEN eqmate.id_item = 35 OR eqmate.id_item = 36 THEN snx.calcularpreciomontajelt(63)
					WHEN eqmate.id_item = 37 THEN snx.calcularpreciomontajelt(64)
					WHEN eqmate.id_item = 38 THEN snx.calcularpreciomontajelt(66)
					ELSE 0.0
				END AS costounitari, 
				0.0 AS costototal
	FROM		snx.tunidadconstructivaltmontaje ucltmontaje
	INNER JOIN	snx.tunidadconstructivalt uclt on ucltmontaje.id_unidadconstructivalt = uclt.id_unidadconstructivalt
	INNER JOIN	snx.tucltmaestraitem ucltitem on ucltmontaje.id_item = ucltitem.id_item
	INNER JOIN	snx.tucltmaestragrupo ucltgrupo on ucltitem.id_grupo = ucltgrupo.id_grupo
	INNER JOIN	snx.tunidad und on ucltitem.id_unidad = und.id_unidad
	INNER JOIN	ttempoceqmate eqmate on ucltmontaje.id_item = eqmate.id_item
	LEFT JOIN	ttempestrumate_mont testrumate ON uclt.id_unidadconstructivalt = testrumate.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	UPDATE	ttempmontaje 
	SET		costototal = ttempmontaje.cantidaditem * ttempmontaje.costounitari;
	
	UPDATE	ttempmontaje 
	SET		costototal =  ttempmontaje.cantidaditem * ttempmontaje.costounitari * tempb.cantidaditem	
	FROM	(
			SELECT tempa.id_unidadconstructivalt, SUM(tempa.cantidaditem) AS cantidaditem FROM ttempmontaje tempa 
			WHERE (tempa.id_item = 10 OR tempa.id_item = 13 OR tempa.id_item = 19 OR tempa.id_item = 20 OR tempa.id_item = 25 OR tempa.id_item = 27) AND tempa.costounitari > 0 
			GROUP BY tempa.id_unidadconstructivalt	
			) tempb
	WHERE	ttempmontaje.id_unidadconstructivalt = tempb.id_unidadconstructivalt AND (ttempmontaje.id_item = 7 OR ttempmontaje.id_item = 16 OR ttempmontaje.id_item = 23);
	
	
	RETURN QUERY
	SELECT	ttempa.id_unidadconstructivalt,
			ttempa.id_grupo,
			ttempa.grupo,
			ttempa.id_item,
			ttempa.item,
			ttempa.id_unidad,
			ttempa.unidadabrev,
			MAX(ttempa.cantidaditem) AS cantidaditem,
			SUM(ttempa.costounitari) AS costounitari,
			SUM(ttempa.costototal) AS costototal
	FROM 	ttempmontaje ttempa
	GROUP BY ttempa.id_unidadconstructivalt, ttempa.id_grupo, ttempa.grupo, ttempa.id_item,
			 ttempa.item, ttempa.id_unidad, ttempa.unidadabrev
	ORDER BY id_item;																											 
end;

$BODY$;

ALTER FUNCTION snx.obtenerucltmontaje(integer)
    OWNER TO dbkerp_conexion;
