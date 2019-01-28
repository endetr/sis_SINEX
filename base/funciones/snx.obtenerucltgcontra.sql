-- FUNCTION: snx.obtenerucltgcontra(integer)

-- DROP FUNCTION snx.obtenerucltgcontra(integer);

CREATE OR REPLACE FUNCTION snx.obtenerucltgcontra(
	id_unidadconstructivaltint integer)
    RETURNS TABLE(id_unidadconstructivalt integer, id_descripcion integer, descripcion character varying, unidad character varying, costobase numeric, cantidaditem numeric, costototal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

DECLARE
	calcvanoprom numeric:= 1;
	
BEGIN
	DROP TABLE if exists ttempgcontra;
	DROP TABLE if exists ttempauxeqmaq;
	DROP TABLE if exists ttempauxoc;
	
	CREATE TEMP table ttempauxeqmaq AS 
	SELECT * FROM snx.obteneruclteqmate(id_unidadconstructivaltint);

	CREATE TEMP table ttempauxoc AS 
	SELECT 		ttempoc.* 
	FROM		snx.tunidadconstructivalt uclt
	INNER JOIN snx.obtenerucltobracivil(id_unidadconstructivaltint, uclt.id_revista) ttempoc ON uclt.id_unidadconstructivalt = ttempoc.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
	
	CREATE TEMP table ttempgcontra AS 
	SELECT		ttempa.id_unidadconstructivalt,
				1 AS id_descripcion,
				CAST('Gravamen Aduanero' AS character varying) AS descripcion,
				CAST('pu' AS character varying) AS unidad,
				SUM(ttempa.costototalext) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 1) AS cantidaditem,
				SUM(ttempa.costototalext) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 1) / 100 AS costototal
	FROM		ttempauxeqmaq ttempa
	GROUP BY	ttempa.id_unidadconstructivalt;
	
	INSERT INTO ttempgcontra
	SELECT		ttempa.id_unidadconstructivalt,
				2 AS id_descripcion,
				CAST('Gastos Aduaneros' AS character varying) AS descripcion,
				CAST('pu' AS character varying) AS unidad,
				SUM(ttempa.costototalext) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 36) AS cantidaditem,
				SUM(ttempa.costototalext) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 36) / 100 AS costototal
	FROM		ttempauxeqmaq ttempa
	GROUP BY	ttempa.id_unidadconstructivalt;
	
	INSERT INTO ttempgcontra
	SELECT		ttempa.id_unidadconstructivalt,
				3 AS id_descripcion,
				CAST('ITF' AS character varying) AS descripcion,
				CAST('' AS character varying) AS unidad,
				SUM(ttempa.costototalext) AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 37) AS cantidaditem,
				SUM(ttempa.costototalext) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 37) / 100 AS costototal
	FROM		ttempauxeqmaq ttempa
	GROUP BY	ttempa.id_unidadconstructivalt;	
	
	INSERT INTO ttempgcontra
	SELECT		ttempa.id_unidadconstructivalt,
				9 AS id_descripcion,
				CAST('Transporte Extranjero' AS character varying) AS descripcion,
				CAST('Ton-km' AS character varying) AS unidad,
				coalesce(ttempa.pesototalext,0) * uclt.distanciatransporteext AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 3) AS cantidaditem,
				(coalesce(ttempa.pesototalext,0) * uclt.distanciatransporteext) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 3) AS costototal
	FROM		snx.tunidadconstructivalt uclt
	LEFT OUTER JOIN (SELECT ttempauxeqmaq.id_unidadconstructivalt, SUM(ttempauxeqmaq.pesototalext) AS pesototalext FROM ttempauxeqmaq GROUP BY ttempauxeqmaq.id_unidadconstructivalt) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(SELECT ttempauxoc.id_unidadconstructivalt, SUM(ttempauxoc.pesototaloc) AS pesototaloc FROM ttempauxoc GROUP BY ttempauxoc.id_unidadconstructivalt) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt	
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;
															
	INSERT INTO ttempgcontra
	SELECT		ttempa.id_unidadconstructivalt,
				4 AS id_descripcion,
				CAST('Transporte Nacional' AS character varying) AS descripcion,
				CAST('Ton-km' AS character varying) AS unidad,
				(coalesce(ttempa.pesototalnac,0) + coalesce(ttempb.pesototaloc,0)) * uclt.distanciatransporte AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 3) AS cantidaditem,
				((coalesce(ttempa.pesototalnac,0) + coalesce(ttempb.pesototaloc,0)) * uclt.distanciatransporte) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 3) AS costototal
	FROM		snx.tunidadconstructivalt uclt
	LEFT OUTER JOIN (SELECT ttempauxeqmaq.id_unidadconstructivalt, SUM(ttempauxeqmaq.pesototalnac) AS pesototalnac FROM ttempauxeqmaq GROUP BY ttempauxeqmaq.id_unidadconstructivalt) ttempa ON uclt.id_unidadconstructivalt = ttempa.id_unidadconstructivalt
	LEFT OUTER JOIN	(SELECT ttempauxoc.id_unidadconstructivalt, SUM(ttempauxoc.pesototaloc) AS pesototaloc FROM ttempauxoc GROUP BY ttempauxoc.id_unidadconstructivalt) ttempb ON uclt.id_unidadconstructivalt = ttempb.id_unidadconstructivalt	
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;

	INSERT INTO ttempgcontra
	SELECT		uclt.id_unidadconstructivalt,
				5 AS id_descripcion,
				CAST('Accesos' AS character varying) AS descripcion,
				CAST('km' AS character varying) AS unidad,
				uclt.longitud * 0.75 AS costobase,
				(SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 4) AS cantidaditem,
				(uclt.longitud * 0.75) * (SELECT valorindice FROM snx.tindiceslt WHERE id_indicelt = 4) AS costototal
	FROM		snx.tunidadconstructivalt uclt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;									 
			
	INSERT INTO ttempgcontra
	SELECT		uclt.id_unidadconstructivalt,
				6 AS id_descripcion,
				CAST('Topografía' AS character varying) AS descripcion,
				CAST('km' AS character varying) AS unidad,
				uclt.longitud AS costobase,
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
					WHEN uclt.id_tipolinea = 2 AND uclt.id_unidadconstructivalt = 15 THEN (SELECT SUM(valorindice) FROM snx.tindiceslt WHERE id_indicelt IN (32, 34, 35))
					WHEN uclt.id_tipolinea = 2 AND uclt.id_unidadconstructivalt = 16 THEN (SELECT SUM(valorindice) FROM snx.tindiceslt WHERE id_indicelt IN (32, 35))							 
				END * (uclt.longitud)  AS costototal
	FROM		snx.tunidadconstructivalt uclt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint;			
	
	INSERT INTO ttempgcontra
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
	
	INSERT INTO ttempgcontra
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
	
	UPDATE	ttempgcontra
	SET		costototal = ttempgcontra.costobase * ttempgcontra.cantidaditem
	WHERE	ttempgcontra.id_descripcion = 8;
	
	RETURN QUERY
	SELECT * FROM ttempgcontra;																											 
																											 
end;

$BODY$;

ALTER FUNCTION snx.obtenerucltgcontra(integer)
    OWNER TO dbkerp_conexion;