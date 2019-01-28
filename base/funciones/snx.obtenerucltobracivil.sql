-- FUNCTION: snx.obtenerucltobracivil(integer, integer)

-- DROP FUNCTION snx.obtenerucltobracivil(integer, integer);

CREATE OR REPLACE FUNCTION snx.obtenerucltobracivil(
	id_unidadconstructivaltint integer,
	id_revistaint integer)
    RETURNS TABLE(id_unidadconstructivalt integer, terrenolt character varying, funcionestructura character varying, tipocimentacion character varying, cantidaditem numeric, cosotunitariooc numeric, costototaloc numeric, pesounitariooc numeric, pesototaloc numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

DECLARE
	factoroc INTEGER := 0;
	factorgrida NUMERIC := 1;
	factorzapata NUMERIC := 1;
	factorpilote NUMERIC := 1;
	factorgridasumer NUMERIC := 1;
	factorzapatasumer NUMERIC := 1;
	factorpilotesumer NUMERIC := 1;
BEGIN
	DROP TABLE if exists ttemppbracivil;
	DROP TABLE if exists ttempauxeqmaq_oc;
	
	CREATE TEMP table ttempauxeqmaq_oc AS 
	SELECT * FROM snx.obteneruclteqmate(id_unidadconstructivaltint);
	
	factoroc := (SELECT uclt.factoroc FROM snx.tunidadconstructivalt uclt WHERE uclt.id_unidadconstructivalt = id_unidadconstructivaltint);
	
	IF factoroc = 1 THEN
		factorgrida := 0.5;
		factorzapata := 0.4;
		factorpilote := 0.1;
		factorgridasumer := 0;
		factorzapatasumer := 0.9;
		factorpilotesumer := 0.1;
	ELSEIF factoroc = 2 THEN
		factorgrida := 0;
		factorzapata := 0;
		factorpilote := 1;
		factorgridasumer := 0;
		factorzapatasumer := 0;
		factorpilotesumer := 0;
	END IF;
	
	CREATE TEMP table ttemppbracivil AS
	SELECT		uclt.id_unidadconstructivalt,
				terr.terrenolt,
				fest.funcionestructura,
				tcim.tipocimentacion,	
				CASE
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorgrida * uclt.porcmterrenofirme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorzapata * uclt.porcmterrenofirme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorpilote * uclt.porcmterrenofirme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorgrida * uclt.porcmterrenofirme / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorzapata * uclt.porcmterrenofirme / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorpilote * uclt.porcmterrenofirme / 100 * ucltmate2.cantidaditem				
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorgrida * uclt.porcmterrenointerme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorzapata * uclt.porcmterrenointerme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorpilote * uclt.porcmterrenointerme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorgrida * uclt.porcmterrenointerme / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorzapata * uclt.porcmterrenointerme / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorpilote * uclt.porcmterrenointerme / 100 * ucltmate2.cantidaditem				
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorgrida * uclt.porcmterrenoterrenoblando / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorzapata * uclt.porcmterrenoterrenoblando / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorpilote * uclt.porcmterrenoterrenoblando / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorgrida * uclt.porcmterrenoterrenoblando / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorzapata * uclt.porcmterrenoterrenoblando / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorpilote * uclt.porcmterrenoterrenoblando / 100 * ucltmate2.cantidaditem				
					WHEN terr.id_terrenolt = 10 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorgridasumer * uclt.porcmterrenosumer / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 10 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorzapatasumer * uclt.porcmterrenosumer / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 10 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorpilotesumer * uclt.porcmterrenosumer / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 10 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorgridasumer * uclt.porcmterrenosumer / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 10 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorzapatasumer * uclt.porcmterrenosumer / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 10 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorpilotesumer * uclt.porcmterrenosumer / 100 * ucltmate2.cantidaditem
				END AS cantidaditem,
				SUM(occlt.cantidadobracivillt * snx.calcularprecioobracivillt(occlt.id_obracivillt, id_revistaint)) AS cosotunitariooc,
				0.0 AS costototaloc,
				SUM(oclt.peso * occlt.cantidadobracivillt) AS pesounitariooc,
				0.0 AS pesototaloc
	FROM		snx.tobracivilcantidadlt occlt
	INNER JOIN	snx.tterrenolt terr ON occlt.id_terreno = terr.id_terrenolt
	INNER JOIN	snx.tobracivillt oclt ON occlt.id_obracivillt = oclt.id_obracivillt
	INNER JOIN	snx.tfuncionestructura fest ON occlt.id_funcionestructura = fest.id_funcionestructura
	INNER JOIN	snx.ttipocimentacion tcim ON occlt.id_tipocimentacion = tcim.id_tipocimentacion
	INNER JOIN	snx.tunidadconstructivalt uclt ON occlt.id_tipolinea = uclt.id_tipolinea AND occlt.id_tensionservicio = uclt.id_tensionservicio AND
												   occlt.id_tipoestructura = uclt.id_tipoestructura AND occlt.id_configuracionlt = uclt.id_configuracionlt
	INNER JOIN	ttempauxeqmaq_oc ucltmate1 ON uclt.id_unidadconstructivalt = ucltmate1.id_unidadconstructivalt
	INNER JOIN	ttempauxeqmaq_oc ucltmate2 ON uclt.id_unidadconstructivalt = ucltmate2.id_unidadconstructivalt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND ucltmate1.id_item = 10 AND ucltmate2.id_item = 13 AND
				uclt.id_tipolinea <> 2
	GROUP BY	uclt.id_unidadconstructivalt, uclt.porcmterrenosumer,
				terr.terrenolt, terr.id_terrenolt,
				fest.funcionestructura, fest.id_funcionestructura,
				tcim.tipocimentacion, tcim.id_tipocimentacion,
				ucltmate2.id_item, ucltmate1.id_item,
				ucltmate1.cantidaditem, ucltmate2.cantidaditem
	ORDER BY	terr.id_terrenolt, fest.id_funcionestructura, tcim.id_tipocimentacion;
																			  
	INSERT INTO ttemppbracivil
	SELECT		uclt.id_unidadconstructivalt,
				'' AS terrenolt,
				'' AS funcionestructura,
				'Banco de Ductos' AS tipocimentacion,
				uclt.longitud AS cantidaditem,
				SUM((occlt.cantidadobracivillt * snx.calcularprecioobracivillt(occlt.id_obracivillt, id_revistaint))) AS cosotunitariooc,
				0.0 AS costototaloc,
				SUM(oclt.peso * occlt.cantidadobracivillt) AS pesounitariooc,
				0.0 AS pesototaloc
	FROM		snx.tobracivilcantidadlt occlt	
	INNER JOIN	snx.tobracivillt oclt ON occlt.id_obracivillt = oclt.id_obracivillt		
	INNER JOIN	snx.tunidadconstructivalt uclt ON occlt.id_tipolinea = uclt.id_tipolinea AND occlt.id_tensionservicio = uclt.id_tensionservicio AND
												   occlt.id_tipoestructura = uclt.id_tipoestructura AND occlt.id_configuracionlt = uclt.id_configuracionlt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 2
	GROUP BY	uclt.id_unidadconstructivalt, uclt.longitud;
																			   
	INSERT INTO ttemppbracivil
	SELECT		uclt.id_unidadconstructivalt,
				'' AS terrenolt,
				'' AS funcionestructura,
				'Cajas de Empalme' AS tipocimentacion,
				(SELECT tempa.cantidaditem FROM ttempauxeqmaq_oc tempa WHERE tempa.id_item = 37) AS cantidaditem,
				SUM((occlt.cantidadobracivillt * snx.calcularprecioobracivillt(occlt.id_obracivillt, id_revistaint))) AS cosotunitariooc,
				0.0 AS costototaloc,
				SUM(oclt.peso * occlt.cantidadobracivillt) AS pesounitariooc,
				0.0 AS pesototaloc
	FROM		snx.tobracivilcantidadlt occlt	
	INNER JOIN	snx.tobracivillt oclt ON occlt.id_obracivillt = oclt.id_obracivillt		
	INNER JOIN	snx.tunidadconstructivalt uclt ON occlt.id_tipolinea = uclt.id_tipolinea AND occlt.id_tensionservicio = uclt.id_tensionservicio AND
												   occlt.id_configuracionlt = uclt.id_configuracionlt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 2 AND occlt.id_tipoestructura = 11 AND
				((uclt.id_configuracionlt = 1 AND occlt.id_tipocanalizacion = 4) OR (uclt.id_configuracionlt = 2 AND occlt.id_tipocanalizacion = 1))
	GROUP BY	uclt.id_unidadconstructivalt, uclt.longitud;
		
	INSERT INTO ttemppbracivil
	SELECT		uclt.id_unidadconstructivalt,
				'' AS terrenolt,
				'' AS funcionestructura,
				'Arquetas' AS tipocimentacion,
				(SELECT tempa.cantidaditem FROM ttempauxeqmaq_oc tempa WHERE tempa.id_item = 33) AS cantidaditem,
				SUM((occlt.cantidadobracivillt * snx.calcularprecioobracivillt(occlt.id_obracivillt, id_revistaint))) AS cosotunitariooc,
				0.0 AS costototaloc,
				SUM(oclt.peso * occlt.cantidadobracivillt) AS pesounitariooc,
				0.0 AS pesototaloc
	FROM		snx.tobracivilcantidadlt occlt	
	INNER JOIN	snx.tobracivillt oclt ON occlt.id_obracivillt = oclt.id_obracivillt		
	INNER JOIN	snx.tunidadconstructivalt uclt ON occlt.id_tipolinea = uclt.id_tipolinea AND occlt.id_tensionservicio = uclt.id_tensionservicio AND
												   occlt.id_configuracionlt = uclt.id_configuracionlt
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 2 AND occlt.id_tipoestructura = 11 AND
				 occlt.id_tipocanalizacion = 5
	GROUP BY	uclt.id_unidadconstructivalt, uclt.longitud;

	UPDATE	ttemppbracivil
	SET		cantidaditem = 0
	WHERE	ttemppbracivil.cantidaditem IS NULL;
																			   
	UPDATE	ttemppbracivil
	SET		cosotunitariooc = 0
	WHERE	ttemppbracivil.cosotunitariooc IS NULL;

	UPDATE	ttemppbracivil
	SET		pesounitariooc = 0
	WHERE	ttemppbracivil.pesounitariooc IS NULL;
																			   
	UPDATE	ttemppbracivil
	SET		costototaloc = ttemppbracivil.cantidaditem * ttemppbracivil.cosotunitariooc,
			pesototaloc = ttemppbracivil.cantidaditem * ttemppbracivil.pesounitariooc;
																			  
	RETURN QUERY
	SELECT * FROM ttemppbracivil;																											 
																											 
end;

$BODY$;

ALTER FUNCTION snx.obtenerucltobracivil(integer, integer)
    OWNER TO dbkerp_conexion;