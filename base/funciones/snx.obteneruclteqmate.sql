-- FUNCTION: snx.obteneruclteqmate(integer)

-- DROP FUNCTION snx.obteneruclteqmate(integer);

CREATE OR REPLACE FUNCTION snx.obteneruclteqmate(
	id_unidadconstructivaltint integer)
    RETURNS TABLE(id_unidadconstructivalt integer, id_grupo integer, grupo character varying, id_item integer, item character varying, id_unidad integer, unidadabrev character varying, cantidaditem numeric, costounitarioext numeric, costounitarinac numeric, costototalext numeric, costototalnac numeric, costototalsumi numeric, pesounitarioext numeric, pesounitarionac numeric, pesototalext numeric, pesototalnac numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$


	
BEGIN
	DROP TABLE if exists ttempeqmate;
	DROP TABLE if exists ttempcondumate;
	DROP TABLE if exists ttempparamate;
	DROP TABLE if exists ttempestrumate;	

	CREATE TEMP table ttempcondumate AS 
	SELECT		tcond.id_tipoconductor, tcond.id_tensionservicio, tmate.id_materiallt, tmate.peso, snx.calcularpreciomateriallt(tmate.id_materiallt) AS preciomateriallt
	FROM		snx.ttipoconductor tcond
	INNER JOIN	snx.tmateriallt tmate ON tcond.tipoconductor = tmate.materiallt;
	
	--Para Comunicaciones
	INSERT INTO ttempcondumate
	SELECT		21 AS id_tipoconductor, 0 AS id_tensionservicio, 0 AS id_materiallt, 0 AS peso, 0 AS preciomateriallt;

	CREATE TEMP table ttempparamate AS 
	SELECT		tmate.id_materiallt, tmate.peso, tmate.id_tipolinea, ttens.id_tensionservicio, 
				snx.calcularpreciomateriallt(tmate.id_materiallt) AS preciomateriallt, tmate.id_ambitoprecio
	FROM		snx.ttensionservicio ttens
	CROSS JOIN	snx.tmateriallt tmate 
	WHERE		tmate.materiallt LIKE 'Pararrayo%' AND tmate.materiallt LIKE '%' || ttens.tensionservicio || '%';
	
	--Para Comunicaciones
	INSERT INTO ttempparamate
	SELECT		0 AS id_materiallt, 0 AS peso, uclt.id_tipolinea, uclt.id_tensionservicio, 0 AS preciomateriallt, 1 AS id_ambitoprecio
	FROM		snx.tunidadconstructivalt uclt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 3;

	CREATE TEMP table ttempestrumate AS 
	SELECT		uclt.id_unidadconstructivalt, tmatecan.id_funcionestructura, tmatecan.id_puestatierra, tmatecan.id_aislador, tmate.id_ambitoprecio, tmatecan.id_extralt,
				SUM(tmatecan.cantidadmontajelt * tmate.peso) AS peso, snx.calcularpreciomateriallt(tmate.id_materiallt) * SUM(tmatecan.cantidadmontajelt) costounitario
	FROM		snx.tmateriallt tmate
	INNER JOIN	snx.tmaterialcantidadlt tmatecan ON tmate.id_materiallt = tmatecan.id_materiallt
	INNER JOIN	snx.tunidadconstructivalt uclt ON tmatecan.id_tipolinea = uclt.id_tipolinea AND tmatecan.id_tipoconductor = uclt.id_tipoconductor AND 
												   tmatecan.id_tensionservicio = uclt.id_tensionservicio AND
												   ((((tmatecan.id_hilosguarda = uclt.id_hilosguarda AND uclt.id_hilosguarda <> 4) OR (tmatecan.id_hilosguarda = 3 AND uclt.id_hilosguarda = 4)) AND 
												   uclt.id_unidadconstructivalt <> 8) OR (uclt.id_unidadconstructivalt = 8)) AND 
												   ((tmatecan.id_configuracionlt = uclt.id_configuracionlt and uclt.id_unidadconstructivalt not in (9,18)) or 
											   	   (tmatecan.id_configuracionlt = 1 and uclt.id_unidadconstructivalt in (9,18))) and 
												   tmatecan.id_tipoestructura = uclt.id_tipoestructura
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND tmatecan.cantidadmontajelt > 0 AND tmatecan.id_tipolinea <> 3
	GROUP BY	uclt.id_unidadconstructivalt, tmatecan.id_funcionestructura, tmatecan.id_puestatierra, tmatecan.id_aislador, tmate.id_ambitoprecio, tmate.id_materiallt, tmatecan.id_extralt;

   --Comunicaciones
	INSERT INTO ttempestrumate
	SELECT		id_unidadconstructivaltint AS id_unidadconstructivalt, tmatecan.id_funcionestructura, tmatecan.id_puestatierra, tmatecan.id_aislador, tmate.id_ambitoprecio, tmatecan.id_extralt,
				SUM(tmatecan.cantidadmontajelt * tmate.peso) AS peso, snx.calcularpreciomateriallt(tmate.id_materiallt) * SUM(tmatecan.cantidadmontajelt) costounitario
	FROM		snx.tmateriallt tmate
	INNER JOIN	snx.tmaterialcantidadlt tmatecan ON tmate.id_materiallt = tmatecan.id_materiallt	
	WHERE		tmatecan.cantidadmontajelt > 0 AND tmatecan.id_tipolinea = 3
	GROUP BY	tmatecan.id_funcionestructura, tmatecan.id_puestatierra, tmatecan.id_aislador, tmate.id_ambitoprecio, tmate.id_materiallt, tmatecan.id_extralt;

																																		
	CREATE TEMP table ttempeqmate AS 
	SELECT		uclt.id_unidadconstructivalt,
				ucltgrupo.id_grupo,
				ucltgrupo.grupo,
				ucltitem.id_item,
				ucltitem.item,
				und.id_unidad,
				und.unidadabrev,
				CAST(CASE
					WHEN ucltitem.id_item = 1 AND (uclt.id_configuracionlt <> 2 OR uclt.id_unidadconstructivalt IN (9,18)) THEN uclt.longitud * uclt.conductorfase * 3 * 1.03
					WHEN ucltitem.id_item = 1 AND uclt.id_configuracionlt = 2 AND uclt.id_unidadconstructivalt NOT IN (9,18) THEN uclt.longitud * uclt.conductorfase * 2 * 3 * 1.03				
					WHEN ucltitem.id_item = 2 AND (uclt.id_configuracionlt <> 2 OR uclt.id_unidadconstructivalt IN (9,18)) THEN (uclt.conductorfase / 2) * 3 * uclt.longitud * 1000 / 50
					WHEN ucltitem.id_item = 2 AND uclt.id_configuracionlt = 2 AND uclt.id_unidadconstructivalt NOT IN (9,18) THEN (uclt.conductorfase / 2) * 3 * uclt.longitud * 1000 / 50 * 2
					WHEN ucltitem.id_item = 3 THEN uclt.longitud * 1.03 * (SELECT cantidadopgw FROM snx.thilosguarda WHERE thilosguarda.id_hilosguarda = uclt.id_hilosguarda)
					WHEN ucltitem.id_item = 4 THEN floor(uclt.longitud / 5)
					WHEN ucltitem.id_item = 5 THEN uclt.longitud * 1.03 * (SELECT cantidadacero FROM snx.thilosguarda WHERE thilosguarda.id_hilosguarda = uclt.id_hilosguarda)
					WHEN ucltitem.id_item = 6 AND uclt.id_pararrayolinea = 1 THEN 0
					WHEN ucltitem.id_item = 6 AND uclt.id_pararrayolinea = 2 AND (uclt.id_configuracionlt <> 2 OR uclt.id_unidadconstructivalt IN (9,18)) THEN 3 * (uclt.estructurapasocantidad + uclt.estructuraamarrecantidad) * 0.1
					WHEN ucltitem.id_item = 6 AND uclt.id_pararrayolinea = 2 AND uclt.id_configuracionlt = 2 AND uclt.id_unidadconstructivalt NOT IN (9,18) THEN 2 * 3 * (uclt.estructurapasocantidad + uclt.estructuraamarrecantidad) * 0.1
					WHEN ucltitem.id_item = 7 AND uclteqmate.id_puestatierra = 1 THEN 12
					WHEN ucltitem.id_item = 7 AND uclteqmate.id_puestatierra = 2 THEN 30
					WHEN ucltitem.id_item = 7 AND uclteqmate.id_puestatierra = 3 THEN 120
					WHEN ucltitem.id_item = 7 AND uclteqmate.id_puestatierra = 4 THEN 180
					WHEN ucltitem.id_item = 7 AND uclteqmate.id_puestatierra > 4 THEN 0
					WHEN ucltitem.id_item = 8 AND (uclteqmate.id_aislador = 1 OR uclteqmate.id_aislador = 2 OR uclteqmate.id_aislador = 5) THEN caltu.factor
					WHEN ucltitem.id_item = 8 AND (uclteqmate.id_aislador <> 1 OR uclteqmate.id_aislador <> 2 OR uclteqmate.id_aislador <> 5) THEN ((nclt.factor * tens.um_kv) / (sqrt(3) * exp(-1 * caltu.valoraltura / 8150) * 292)) + 1
					WHEN ucltitem.id_item = 9 THEN uclt.estructuraamarrepeso * uclt.estructuraamarrecantidad
					WHEN ucltitem.id_item = 10 THEN uclt.estructuraamarrecantidad
					WHEN ucltitem.id_item = 11 AND (uclteqmate.id_aislador = 1 OR uclteqmate.id_aislador = 2 OR uclteqmate.id_aislador = 5) THEN caltu.factor
					WHEN ucltitem.id_item = 11 AND (uclteqmate.id_aislador <> 1 OR uclteqmate.id_aislador <> 2 OR uclteqmate.id_aislador <> 5) THEN ((nclt.factor * tens.um_kv) / (sqrt(3) * exp(-1 * caltu.valoraltura / 8150) * 292))
					WHEN ucltitem.id_item = 12 THEN uclt.estructurapasopeso * uclt.estructurapasocantidad
					WHEN ucltitem.id_item = 13 THEN uclt.estructurapasocantidad 
					WHEN ucltitem.id_item = 14 THEN uclt.longitud * 1.03
					WHEN ucltitem.id_item = 16 THEN uclt.longitud / 5
					WHEN ucltitem.id_item = 17 OR ucltitem.id_item = 19 THEN uclt.estructuraamarrecantidad - (uclt.longitud / 5)
					WHEN ucltitem.id_item = 18 OR ucltitem.id_item = 20 THEN uclt.estructurapasocantidad
					WHEN ucltitem.id_item = 21 THEN uclt.longitud * 1.03 * 2
					WHEN ucltitem.id_item = 22 OR ucltitem.id_item = 23 THEN uclt.longitud / 5 * 2
					WHEN ucltitem.id_item = 24 THEN uclt.estructuraamarrecantidad 
					WHEN ucltitem.id_item = 25 THEN (uclt.estructuraamarrecantidad * 2) - (uclt.longitud / 5 * 2)
					WHEN ucltitem.id_item = 26 THEN uclt.estructurapasocantidad 
					WHEN ucltitem.id_item = 27 THEN uclt.estructurapasocantidad * 2
					WHEN (ucltitem.id_item = 28 OR ucltitem.id_item = 29) AND uclt.id_configuracionlt = 1 THEN 3
					WHEN (ucltitem.id_item = 28 OR ucltitem.id_item = 29) AND uclt.id_configuracionlt = 2 THEN 6
					WHEN ucltitem.id_item = 30 AND uclt.id_configuracionlt = 1 AND uclt.id_tensionservicio = 3 THEN uclt.longitud*1000/2.5
					WHEN ucltitem.id_item = 30 AND uclt.id_configuracionlt = 2 AND uclt.id_tensionservicio = 3 THEN uclt.longitud*1000/2.5*2
					WHEN ucltitem.id_item = 31 AND uclt.id_unidadconstructivalt = 19 THEN uclt.longitud*1.03
					WHEN ucltitem.id_item = 31 AND uclt.id_configuracionlt = 1 THEN uclt.longitud*1.03*4
					WHEN ucltitem.id_item = 31 AND uclt.id_configuracionlt = 2 THEN uclt.longitud*1.03*2*4
					WHEN ucltitem.id_item = 32 AND uclt.id_unidadconstructivalt = 19 THEN 0.0
					WHEN ucltitem.id_item = 32 AND uclt.id_configuracionlt = 1 THEN uclt.longitud*1000/2.5
					WHEN ucltitem.id_item = 32 AND uclt.id_configuracionlt = 2 THEN uclt.longitud*1000/2.5*2
					WHEN ucltitem.id_item = 33 AND uclt.id_unidadconstructivalt = 19 THEN (uclt.longitud/2)+1
					WHEN ucltitem.id_item = 33 AND uclt.id_unidadconstructivalt <> 19 THEN uclt.longitud
					WHEN ucltitem.id_item = 34 AND uclt.id_configuracionlt = 1 THEN uclt.longitud*1.03
					WHEN ucltitem.id_item = 34 AND uclt.id_configuracionlt = 2 THEN uclt.longitud*1.03*2
					WHEN ucltitem.id_item = 35 AND uclt.id_unidadconstructivalt = 19 THEN (uclt.longitud/2)+1
					WHEN ucltitem.id_item = 35 AND uclt.id_configuracionlt = 1 THEN (uclt.longitud/2.5*2) + 1
					WHEN ucltitem.id_item = 35 AND uclt.id_configuracionlt = 2 THEN ((uclt.longitud/2.5*2) + 1) * 2
					WHEN ucltitem.id_item = 36 AND uclt.id_unidadconstructivalt = 19 THEN 0
					WHEN ucltitem.id_item = 36 AND uclt.id_configuracionlt = 1 THEN (uclt.longitud/2.5*2) 
					WHEN ucltitem.id_item = 36 AND uclt.id_configuracionlt = 2 THEN (uclt.longitud/2.5*2) * 2
					WHEN ucltitem.id_item = 37 AND uclt.id_unidadconstructivalt = 19 AND uclt.id_configuracionlt = 1 THEN 3*((uclt.longitud/2)+1)
					WHEN ucltitem.id_item = 37 AND uclt.id_unidadconstructivalt = 19 AND uclt.id_configuracionlt = 2 THEN 3*((uclt.longitud/2)+1)*2
					WHEN ucltitem.id_item = 37 AND uclt.id_configuracionlt = 1 THEN ((uclt.longitud/2.5*2) + 1) + ((uclt.longitud/2.5*2)) - 1
					WHEN ucltitem.id_item = 37 AND uclt.id_configuracionlt = 2 THEN (((uclt.longitud/2.5*2) + 1) * 2) + ((uclt.longitud/2.5*2) * 2) - 2					
					WHEN ucltitem.id_item = 38 AND uclt.id_configuracionlt = 1 AND uclt.id_pararrayolinea = 2 THEN 6
					WHEN ucltitem.id_item = 38 AND uclt.id_configuracionlt = 2 AND uclt.id_pararrayolinea = 2 THEN 12
					WHEN ucltitem.id_item = 39 AND uclt.id_unidadconstructivalt = 19 THEN 0
					WHEN ucltitem.id_item = 39 AND uclt.id_configuracionlt = 1 THEN (uclt.longitud*1.03*1000) 
					WHEN ucltitem.id_item = 39 AND uclt.id_configuracionlt = 2 THEN (uclt.longitud*1.03*1000) * 2
					WHEN ucltitem.id_item = 40 AND uclt.id_configuracionlt = 1 AND uclt.id_tensionservicio <> 3 THEN 3*uclt.longitud*1.03*1000
					WHEN ucltitem.id_item = 40 AND uclt.id_configuracionlt = 2 AND uclt.id_tensionservicio <> 3 THEN 6*uclt.longitud*1.03*1000
					WHEN ucltitem.id_item = 41 AND uclt.id_configuracionlt = 1 AND uclt.id_tensionservicio = 3 THEN 3*uclt.longitud*1.03*1000
					WHEN ucltitem.id_item = 41 AND uclt.id_configuracionlt = 2 AND uclt.id_tensionservicio = 3 THEN 6*uclt.longitud*1.03*1000 
					WHEN ucltitem.id_item = 42 AND uclt.id_unidadconstructivalt = 19 AND uclt.id_configuracionlt = 1 THEN (uclt.longitud*1.03*1000) 
					WHEN ucltitem.id_item = 42 AND uclt.id_unidadconstructivalt = 19 AND uclt.id_configuracionlt = 2 THEN (uclt.longitud*1.03*1000) * 2
					WHEN ucltitem.id_item = 42 AND uclt.id_configuracionlt = 1 THEN (4*uclt.longitud*1.03*1000) 
					WHEN ucltitem.id_item = 42 AND uclt.id_configuracionlt = 2 THEN (4*uclt.longitud*1.03*1000) * 2
					WHEN ucltitem.id_item = 43 AND uclt.id_configuracionlt = 1 THEN trunc(uclt.longitud*1000/0.8)*3
					WHEN ucltitem.id_item = 43 AND uclt.id_configuracionlt = 2 THEN trunc(uclt.longitud*1000/0.8)*3*2
					WHEN ucltitem.id_item = 44 THEN 279*uclt.longitud
					ELSE 0.0
				END AS numeric) AS cantidaditem,
				CASE
					WHEN ucltitem.id_item = 7 OR ucltitem.id_item = 9 OR ucltitem.id_item = 12 THEN 0.0
					WHEN ucltitem.id_item = 1 THEN tcondumate.preciomateriallt
					WHEN ucltitem.id_item = 2 OR ucltitem.id_item = 3 OR ucltitem.id_item = 4 OR ucltitem.id_item = 5 OR
						 ucltitem.id_item = 14 OR ucltitem.id_item = 21 OR ucltitem.id_item = 22 OR
						 ucltitem.id_item = 30 OR ucltitem.id_item = 31 OR ucltitem.id_item = 32 OR
						 ucltitem.id_item = 33 OR ucltitem.id_item = 34	OR ucltitem.id_item = 43																											
						THEN snx.calcularpreciomateriallt(uclteqmate.id_codigo)
					WHEN ucltitem.id_item = 6 OR ucltitem.id_item = 38 THEN tparamate.preciomateriallt
					WHEN (ucltitem.id_item = 8 OR ucltitem.id_item = 11) AND uclteqmate.id_aislador = 1 THEN (SELECT CASE tunidadconstructivalt.id_tensionservicio
																														 WHEN 1 THEN snx.calcularpreciomateriallt(256)
																														 WHEN 2 THEN snx.calcularpreciomateriallt(262)
																														 ELSE 0
																													END AS valor
																											 FROM 	snx.tunidadconstructivalt 
																											 WHERE 	tunidadconstructivalt.id_unidadconstructivalt = id_unidadconstructivaltint)
					WHEN (ucltitem.id_item = 8 OR ucltitem.id_item = 11) AND uclteqmate.id_aislador = 2 THEN (SELECT CASE tunidadconstructivalt.id_tensionservicio
																														 WHEN 1 THEN snx.calcularpreciomateriallt(265)
																														 WHEN 2 THEN snx.calcularpreciomateriallt(265)
																														 WHEN 3 THEN snx.calcularpreciomateriallt(266)
																														 WHEN 5 THEN snx.calcularpreciomateriallt(265)
																														 WHEN 6 THEN snx.calcularpreciomateriallt(266)
																													END AS valor
																											 FROM 	snx.tunidadconstructivalt 
																											 WHERE 	tunidadconstructivalt.id_unidadconstructivalt = id_unidadconstructivaltint)	
					WHEN (ucltitem.id_item = 8 OR ucltitem.id_item = 11) AND uclteqmate.id_aislador = 3 THEN (SELECT CASE tunidadconstructivalt.id_tensionservicio
																														 WHEN 1 THEN snx.calcularpreciomateriallt(264)
																														 WHEN 2 THEN snx.calcularpreciomateriallt(264)
																														 WHEN 3 THEN snx.calcularpreciomateriallt(263)
																														 WHEN 5 THEN snx.calcularpreciomateriallt(264)
																														 WHEN 6 THEN snx.calcularpreciomateriallt(263)
																													END AS valor
																											 FROM 	snx.tunidadconstructivalt 
																											 WHERE 	tunidadconstructivalt.id_unidadconstructivalt = id_unidadconstructivaltint)	
					WHEN (ucltitem.id_item = 8 OR ucltitem.id_item = 11) AND uclteqmate.id_aislador = 4 THEN snx.calcularpreciomateriallt(267)	
					WHEN (ucltitem.id_item = 8 OR ucltitem.id_item = 11) AND uclteqmate.id_aislador = 5 THEN (SELECT CASE tunidadconstructivalt.id_tensionservicio
																														 WHEN 1 THEN snx.calcularpreciomateriallt(257)
																														 WHEN 2 THEN snx.calcularpreciomateriallt(258)
																														 WHEN 3 THEN snx.calcularpreciomateriallt(260)
																														 WHEN 5 THEN snx.calcularpreciomateriallt(259)
																														 WHEN 6 THEN snx.calcularpreciomateriallt(261)
																													END AS valor
																											 FROM 	snx.tunidadconstructivalt 
																											 WHERE 	tunidadconstructivalt.id_unidadconstructivalt = id_unidadconstructivaltint)					
					WHEN ucltitem.id_item = 10 THEN (SELECT SUM(ttempestrumate.costounitario) FROM ttempestrumate WHERE ttempestrumate.id_extralt = uclteqmate.id_extralt AND ttempestrumate.id_ambitoprecio = 1 AND ttempestrumate.id_funcionestructura = 3 AND ttempestrumate.id_unidadconstructivalt = uclt.id_unidadconstructivalt AND ttempestrumate.id_puestatierra = uclteqmate.id_puestatierra AND ttempestrumate.id_aislador = uclteqmate.id_aislador)
					WHEN ucltitem.id_item = 13 THEN (SELECT SUM(ttempestrumate.costounitario) FROM ttempestrumate WHERE ttempestrumate.id_extralt = uclteqmate.id_extralt AND ttempestrumate.id_ambitoprecio = 1 AND ttempestrumate.id_funcionestructura = 2 AND ttempestrumate.id_unidadconstructivalt = uclt.id_unidadconstructivalt AND ttempestrumate.id_puestatierra = uclteqmate.id_puestatierra AND ttempestrumate.id_aislador = uclteqmate.id_aislador)																																																																		
					WHEN ucltitem.id_item = 16 OR ucltitem.id_item = 23 THEN (SELECT SUM(ttempestrumate.costounitario) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 1)
					WHEN ucltitem.id_item = 19 OR ucltitem.id_item = 25 THEN (SELECT SUM(ttempestrumate.costounitario) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 3)
					WHEN ucltitem.id_item = 20 OR ucltitem.id_item = 27 THEN (SELECT SUM(ttempestrumate.costounitario) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 2)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 344 THEN snx.calcularpreciomateriallt(357)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 345 THEN snx.calcularpreciomateriallt(358)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 346 THEN snx.calcularpreciomateriallt(359)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 347 THEN snx.calcularpreciomateriallt(360)					
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 390 THEN snx.calcularpreciomateriallt(398)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 391 THEN snx.calcularpreciomateriallt(399)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 392 THEN snx.calcularpreciomateriallt(400)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 393 THEN snx.calcularpreciomateriallt(401)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 344 THEN snx.calcularpreciomateriallt(361)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 345 THEN snx.calcularpreciomateriallt(362)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 346 THEN snx.calcularpreciomateriallt(363)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 347 THEN snx.calcularpreciomateriallt(364)					
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 390 THEN snx.calcularpreciomateriallt(402)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 391 THEN snx.calcularpreciomateriallt(403)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 392 THEN snx.calcularpreciomateriallt(404)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 393 THEN snx.calcularpreciomateriallt(405)					
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 344 THEN snx.calcularpreciomateriallt(370)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 345 THEN snx.calcularpreciomateriallt(371)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 346 THEN snx.calcularpreciomateriallt(372)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 347 THEN snx.calcularpreciomateriallt(373)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 390 THEN snx.calcularpreciomateriallt(406)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 391 THEN snx.calcularpreciomateriallt(407)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 392 THEN snx.calcularpreciomateriallt(408)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 393 THEN snx.calcularpreciomateriallt(409)					
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 344 THEN snx.calcularpreciomateriallt(374)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 345 THEN snx.calcularpreciomateriallt(375)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 346 THEN snx.calcularpreciomateriallt(376)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 347 THEN snx.calcularpreciomateriallt(377)	
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 390 THEN snx.calcularpreciomateriallt(410)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 391 THEN snx.calcularpreciomateriallt(411)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 392 THEN snx.calcularpreciomateriallt(412)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 393 THEN snx.calcularpreciomateriallt(413)					
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 344 THEN snx.calcularpreciomateriallt(352)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 345 THEN snx.calcularpreciomateriallt(353)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 346 THEN snx.calcularpreciomateriallt(354)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 347 THEN snx.calcularpreciomateriallt(355)					
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 390 THEN snx.calcularpreciomateriallt(394)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 391 THEN snx.calcularpreciomateriallt(395)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 392 THEN snx.calcularpreciomateriallt(396)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 393 THEN snx.calcularpreciomateriallt(397)
					ELSE 0.0
				END AS costounitarioext,
				CASE
					WHEN ucltitem.id_item = 1 OR ucltitem.id_item = 2 OR ucltitem.id_item = 3 OR ucltitem.id_item = 4 OR ucltitem.id_item = 6 OR ucltitem.id_item = 7 OR ucltitem.id_item = 8 OR ucltitem.id_item = 11 THEN 0
					WHEN ucltitem.id_item = 9 OR ucltitem.id_item = 12 OR
						 ucltitem.id_item = 39 OR ucltitem.id_item = 40 OR ucltitem.id_item = 41 OR ucltitem.id_item = 42 OR ucltitem.id_item = 44
						 THEN snx.calcularpreciomateriallt(uclteqmate.id_codigo)
					WHEN ucltitem.id_item = 10 THEN (SELECT SUM(ttempestrumate.costounitario) FROM ttempestrumate WHERE ttempestrumate.id_extralt = uclteqmate.id_extralt AND ttempestrumate.id_ambitoprecio = 2 AND ttempestrumate.id_funcionestructura = 3 AND ttempestrumate.id_unidadconstructivalt = uclt.id_unidadconstructivalt AND ttempestrumate.id_puestatierra = uclteqmate.id_puestatierra AND ttempestrumate.id_aislador = uclteqmate.id_aislador)
					WHEN ucltitem.id_item = 13 THEN (SELECT SUM(ttempestrumate.costounitario) FROM ttempestrumate WHERE ttempestrumate.id_extralt = uclteqmate.id_extralt AND ttempestrumate.id_ambitoprecio = 2 AND ttempestrumate.id_funcionestructura = 2 AND ttempestrumate.id_unidadconstructivalt = uclt.id_unidadconstructivalt AND ttempestrumate.id_puestatierra = uclteqmate.id_puestatierra AND ttempestrumate.id_aislador = uclteqmate.id_aislador)
					ELSE 0.0
				END AS costounitarinac,
				0.0 AS costototalext,
				0.0 AS costototalnac,
				0.0 AS costototalsumi,
				CASE
					WHEN ucltitem.id_item = 1 THEN tcondumate.peso
					WHEN ucltitem.id_item = 2 OR ucltitem.id_item = 3 OR ucltitem.id_item = 4 OR 
						 ucltitem.id_item = 5 OR ucltitem.id_item = 14 OR ucltitem.id_item = 39 OR 
						 ucltitem.id_item = 40 OR ucltitem.id_item = 41 OR ucltitem.id_item = 42 OR
						 ucltitem.id_item = 21 OR ucltitem.id_item = 22 OR ucltitem.id_item = 30 OR 
						 ucltitem.id_item = 31 OR ucltitem.id_item = 32 OR ucltitem.id_item = 33 OR 
						 ucltitem.id_item = 34 OR ucltitem.id_item = 43 THEN (SELECT COALESCE(tpeso.peso,0) FROM snx.tmateriallt tpeso WHERE tpeso.id_materiallt =  tmateesp.id_materiallt AND id_ambitoprecio=1)
					WHEN ucltitem.id_item = 6 THEN tparamate.peso
					WHEN ucltitem.id_item = 10 THEN (SELECT SUM(ttempestrumate.peso) FROM ttempestrumate WHERE ttempestrumate.id_extralt = uclteqmate.id_extralt AND ttempestrumate.id_funcionestructura = 3 AND ttempestrumate.id_unidadconstructivalt = uclt.id_unidadconstructivalt AND ttempestrumate.id_puestatierra = uclteqmate.id_puestatierra AND ttempestrumate.id_aislador = uclteqmate.id_aislador)
					WHEN ucltitem.id_item = 13 THEN (SELECT SUM(ttempestrumate.peso) FROM ttempestrumate WHERE ttempestrumate.id_extralt = uclteqmate.id_extralt AND ttempestrumate.id_funcionestructura = 2 AND ttempestrumate.id_unidadconstructivalt = uclt.id_unidadconstructivalt AND ttempestrumate.id_puestatierra = uclteqmate.id_puestatierra AND ttempestrumate.id_aislador = uclteqmate.id_aislador)
					WHEN ucltitem.id_item = 16 THEN (SELECT SUM(ttempestrumate.peso) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 3)
					WHEN ucltitem.id_item = 19 THEN (SELECT SUM(ttempestrumate.peso) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 4)
					WHEN ucltitem.id_item = 20 THEN (SELECT SUM(ttempestrumate.peso) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 2)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 357 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 358 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 359 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 360 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 361 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 362 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 363 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 364 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 370 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 371 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 372 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 373 AND tmateriallt.id_ambitoprecio=1)					
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 374 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 375 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 376 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 377 AND tmateriallt.id_ambitoprecio=1)					
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 352 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 353 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 354 AND tmateriallt.id_ambitoprecio=1)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 355 AND tmateriallt.id_ambitoprecio=1)
					ELSE 0.0
				END	AS pesounitarioext,
				CASE					
					WHEN ucltitem.id_item = 2 OR ucltitem.id_item = 3 OR ucltitem.id_item = 4 OR 
						 ucltitem.id_item = 5 OR ucltitem.id_item = 14 OR ucltitem.id_item = 39 OR 
						 ucltitem.id_item = 40 OR ucltitem.id_item = 41 OR ucltitem.id_item = 42 OR
						 ucltitem.id_item = 21 OR ucltitem.id_item = 22 OR ucltitem.id_item = 30 OR 
						 ucltitem.id_item = 31 OR ucltitem.id_item = 32 OR ucltitem.id_item = 33 OR 
						 ucltitem.id_item = 34 OR ucltitem.id_item = 43 THEN (SELECT COALESCE(tpeso.peso,0) FROM snx.tmateriallt tpeso WHERE tpeso.id_materiallt =  tmateesp.id_materiallt AND id_ambitoprecio=2)	
					WHEN ucltitem.id_item = 38 THEN tparamate.peso
					WHEN ucltitem.id_item = 7 OR ucltitem.id_item = 8 OR ucltitem.id_item = 11 THEN 0.0
					WHEN ucltitem.id_item = 9 OR ucltitem.id_item = 12 THEN 1										
					WHEN ucltitem.id_item = 23 THEN (SELECT SUM(ttempestrumate.peso) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 3)
					WHEN ucltitem.id_item = 25 THEN (SELECT SUM(ttempestrumate.peso) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 4)
					WHEN ucltitem.id_item = 27 THEN (SELECT SUM(ttempestrumate.peso) FROM ttempestrumate WHERE ttempestrumate.id_funcionestructura = 2)					
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 357 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 358 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 359 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 28 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 360 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 361 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 362 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 363 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 29 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 364 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 370 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 371 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 372 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 35 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 373 AND tmateriallt.id_ambitoprecio=2)					
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 374 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 375 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 376 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 36 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 377 AND tmateriallt.id_ambitoprecio=2)					
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 344 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 352 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 345 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 353 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 346 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 354 AND tmateriallt.id_ambitoprecio=2)
					WHEN ucltitem.id_item = 37 AND tcondumate.id_materiallt = 347 THEN (SELECT tmateriallt.peso FROM snx.tmateriallt WHERE tmateriallt.id_materiallt = 355 AND tmateriallt.id_ambitoprecio=2)
					ELSE 0.0
				END AS pesounitarionac,
				0.0 AS pesototalext,
				0.0 AS pesototalnac
	FROM		snx.tunidadconstructivalteqmate uclteqmate
	INNER JOIN	snx.tunidadconstructivalt uclt on uclteqmate.id_unidadconstructivalt = uclt.id_unidadconstructivalt
	INNER JOIN	snx.tucltmaestraitem ucltitem on uclteqmate.id_item = ucltitem.id_item
	INNER JOIN	snx.tucltmaestragrupo ucltgrupo on ucltitem.id_grupo = ucltgrupo.id_grupo
	INNER JOIN	snx.tunidad und on ucltitem.id_unidad = und.id_unidad
	INNER JOIN	snx.tclasificacionaltura caltu on uclt.id_clasificacionaltura = caltu.id_clasificacionaltura
	INNER JOIN	snx.tnivelcontaminacionlt nclt on uclt.id_nivelcontaminacionlt = nclt.id_nivelcontaminacionlt
	INNER JOIN	snx.ttensionservicio tens on uclt.id_tensionservicio = tens.id_tensionservicio
	INNER JOIN	ttempcondumate AS tcondumate on uclt.id_tipoconductor = tcondumate.id_tipoconductor
	INNER JOIN	ttempparamate tparamate on uclt.id_tensionservicio = tparamate.id_tensionservicio AND uclt.id_tipolinea = tparamate.id_tipolinea	
	LEFT JOIN	snx.tmateriallt tmateesp ON uclteqmate.id_codigo = tmateesp.id_materiallt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint
	ORDER BY	ucltitem.id_item;
	
	UPDATE	ttempeqmate
	SET		cantidaditem = 0.0
	WHERE	ttempeqmate.cantidaditem IS NULL;
																																		
	UPDATE	ttempeqmate
	SET		costounitarioext = 0.0
	WHERE	ttempeqmate.costounitarioext IS NULL;
																																		
	UPDATE	ttempeqmate
	SET		costounitarinac = 0.0
	WHERE	ttempeqmate.costounitarinac IS NULL;
	
	UPDATE	ttempeqmate
	SET		cantidaditem = floor(ttempeqmate.cantidaditem)
	WHERE	ttempeqmate.id_unidadconstructivalt IN (11,12,13,14) AND
			ttempeqmate.id_item <> 21;
																																		
	UPDATE	ttempeqmate
	SET		costototalext = ttempeqmate.cantidaditem * ttempeqmate.costounitarioext,
			costototalnac = ttempeqmate.cantidaditem * ttempeqmate.costounitarinac,			
			pesototalext = ttempeqmate.cantidaditem * ttempeqmate.pesounitarioext,
			pesototalnac = ttempeqmate.cantidaditem * ttempeqmate.pesounitarionac;
			
	UPDATE	ttempeqmate
	SET		costototalext = ttempeqmate.cantidaditem * ttempeqmate.costounitarioext * tsumi.cantidaditem * tsumi.factor
	FROM	(
			SELECT 		ttempeqmate.id_unidadconstructivalt, ttempeqmate.cantidaditem,
						CASE 
							WHEN ttempeqmate.id_unidadconstructivalt=9 OR ttempeqmate.id_unidadconstructivalt=18 THEN 6
							WHEN uclt.id_configuracionlt=1 THEN 6
							ELSE 12
						END factor
			FROM 		ttempeqmate 
			INNER JOIN snx.tunidadconstructivalt uclt on ttempeqmate.id_unidadconstructivalt = uclt.id_unidadconstructivalt
			WHERE ttempeqmate.id_item = 10
			) tsumi
	WHERE	ttempeqmate.id_item = 8 AND ttempeqmate.id_unidadconstructivalt = tsumi.id_unidadconstructivalt;
	
	UPDATE	ttempeqmate
	SET		costototalext = ttempeqmate.cantidaditem * ttempeqmate.costounitarioext * tsumi.cantidaditem * tsumi.factor
	FROM	(
			SELECT 		ttempeqmate.id_unidadconstructivalt, ttempeqmate.cantidaditem,
						CASE 
							WHEN ttempeqmate.id_unidadconstructivalt=9 OR ttempeqmate.id_unidadconstructivalt=18 THEN 3
							WHEN uclt.id_configuracionlt=1 THEN 3
							ELSE 6
						END factor
			FROM 		ttempeqmate 
			INNER JOIN snx.tunidadconstructivalt uclt on ttempeqmate.id_unidadconstructivalt = uclt.id_unidadconstructivalt
			WHERE ttempeqmate.id_item = 13
			) tsumi
	WHERE	ttempeqmate.id_item = 11 AND ttempeqmate.id_unidadconstructivalt = tsumi.id_unidadconstructivalt;

	UPDATE	ttempeqmate
	set		costototalsumi = ttempeqmate.costototalext + ttempeqmate.costototalnac;
	
	RETURN QUERY
	SELECT * FROM ttempeqmate;																											 
																											 
end;


$BODY$;

ALTER FUNCTION snx.obteneruclteqmate(integer)
    OWNER TO postgres;
