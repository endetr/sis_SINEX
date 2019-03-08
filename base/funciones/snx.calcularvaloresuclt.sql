CREATE OR REPLACE FUNCTION snx.calcularvaloresuclt(id_unidadconstructivaltint integer)
 RETURNS TABLE(id_unidadconstructivalt integer, numddp numeric, nummontaje numeric, numoc numeric, numingenieria numeric, numadmeje numeric, numsupero numeric, numcfinan numeric, numcaamb numeric, numcapred numeric, numcostototaluc numeric)
 LANGUAGE plpgsql
AS $function$

DECLARE
	calcvanoprom numeric:= 1;
	
BEGIN
	DROP TABLE if exists ttempouclt;
	DROP TABLE if exists ttempauxeqmaq_01;	
	DROP TABLE if exists ttempauxoc_01;
	DROP TABLE if exists ttempauxmontaje_01;
	DROP TABLE if exists ttempauxgcontra_01;
	DROP TABLE if exists ttempotrosgastos_01;
	
	CREATE TEMP table ttempauxeqmaq_01 AS 
	SELECT * FROM snx.obteneruclteqmate(id_unidadconstructivaltint);

	CREATE TEMP table ttempauxoc_01 AS 
	SELECT 		tempa.* 
	FROM 		snx.tunidadconstructivalt uclt 
	INNER JOIN	snx.obtenerucltobracivil(id_unidadconstructivaltint, uclt.id_revista) tempa ON uclt.id_unidadconstructivalt = tempa.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	CREATE TEMP table ttempauxmontaje_01 AS 
	SELECT * FROM snx.obtenerucltmontaje(id_unidadconstructivaltint);
	
	--Inicio Gastos Contratista
	CREATE TEMP table ttempauxgcontra_01 AS 
	SELECT		ttempa.id_unidadconstructivalt,
				1 AS id_descripcion,
				CAST('Gravamen Aduanero' AS character varying) AS descripcion,
				CAST('pu' AS character varying) AS unidad,
				SUM(ttempa.costototalext) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 1) AS cantidaditem,
				SUM(ttempa.costototalext) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 1) / 100 AS costototal
	FROM		ttempauxeqmaq_01 ttempa
	GROUP BY	ttempa.id_unidadconstructivalt;
	
	INSERT INTO ttempauxgcontra_01
	SELECT		ttempa.id_unidadconstructivalt,
				2 AS id_descripcion,
				CAST('Gastos Aduaneros' AS character varying) AS descripcion,
				CAST('pu' AS character varying) AS unidad,
				SUM(ttempa.costototalext) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 36) AS cantidaditem,
				SUM(ttempa.costototalext) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 36) / 100 AS costototal
	FROM		ttempauxeqmaq_01 ttempa
	GROUP BY	ttempa.id_unidadconstructivalt;
	
	INSERT INTO ttempauxgcontra_01
	SELECT		ttempa.id_unidadconstructivalt,
				3 AS id_descripcion,
				CAST('ITF' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				SUM(ttempa.costototalext) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 37) AS cantidaditem,
				SUM(ttempa.costototalext) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 37) / 100 AS costototal
	FROM		ttempauxeqmaq_01 ttempa
	GROUP BY	ttempa.id_unidadconstructivalt;	
	
	INSERT INTO ttempauxgcontra_01
	SELECT		ttempa.id_unidadconstructivalt,
				9 AS id_descripcion,
				CAST('Transporte Extranjero' AS character varying) AS descripcion,
				CAST('Ton-km' AS character varying) AS unidad,
				coalesce(ttempa.pesototalext,0) * uclt.distanciatransporteext AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 3) AS cantidaditem,
				(coalesce(ttempa.pesototalext,0) * uclt.distanciatransporteext) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 3) AS costototal
	FROM		snx.tunidadconstructivalt uclt
	LEFT OUTER JOIN (SELECT ttempauxeqmaq_01.id_unidadconstructivalt, SUM(ttempauxeqmaq_01.pesototalext) AS pesototalext FROM ttempauxeqmaq_01 GROUP BY ttempauxeqmaq_01.id_unidadconstructivalt) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(SELECT ttempauxoc_01.id_unidadconstructivalt, SUM(ttempauxoc_01.pesototaloc) AS pesototaloc FROM ttempauxoc_01 GROUP BY ttempauxoc_01.id_unidadconstructivalt) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt	
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
															
	INSERT INTO ttempauxgcontra_01
	SELECT		ttempa.id_unidadconstructivalt,
				4 AS id_descripcion,
				CAST('Transporte Nacional' AS character varying) AS descripcion,
				CAST('Ton-km' AS character varying) AS unidad,
				(coalesce(ttempa.pesototalnac,0) + coalesce(ttempb.pesototaloc,0)) * uclt.distanciatransporte AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 3) AS cantidaditem,
				((coalesce(ttempa.pesototalnac,0) + coalesce(ttempb.pesototaloc,0)) * uclt.distanciatransporte) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 3) AS costototal
	FROM		snx.tunidadconstructivalt uclt
	LEFT OUTER JOIN (SELECT ttempauxeqmaq_01.id_unidadconstructivalt, SUM(ttempauxeqmaq_01.pesototalnac) AS pesototalnac FROM ttempauxeqmaq_01 GROUP BY ttempauxeqmaq_01.id_unidadconstructivalt) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(SELECT ttempauxoc_01.id_unidadconstructivalt, SUM(ttempauxoc_01.pesototaloc) AS pesototaloc FROM ttempauxoc_01 GROUP BY ttempauxoc_01.id_unidadconstructivalt) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt	
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;

	INSERT INTO ttempauxgcontra_01
	SELECT		uclt.id_unidadconstructivalt,
				5 AS id_descripcion,
				CAST('Accesos' AS character varying) AS descripcion,
				CAST('km' AS character varying) AS unidad,
				uclt.longitud * 0.75 AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 4) AS cantidaditem,
				(uclt.longitud * 0.75) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 4) AS costototal
	FROM		snx.tunidadconstructivalt uclt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;									 
			
	INSERT INTO ttempauxgcontra_01
	SELECT		uclt.id_unidadconstructivalt,
				6 AS id_descripcion,
				CAST('Topografía' AS character varying) AS descripcion,
				CAST('km' AS character varying) AS unidad,
				CASE
					WHEN uclt.id_unidadconstructivalt IN (1,2,3,4,5,6,7,8,9,18,10) AND uclt.longitud < 1 THEN 1
					ELSE uclt.longitud
				END AS costobase,
				CASE 
					WHEN uclt.id_unidadconstructivalt IN (5,6,7,8) THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 28)														 
					WHEN uclt.id_tipolinea = 3 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 28)
					WHEN uclt.id_tipolinea = 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 5)
					WHEN uclt.id_tipolinea = 2 AND uclt.id_unidadconstructivalt = 15 THEN (SELECT SUM(valorindice) FROM snx.tindiceslt WHERE id_indicelt IN (32, 34, 35))
					WHEN uclt.id_tipolinea = 2 AND uclt.id_unidadconstructivalt = 16 THEN (SELECT SUM(valorindice) FROM snx.tindiceslt WHERE id_indicelt IN (32, 35))
				END AS cantidaditem,
				CASE
					WHEN uclt.id_unidadconstructivalt IN (5,6,7,8) THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 28)
					WHEN uclt.id_tipolinea = 3 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 28)
					WHEN uclt.id_tipolinea = 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 5)
					WHEN uclt.id_tipolinea = 2 AND uclt.id_unidadconstructivalt in (15,19) THEN (SELECT SUM(valorindice) FROM snx.tindiceslt WHERE id_indicelt IN (32, 34, 35))
					WHEN uclt.id_tipolinea = 2 AND uclt.id_unidadconstructivalt = 16 THEN (SELECT SUM(valorindice) FROM snx.tindiceslt WHERE id_indicelt IN (32, 35))							 
				END * 
				CASE
					WHEN uclt.id_unidadconstructivalt IN (1,2,3,4,5,6,7,8,9,18,10) AND uclt.longitud < 1 THEN 1
					ELSE uclt.longitud
				END  AS costototal
	FROM		snx.tunidadconstructivalt uclt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;			
	
	INSERT INTO ttempauxgcontra_01
	SELECT		uclt.id_unidadconstructivalt,
				7 AS id_descripcion,
				CAST('Estudios de Suelo y Medidas de Resistividad' AS character varying) AS descripcion,
				CAST('Estructuras' AS character varying) AS unidad,
				uclt.estructurapasocantidad + uclt.estructuraamarrecantidad AS costobase,
				CASE uclt.id_unidadconstructivalt
					WHEN 10 THEN ((SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 19)) + (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 20)
					ELSE ((SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 19)*0.33) + (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 20) 
				END AS cantidaditem,
				(uclt.estructurapasocantidad + uclt.estructuraamarrecantidad) * 
				CASE uclt.id_unidadconstructivalt
					WHEN 10 THEN ((SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 19)) + (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 20)
					ELSE ((SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 19)*0.33) + (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 20) 
				END AS costototal
	FROM		snx.tunidadconstructivalt uclt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 1;
	
	calcvanoprom := (SELECT uclt.estructurapasocantidad+uclt.estructuraamarrecantidad-1 FROM snx.tunidadconstructivalt uclt WHERE uclt.id_unidadconstructivalt = id_unidadconstructivaltint);
	IF (calcvanoprom = 0) THEN
		calcvanoprom := 1;
	END IF;
	
	INSERT INTO ttempauxgcontra_01
	SELECT		uclt.id_unidadconstructivalt,
				8 AS id_descripcion,
				CAST('Limpieza y Roce' AS character varying) AS descripcion,
				CAST('HA' AS character varying) AS unidad,
				CASE uclt.id_tipolinea
					WHEN 2 THEN uclt.longitud * 3 * 0.1
					ELSE uclt.longitud * 0.1 * ceil(10 + (power((uclt.longitud*1000/calcvanoprom),2)*(tcondumate.peso)/(8*0.2*tcondumate.cargarotura)) + 5 + (0.02*ttempts.numtensionserv)) 
				END AS costobase,
				((uclt.porcvegetamaleza*(SELECT costoroce FROM snx.tvegetacion WHERE id_vegetacion = 1))+(uclt.porcvegetamatorral*(SELECT costoroce FROM snx.tvegetacion WHERE id_vegetacion = 2))+(uclt.porcvegetaforestacion*(SELECT costoroce FROM snx.tvegetacion WHERE id_vegetacion = 3))+(uclt.porcvegetabosque*(SELECT costoroce FROM snx.tvegetacion WHERE id_vegetacion = 4)))/100 AS cantidaditem,
				0.0 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT		tcond.id_tipoconductor, tcond.id_tensionservicio, tmate.id_materiallt, tmate.peso, tmate.cargarotura, snx.calcularpreciomateriallt(tmate.id_materiallt) AS preciomateriallt
				FROM		snx.ttipoconductor tcond
				INNER JOIN	snx.tmateriallt tmate ON tcond.tipoconductor = tmate.materiallt
				) AS tcondumate on uclt.id_tipoconductor = tcondumate.id_tipoconductor
	INNER JOIN	(
				SELECT 	ttens.id_tensionservicio,
						CASE ttens.id_tensionservicio
							WHEN 1 THEN 69.0
							WHEN 2 THEN 115.0
							WHEN 3 THEN 230.0
							WHEN 5 THEN 132.0
							WHEN 6 THEN 500.0
							ELSE 0.0 
						END AS numtensionserv
				FROM	snx.ttensionservicio ttens
				) AS ttempts ON uclt.id_tensionservicio = ttempts.id_tensionservicio
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	UPDATE	ttempauxgcontra_01
	SET		costototal = ttempauxgcontra_01.costobase * ttempauxgcontra_01.cantidaditem
	WHERE	ttempauxgcontra_01.id_descripcion = 8;
	--Fin Gastos Contratista
	
	--Inicio Otros Gastos	
	CREATE TEMP table ttempotrosgastos_01 AS 
	SELECT		uclt.id_unidadconstructivalt,
				1 AS id_descripcion,
				CAST('Ingeniería' AS character varying) AS descripcion,
				CAST('km' AS character varying) AS unidad,
				CASE 
					WHEN uclt.id_unidadconstructivalt = 16 THEN 1
					WHEN uclt.id_unidadconstructivalt IN (1,2,3,4,5,6,7,8,9,18,10) AND uclt.longitud < 1 THEN 1
					ELSE uclt.longitud 
				END AS costobase,
				CASE
					WHEN uclt.id_unidadconstructivalt = 8 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 29)
					WHEN uclt.id_unidadconstructivalt = 16 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 29)
					WHEN uclt.id_unidadconstructivalt = 10 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 31)
					WHEN uclt.id_tensionservicio = 1 AND (uclt.id_tipolinea = 1 OR uclt.id_unidadconstructivalt in (15,19)) THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 21)
					WHEN uclt.id_tensionservicio = 2 AND (uclt.id_tipolinea = 1 OR uclt.id_unidadconstructivalt in (15,19)) THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 22)
					WHEN uclt.id_tensionservicio = 5 AND (uclt.id_tipolinea = 1 OR uclt.id_unidadconstructivalt in (15,19)) THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 23)
					WHEN uclt.id_tensionservicio = 3 AND (uclt.id_tipolinea = 1 OR uclt.id_unidadconstructivalt in (15,19)) THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 24)
					WHEN uclt.id_tensionservicio = 6 AND (uclt.id_tipolinea = 1 OR uclt.id_unidadconstructivalt in (15,19)) THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 25)
					WHEN uclt.id_tipolinea = 3 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 30)
					ELSE 0
				END AS cantidaditem,
				0.0 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	UPDATE	ttempotrosgastos_01
	SET		costototal = ttempotrosgastos_01.costobase * ttempotrosgastos_01.cantidaditem;
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				2 AS id_descripcion,
				CAST('Instalación de Faenas y Movilización del Personal' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costototalnac + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 26) AS cantidaditem,
				(ttempa.costototalnac + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal)*(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 26)/100 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT 	ttempauxeqmaq_01.id_unidadconstructivalt, SUM(ttempauxeqmaq_01.costototalnac) AS costototalnac
				FROM 	ttempauxeqmaq_01
				GROUP BY	ttempauxeqmaq_01.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc_01.id_unidadconstructivalt, SUM(ttempauxoc_01.costototaloc) AS costototaloc
				FROM 	ttempauxoc_01
				GROUP BY	ttempauxoc_01.id_unidadconstructivalt
				) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje_01.id_unidadconstructivalt, SUM(ttempauxmontaje_01.costototal) AS costototal
				FROM 	ttempauxmontaje_01
				GROUP BY	ttempauxmontaje_01.id_unidadconstructivalt
				) ttempc ON uclt.id_unidadconstructivalt = ttempc.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxgcontra_01.id_unidadconstructivalt, SUM(ttempauxgcontra_01.costototal) AS costototal
				FROM 	ttempauxgcontra_01
				GROUP BY	ttempauxgcontra_01.id_unidadconstructivalt
				) ttempd ON uclt.id_unidadconstructivalt = ttempd.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea <> 2;

	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				2 AS id_descripcion,
				CAST('Instalación de Faenas y Movilización del Personal' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costototalnac + coalesce(ttempb.costototaloc,0) + ttempc.costototal  AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 26) AS cantidaditem,
				(ttempa.costototalnac + coalesce(ttempb.costototaloc,0) + ttempc.costototal)*(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 26)/100 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT 	ttempauxeqmaq_01.id_unidadconstructivalt, SUM(ttempauxeqmaq_01.costototalnac) AS costototalnac
				FROM 	ttempauxeqmaq_01
				GROUP BY	ttempauxeqmaq_01.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc_01.id_unidadconstructivalt, SUM(ttempauxoc_01.costototaloc) AS costototaloc
				FROM 	ttempauxoc_01
				GROUP BY	ttempauxoc_01.id_unidadconstructivalt
				) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje_01.id_unidadconstructivalt, SUM(ttempauxmontaje_01.costototal) AS costototal
				FROM 	ttempauxmontaje_01
				GROUP BY	ttempauxmontaje_01.id_unidadconstructivalt
				) ttempc ON uclt.id_unidadconstructivalt = ttempc.id_unidadconstructivalt	
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 2;
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				3 AS id_descripcion,
				CAST('Supervisión E Interventoría' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costototalsumi + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal +
				(SELECT SUM(ttempotrosgastos_01.costototal) FROM ttempotrosgastos_01 WHERE ttempotrosgastos_01.id_descripcion IN (1,2)) AS costobase,
				CASE uclt.id_tipolinea
					WHEN 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 6)
					WHEN 2 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 45)						 
					ELSE (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 6)
				END AS cantidaditem,
				((ttempa.costototalsumi + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal) + 
				(SELECT SUM(ttempotrosgastos_01.costototal) FROM ttempotrosgastos_01 WHERE ttempotrosgastos_01.id_descripcion IN (1,2))) * 
				CASE uclt.id_tipolinea
					WHEN 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 6)
					WHEN 2 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 45)						 
					ELSE (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 6)
				END /100 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT 	ttempauxeqmaq_01.id_unidadconstructivalt, SUM(ttempauxeqmaq_01.costototalsumi) AS costototalsumi
				FROM 	ttempauxeqmaq_01
				GROUP BY	ttempauxeqmaq_01.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc_01.id_unidadconstructivalt, SUM(ttempauxoc_01.costototaloc) AS costototaloc
				FROM 	ttempauxoc_01
				GROUP BY	ttempauxoc_01.id_unidadconstructivalt
				) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje_01.id_unidadconstructivalt, SUM(ttempauxmontaje_01.costototal) AS costototal
				FROM 	ttempauxmontaje_01
				GROUP BY	ttempauxmontaje_01.id_unidadconstructivalt
				) ttempc ON uclt.id_unidadconstructivalt = ttempc.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxgcontra_01.id_unidadconstructivalt, SUM(ttempauxgcontra_01.costototal) AS costototal
				FROM 	ttempauxgcontra_01
				GROUP BY	ttempauxgcontra_01.id_unidadconstructivalt
				) ttempd ON uclt.id_unidadconstructivalt = ttempd.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				5 AS id_descripcion,
				CAST('Pruebas y Puesta en Servicio' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costototalsumi AS costobase,
				CASE uclt.id_tipolinea
					WHEN 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 8)
					WHEN 2 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 17)						 
					ELSE (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 8)
				END AS cantidaditem,
				ttempa.costototalsumi * 
				CASE uclt.id_tipolinea
					WHEN 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 8)
					WHEN 2 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 17)						 
					ELSE (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 8)
				END /100 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT 	ttempauxeqmaq_01.id_unidadconstructivalt, SUM(ttempauxeqmaq_01.costototalsumi) AS costototalsumi
				FROM 	ttempauxeqmaq_01
				GROUP BY	ttempauxeqmaq_01.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;	
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				6 AS id_descripcion,
				CAST('Boleta Bancaria de Seriedad de la Oferta' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase + SUM(ttempb.costototal) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 38) AS cantidaditem,
				(ttempa.costobase + SUM(ttempb.costototal)) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 38)/100 AS costototal
	FROM		ttempotrosgastos_01 ttempa
	CROSS JOIN  ttempotrosgastos_01 ttempb
	WHERE		ttempa.id_descripcion = 3 AND ttempb.id_descripcion IN (3,5)
	GROUP BY	ttempa.id_unidadconstructivalt, ttempa.costobase;
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				7 AS id_descripcion,
				CAST('Derecho de Licencia' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 39) AS cantidaditem,
				ttempa.costobase * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 39)/100 AS costototal
	FROM		ttempotrosgastos_01 ttempa
	WHERE		ttempa.id_descripcion = 6;
										
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				8 AS id_descripcion,
				CAST('Boleta Bancaria de Cumplimiento' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 40) AS cantidaditem,
				ttempa.costobase * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 40)/100 AS costototal
	FROM		ttempotrosgastos_01 ttempa
	WHERE		ttempa.id_descripcion = 6;	
										
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				9 AS id_descripcion,
				CAST('Seguros' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase + SUM(ttempb.costototal) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 11) AS cantidaditem,
				(ttempa.costobase + SUM(ttempb.costototal)) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 11)/100 AS costototal
	FROM		ttempotrosgastos_01 ttempa
	CROSS JOIN  ttempotrosgastos_01 ttempb
	WHERE		ttempa.id_descripcion = 6 AND ttempb.id_descripcion IN (6,7,8)
	GROUP BY	ttempa.id_unidadconstructivalt, ttempa.costobase;										
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				10 AS id_descripcion,
				CAST('Utilidades del Contratista' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				SUM(ttempa.costototal) + ttempd.costototal AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 13) AS cantidaditem,
				(SUM(ttempa.costototal) + ttempd.costototal) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 13)/100 AS costototal
	FROM		ttempotrosgastos_01 ttempa
	INNER JOIN	(
				SELECT 	ttempauxgcontra_01.id_unidadconstructivalt, SUM(ttempauxgcontra_01.costototal) AS costototal
				FROM 	ttempauxgcontra_01
				GROUP BY	ttempauxgcontra_01.id_unidadconstructivalt
				) ttempd ON ttempa.id_unidadconstructivalt = ttempd.id_unidadconstructivalt										
	WHERE		ttempa.id_descripcion IN (1,2,3,4,5)
	GROUP BY	ttempa.id_unidadconstructivalt, ttempd.costototal;	
										
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				11 AS id_descripcion,
				CAST('Administración' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 14) AS cantidaditem,
				ttempa.costobase * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 14)/100 AS costototal
	FROM		ttempotrosgastos_01 ttempa
	INNER JOIN	snx.tunidadconstructivalt uclt ON ttempa.id_unidadconstructivalt = uclt.id_unidadconstructivalt
	WHERE		ttempa.id_descripcion = 10; --AND uclt.id_tipolinea <> 2;
		
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				15 AS id_descripcion,
				CAST('Imprevistos' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 16) AS cantidaditem,
				ttempa.costobase * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 16)/100 AS costototal
	FROM		ttempotrosgastos_01 ttempa
	WHERE		ttempa.id_descripcion = 10;
										
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				12 AS id_descripcion,
				CAST('Gastos Financieros' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase + SUM(ttempb.costototal) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 10) AS cantidaditem,
				(ttempa.costobase + SUM(ttempb.costototal)) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 10)/100 AS costototal
	FROM		ttempotrosgastos_01 ttempa
	CROSS JOIN  ttempotrosgastos_01 ttempb
	WHERE		ttempa.id_descripcion = 9 AND ttempb.id_descripcion IN (9,10,11,15)
	GROUP BY	ttempa.id_unidadconstructivalt, ttempa.costobase;
	
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				13 AS id_descripcion,
				CAST('Total Otros Gastos' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				null AS costobase,
				null AS cantidaditem,
				SUM(ttempa.costototal) AS costototal
	FROM		ttempotrosgastos_01 ttempa
	GROUP BY	ttempa.id_unidadconstructivalt;
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempppal.id_unidadconstructivalt,
				16 AS id_descripcion,
				CAST('Total General (USD)' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				null AS costobase,
				null AS cantidaditem,
				ttempppal.costototal + ttempa.costototalsumi + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal AS costototal
	FROM		ttempotrosgastos_01 ttempppal
	INNER JOIN	(
				SELECT 	ttempauxeqmaq_01.id_unidadconstructivalt, SUM(ttempauxeqmaq_01.costototalsumi) AS costototalsumi
				FROM 	ttempauxeqmaq_01
				GROUP BY	ttempauxeqmaq_01.id_unidadconstructivalt
				) ttempa ON ttempppal.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc_01.id_unidadconstructivalt, SUM(ttempauxoc_01.costototaloc) AS costototaloc
				FROM 	ttempauxoc_01
				GROUP BY	ttempauxoc_01.id_unidadconstructivalt
				) ttempb ON ttempppal.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje_01.id_unidadconstructivalt, SUM(ttempauxmontaje_01.costototal) AS costototal
				FROM 	ttempauxmontaje_01
				GROUP BY	ttempauxmontaje_01.id_unidadconstructivalt
				) ttempc ON ttempppal.id_unidadconstructivalt = ttempc.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxgcontra_01.id_unidadconstructivalt, SUM(ttempauxgcontra_01.costototal) AS costototal
				FROM 	ttempauxgcontra_01
				GROUP BY	ttempauxgcontra_01.id_unidadconstructivalt
				) ttempd ON ttempppal.id_unidadconstructivalt = ttempd.id_unidadconstructivalt
	WHERE		ttempppal.id_descripcion = 13;
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				17 AS id_descripcion,
				CAST('Costo por km (USD)' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				null AS costobase,
				null AS cantidaditem,
				ttempa.costototal / uclt.longitud AS costototal
	FROM		ttempotrosgastos_01 ttempa
	INNER JOIN 	snx.tunidadconstructivalt uclt ON ttempa.id_unidadconstructivalt = uclt.id_unidadconstructivalt
	WHERE		ttempa.id_descripcion = 16;
	
	INSERT INTO ttempotrosgastos_01
	SELECT		ttempa.id_unidadconstructivalt,
				18 AS id_descripcion,
				CAST('Aspectos Ambientales' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costototal AS costobase,
				CASE
					WHEN uclt.id_areaprotegida = 1 THEN tfamb.porcprotegida 
					ELSE tfamb.porcsinproteger
				END AS cantidaditem,
				CASE 
					WHEN uclt.id_areaprotegida = 1 THEN ttempa.costototal * tfamb.porcprotegida / 100
					ELSE ttempa.costototal * tfamb.porcsinproteger / 100
				END AS costototal
	FROM		ttempotrosgastos_01 ttempa
	INNER JOIN 	snx.tunidadconstructivalt uclt ON ttempa.id_unidadconstructivalt = uclt.id_unidadconstructivalt
	INNER JOIN	snx.tfactorambiental tfamb ON ttempa.costototal >= tfamb.rangoinicial AND ttempa.costototal <= tfamb.rangofinal
	WHERE		ttempa.id_descripcion = 16;
	
	INSERT INTO ttempotrosgastos_01
	SELECT		uclt.id_unidadconstructivalt,
				19 AS id_descripcion,
				CAST('Aspectos Prediales' AS character varying) AS descripcion,
				CAST('km' AS character varying) AS unidad,
				uclt.longitud AS costobase,
				CASE 					
					WHEN uclt.id_tensionservicio = 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 27)
					WHEN uclt.id_tensionservicio = 2 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 41)
					WHEN uclt.id_tensionservicio = 3 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 43)
					WHEN uclt.id_tensionservicio = 5 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 42)
					WHEN uclt.id_tensionservicio = 6 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 44)					
				END AS cantidaditem,
				CASE
					WHEN uclt.id_tensionservicio = 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 27)
					WHEN uclt.id_tensionservicio = 2 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 41)
					WHEN uclt.id_tensionservicio = 3 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 43)
					WHEN uclt.id_tensionservicio = 5 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 42)
					WHEN uclt.id_tensionservicio = 6 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 44)					
				END * uclt.longitud	AS costototal
	FROM		snx.tunidadconstructivalt uclt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	--Fin Otros Gastos
	
	CREATE TEMP table ttempouclt AS
	SELECT		uclt.id_unidadconstructivalt,
				CASE
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN ttempa.costototalsumi
					ELSE ttempa.costototalsumi / uclt.longitud 
				END AS numddp, 
				CASE
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN ttempc.costototal
					ELSE ttempc.costototal / uclt.longitud 
				END AS nummontaje, 
				CASE
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN coalesce(ttempb.costototaloc,0)
					ELSE coalesce(ttempb.costototaloc,0) / uclt.longitud 
				END AS numoc, 					
				((SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 1) +
				(SELECT SUM(ttempa.costototal) FROM ttempauxgcontra_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion IN (6,7))) / 
				CASE
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN 1
					WHEN uclt.id_tipolinea=2 THEN uclt.longitud
					ELSE (SELECT SUM(ttempa.costobase) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 1)
				END AS numingenieria, 							
				CASE 
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 16)
					ELSE (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 17) 
				END numadmeje, 
				CASE 
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 3)
					ELSE (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 3) / uclt.longitud 
				END AS numsupero, 
				CASE 
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 12)
					ELSE (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 12) / uclt.longitud 
				END AS numcfinan, 
				CASE 
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 18)
					--WHEN uclt.id_tipolinea = 2 THEN (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 18) / uclt.conductorfase 
					ELSE (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 18) / uclt.longitud 
				END AS numcaamb, 
				CASE 
					WHEN uclt.id_unidadconstructivalt = 10 OR uclt.id_unidadconstructivalt = 16 THEN (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 19)
					--WHEN uclt.id_tipolinea = 2 THEN (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 19) / uclt.conductorfase 
					ELSE (SELECT SUM(ttempa.costototal) FROM ttempotrosgastos_01 ttempa WHERE ttempa.id_unidadconstructivalt = id_unidadconstructivaltint AND ttempa.id_descripcion = 19) / uclt.longitud
				END AS numcapred, 
				0.0 AS numcostototaluc
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT 	ttempauxeqmaq_01.id_unidadconstructivalt, SUM(ttempauxeqmaq_01.costototalext) AS costototalext, SUM(ttempauxeqmaq_01.pesototalext + ttempauxeqmaq_01.pesototalnac) AS pesototal,
						SUM(ttempauxeqmaq_01.costototalnac) AS costototalnac, SUM(ttempauxeqmaq_01.costototalsumi) AS costototalsumi
				FROM 	ttempauxeqmaq_01
				GROUP BY	ttempauxeqmaq_01.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc_01.id_unidadconstructivalt, SUM(ttempauxoc_01.costototaloc) AS costototaloc, SUM(ttempauxoc_01.pesototaloc) AS pesototaloc
				FROM 	ttempauxoc_01
				GROUP BY	ttempauxoc_01.id_unidadconstructivalt
				) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje_01.id_unidadconstructivalt, SUM(ttempauxmontaje_01.costototal) AS costototal
				FROM 	ttempauxmontaje_01
				GROUP BY	ttempauxmontaje_01.id_unidadconstructivalt
				) ttempc ON uclt.id_unidadconstructivalt = ttempc.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	UPDATE	ttempouclt
	SET		numadmeje = ttempouclt.numadmeje - (ttempouclt.numddp + ttempouclt.nummontaje + ttempouclt.numoc + ttempouclt.numingenieria + ttempouclt.numsupero + ttempouclt.numcfinan);
	
	UPDATE	ttempouclt
	SET		numddp = CAST(ttempouclt.numddp as numeric(18,2)),
			nummontaje = CAST(ttempouclt.nummontaje as numeric(18,2)),
			numoc = CAST(ttempouclt.numoc as numeric(18,2)),
			numingenieria = CAST(ttempouclt.numingenieria as numeric(18,2)),			
			numadmeje = CAST(ttempouclt.numadmeje as numeric(18,2)),
			numsupero = CAST(ttempouclt.numsupero as numeric(18,2)),
			numcfinan = CAST(ttempouclt.numcfinan as numeric(18,2)),
			numcaamb = CAST(ttempouclt.numcaamb as numeric(18,2)),
			numcapred = CAST(ttempouclt.numcapred as numeric(18,2)),										   
			numcostototaluc = CAST(ttempouclt.numddp + ttempouclt.nummontaje + ttempouclt.numoc + ttempouclt.numingenieria + ttempouclt.numadmeje + ttempouclt.numsupero + ttempouclt.numcfinan + ttempouclt.numcaamb + ttempouclt.numcapred as numeric(18,2));
	
	RETURN QUERY
	SELECT * FROM ttempouclt;																											 
																											 
end;

$function$
;
