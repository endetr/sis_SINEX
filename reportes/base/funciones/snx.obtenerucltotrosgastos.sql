CREATE OR REPLACE FUNCTION snx.obtenerucltotrosgastos(id_unidadconstructivaltint integer)
 RETURNS TABLE(id_unidadconstructivalt integer, id_descripcion integer, descripcion character varying, unidad character varying, costobase numeric, cantidaditem numeric, costototal numeric)
 LANGUAGE plpgsql
AS $function$


BEGIN
	DROP TABLE if exists ttempotrosgastos;
	DROP TABLE if exists ttempauxeqmaq;	
	DROP TABLE if exists ttempauxoc;
	DROP TABLE if exists ttempauxmontaje;
	DROP TABLE if exists ttempauxgcontra;
	
	CREATE TEMP table ttempauxeqmaq AS 
	SELECT * FROM snx.obteneruclteqmate(id_unidadconstructivaltint);

	CREATE TEMP table ttempauxoc AS 
	SELECT 		ttempoc.* 
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN snx.obtenerucltobracivil(id_unidadconstructivaltint, uclt.id_revista) ttempoc ON uclt.id_unidadconstructivalt = ttempoc.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	CREATE TEMP table ttempauxmontaje AS 
	SELECT * FROM snx.obtenerucltmontaje(id_unidadconstructivaltint);
	
	CREATE TEMP table ttempauxgcontra AS 
	SELECT * FROM snx.obtenerucltgcontra(id_unidadconstructivaltint);
	
	CREATE TEMP table ttempotrosgastos AS 
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

	UPDATE	ttempotrosgastos
	SET		costototal = ttempotrosgastos.costobase * ttempotrosgastos.cantidaditem;
	
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				2 AS id_descripcion,
				CAST('Instalación de Faenas y Movilización del Personal' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costototalnac + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 26) AS cantidaditem,
				(ttempa.costototalnac + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal)*(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 26)/100 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT 	ttempauxeqmaq.id_unidadconstructivalt, SUM(ttempauxeqmaq.costototalnac) AS costototalnac
				FROM 	ttempauxeqmaq
				GROUP BY	ttempauxeqmaq.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc.id_unidadconstructivalt, SUM(ttempauxoc.costototaloc) AS costototaloc
				FROM 	ttempauxoc
				GROUP BY	ttempauxoc.id_unidadconstructivalt
				) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje.id_unidadconstructivalt, SUM(ttempauxmontaje.costototal) AS costototal
				FROM 	ttempauxmontaje
				GROUP BY	ttempauxmontaje.id_unidadconstructivalt
				) ttempc ON uclt.id_unidadconstructivalt = ttempc.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxgcontra.id_unidadconstructivalt, SUM(ttempauxgcontra.costototal) AS costototal
				FROM 	ttempauxgcontra
				GROUP BY	ttempauxgcontra.id_unidadconstructivalt
				) ttempd ON uclt.id_unidadconstructivalt = ttempd.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea <> 2;

	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				2 AS id_descripcion,
				CAST('Instalación de Faenas y Movilización del Personal' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costototalnac + coalesce(ttempb.costototaloc,0) + ttempc.costototal  AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 26) AS cantidaditem,
				(ttempa.costototalnac + coalesce(ttempb.costototaloc,0) + ttempc.costototal)*(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 26)/100 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT 	ttempauxeqmaq.id_unidadconstructivalt, SUM(ttempauxeqmaq.costototalnac) AS costototalnac
				FROM 	ttempauxeqmaq
				GROUP BY	ttempauxeqmaq.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc.id_unidadconstructivalt, SUM(ttempauxoc.costototaloc) AS costototaloc
				FROM 	ttempauxoc
				GROUP BY	ttempauxoc.id_unidadconstructivalt
				) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje.id_unidadconstructivalt, SUM(ttempauxmontaje.costototal) AS costototal
				FROM 	ttempauxmontaje
				GROUP BY	ttempauxmontaje.id_unidadconstructivalt
				) ttempc ON uclt.id_unidadconstructivalt = ttempc.id_unidadconstructivalt	
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 2;
	
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				3 AS id_descripcion,
				CAST('Supervisión E Interventoría' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costototalsumi + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal +
				(SELECT SUM(ttempotrosgastos.costototal) FROM ttempotrosgastos WHERE ttempotrosgastos.id_descripcion IN (1,2)) AS costobase,
				CASE uclt.id_tipolinea
					WHEN 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 6)
					WHEN 2 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 45)						 
					ELSE (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 6)
				END AS cantidaditem,
				((ttempa.costototalsumi + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal) + 
				(SELECT SUM(ttempotrosgastos.costototal) FROM ttempotrosgastos WHERE ttempotrosgastos.id_descripcion IN (1,2))) * 
				CASE uclt.id_tipolinea
					WHEN 1 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 6)
					WHEN 2 THEN (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 45)						 
					ELSE (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 6)
				END /100 AS costototal
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN	(
				SELECT 	ttempauxeqmaq.id_unidadconstructivalt, SUM(ttempauxeqmaq.costototalsumi) AS costototalsumi
				FROM 	ttempauxeqmaq
				GROUP BY	ttempauxeqmaq.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc.id_unidadconstructivalt, SUM(ttempauxoc.costototaloc) AS costototaloc
				FROM 	ttempauxoc
				GROUP BY	ttempauxoc.id_unidadconstructivalt
				) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje.id_unidadconstructivalt, SUM(ttempauxmontaje.costototal) AS costototal
				FROM 	ttempauxmontaje
				GROUP BY	ttempauxmontaje.id_unidadconstructivalt
				) ttempc ON uclt.id_unidadconstructivalt = ttempc.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxgcontra.id_unidadconstructivalt, SUM(ttempauxgcontra.costototal) AS costototal
				FROM 	ttempauxgcontra
				GROUP BY	ttempauxgcontra.id_unidadconstructivalt
				) ttempd ON uclt.id_unidadconstructivalt = ttempd.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	INSERT INTO ttempotrosgastos
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
				SELECT 	ttempauxeqmaq.id_unidadconstructivalt, SUM(ttempauxeqmaq.costototalsumi) AS costototalsumi
				FROM 	ttempauxeqmaq
				GROUP BY	ttempauxeqmaq.id_unidadconstructivalt
				) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;	
	
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				6 AS id_descripcion,
				CAST('Boleta Bancaria de Seriedad de la Oferta' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase + SUM(ttempb.costototal) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 38) AS cantidaditem,
				(ttempa.costobase + SUM(ttempb.costototal)) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 38)/100 AS costototal
	FROM		ttempotrosgastos ttempa
	CROSS JOIN  ttempotrosgastos ttempb
	WHERE		ttempa.id_descripcion = 3 AND ttempb.id_descripcion IN (3,5)
	GROUP BY	ttempa.id_unidadconstructivalt, ttempa.costobase;
	
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				7 AS id_descripcion,
				CAST('Derecho de Licencia' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 39) AS cantidaditem,
				ttempa.costobase * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 39)/100 AS costototal
	FROM		ttempotrosgastos ttempa
	WHERE		ttempa.id_descripcion = 6;
										
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				8 AS id_descripcion,
				CAST('Boleta Bancaria de Cumplimiento' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 40) AS cantidaditem,
				ttempa.costobase * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 40)/100 AS costototal
	FROM		ttempotrosgastos ttempa
	WHERE		ttempa.id_descripcion = 6;	
										
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				9 AS id_descripcion,
				CAST('Seguros' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase + SUM(ttempb.costototal) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 11) AS cantidaditem,
				(ttempa.costobase + SUM(ttempb.costototal)) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 11)/100 AS costototal
	FROM		ttempotrosgastos ttempa
	CROSS JOIN  ttempotrosgastos ttempb
	WHERE		ttempa.id_descripcion = 6 AND ttempb.id_descripcion IN (6,7,8)
	GROUP BY	ttempa.id_unidadconstructivalt, ttempa.costobase;										
	
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				10 AS id_descripcion,
				CAST('Utilidades del Contratista' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				SUM(ttempa.costototal) + ttempd.costototal AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 13) AS cantidaditem,
				(SUM(ttempa.costototal) + ttempd.costototal) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 13)/100 AS costototal
	FROM		ttempotrosgastos ttempa
	INNER JOIN	(
				SELECT 	ttempauxgcontra.id_unidadconstructivalt, SUM(ttempauxgcontra.costototal) AS costototal
				FROM 	ttempauxgcontra
				GROUP BY	ttempauxgcontra.id_unidadconstructivalt
				) ttempd ON ttempa.id_unidadconstructivalt = ttempd.id_unidadconstructivalt										
	WHERE		ttempa.id_descripcion IN (1,2,3,4,5)
	GROUP BY	ttempa.id_unidadconstructivalt, ttempd.costototal;	
										
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				11 AS id_descripcion,
				CAST('Administración' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 14) AS cantidaditem,
				ttempa.costobase * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 14)/100 AS costototal
	FROM		ttempotrosgastos ttempa
	INNER JOIN	snx.tunidadconstructivalt uclt ON ttempa.id_unidadconstructivalt = uclt.id_unidadconstructivalt
	WHERE		ttempa.id_descripcion = 10; --AND uclt.id_tipolinea <> 2;
		
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				15 AS id_descripcion,
				CAST('Imprevistos' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 16) AS cantidaditem,
				ttempa.costobase * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 16)/100 AS costototal
	FROM		ttempotrosgastos ttempa
	WHERE		ttempa.id_descripcion = 10;
										
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				12 AS id_descripcion,
				CAST('Gastos Financieros' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				ttempa.costobase + SUM(ttempb.costototal) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 10) AS cantidaditem,
				(ttempa.costobase + SUM(ttempb.costototal)) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 10)/100 AS costototal
	FROM		ttempotrosgastos ttempa
	CROSS JOIN  ttempotrosgastos ttempb
	WHERE		ttempa.id_descripcion = 9 AND ttempb.id_descripcion IN (9,10,11,15)
	GROUP BY	ttempa.id_unidadconstructivalt, ttempa.costobase;
	
	
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				13 AS id_descripcion,
				CAST('Total Otros Gastos' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				null AS costobase,
				null AS cantidaditem,
				SUM(ttempa.costototal) AS costototal
	FROM		ttempotrosgastos ttempa
	GROUP BY	ttempa.id_unidadconstructivalt;
	
	INSERT INTO ttempotrosgastos
	SELECT		ttempppal.id_unidadconstructivalt,
				16 AS id_descripcion,
				CAST('Total General (USD)' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				null AS costobase,
				null AS cantidaditem,
				ttempppal.costototal + ttempa.costototalsumi + coalesce(ttempb.costototaloc,0) + ttempc.costototal + ttempd.costototal AS costototal
	FROM		ttempotrosgastos ttempppal
	INNER JOIN	(
				SELECT 	ttempauxeqmaq.id_unidadconstructivalt, SUM(ttempauxeqmaq.costototalsumi) AS costototalsumi
				FROM 	ttempauxeqmaq
				GROUP BY	ttempauxeqmaq.id_unidadconstructivalt
				) ttempa ON ttempppal.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(
				SELECT 	ttempauxoc.id_unidadconstructivalt, SUM(ttempauxoc.costototaloc) AS costototaloc
				FROM 	ttempauxoc
				GROUP BY	ttempauxoc.id_unidadconstructivalt
				) ttempb ON ttempppal.id_unidadconstructivalt = ttempb.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxmontaje.id_unidadconstructivalt, SUM(ttempauxmontaje.costototal) AS costototal
				FROM 	ttempauxmontaje
				GROUP BY	ttempauxmontaje.id_unidadconstructivalt
				) ttempc ON ttempppal.id_unidadconstructivalt = ttempc.id_unidadconstructivalt
	INNER JOIN	(
				SELECT 	ttempauxgcontra.id_unidadconstructivalt, SUM(ttempauxgcontra.costototal) AS costototal
				FROM 	ttempauxgcontra
				GROUP BY	ttempauxgcontra.id_unidadconstructivalt
				) ttempd ON ttempppal.id_unidadconstructivalt = ttempd.id_unidadconstructivalt
	WHERE		ttempppal.id_descripcion = 13;
	
	INSERT INTO ttempotrosgastos
	SELECT		ttempa.id_unidadconstructivalt,
				17 AS id_descripcion,
				CAST('Costo por km (USD)' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				null AS costobase,
				null AS cantidaditem,
				ttempa.costototal / uclt.longitud AS costototal
	FROM		ttempotrosgastos ttempa
	INNER JOIN 	snx.tunidadconstructivalt uclt ON ttempa.id_unidadconstructivalt = uclt.id_unidadconstructivalt
	WHERE		ttempa.id_descripcion = 16;
	
	INSERT INTO ttempotrosgastos
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
	FROM		ttempotrosgastos ttempa
	INNER JOIN 	snx.tunidadconstructivalt uclt ON ttempa.id_unidadconstructivalt = uclt.id_unidadconstructivalt
	INNER JOIN	snx.tfactorambiental tfamb ON ttempa.costototal >= tfamb.rangoinicial AND ttempa.costototal <= tfamb.rangofinal
	WHERE		ttempa.id_descripcion = 16;
	
	INSERT INTO ttempotrosgastos
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
	
	RETURN QUERY
	SELECT * FROM ttempotrosgastos;																											 
																											 
end;


$function$
;
