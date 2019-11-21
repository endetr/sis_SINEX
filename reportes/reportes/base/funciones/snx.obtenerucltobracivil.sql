CREATE OR REPLACE FUNCTION snx.obtenerucltobracivil(id_unidadconstructivaltint integer, id_revistaint integer)
 RETURNS TABLE(id_unidadconstructivalt integer, terrenolt character varying, funcionestructura character varying, tipocimentacion character varying, cantidaditem numeric, cosotunitariooc numeric, costototaloc numeric, pesounitariooc numeric, pesototaloc numeric)
 LANGUAGE plpgsql
AS $function$


DECLARE
	factoroc INTEGER := 0;
	factorgridafirme NUMERIC := 1;
	factorzapatafirme NUMERIC := 1;
	factorpilotefirme NUMERIC := 1;
	factorgridainter NUMERIC := 1;
	factorzapatainter NUMERIC := 1;
	factorpiloteinter NUMERIC := 1;
	factorgridablando NUMERIC := 1;
	factorzapatablando NUMERIC := 1;
	factorpiloteblando NUMERIC := 1;
	factorgridasumer NUMERIC := 1;
	factorzapatasumer NUMERIC := 1;
	factorpilotesumer NUMERIC := 1;
BEGIN
	DROP TABLE if exists ttemppbracivil;
	DROP TABLE if exists ttempauxeqmaq_oc;
	
	CREATE TEMP table ttempauxeqmaq_oc AS 
	SELECT * FROM snx.obteneruclteqmate(id_unidadconstructivaltint);
	
	factoroc := (SELECT uclt.factoroc FROM snx.tunidadconstructivalt uclt WHERE uclt.id_unidadconstructivalt = id_unidadconstructivaltint);
	
	IF id_unidadconstructivaltint = 1 OR id_unidadconstructivaltint = 5 OR id_unidadconstructivaltint = 9 THEN		
		factorgridafirme := 0.8;
		factorzapatafirme := 0.2;
		factorpilotefirme := 0.0;
		
		factorgridainter := 0.4;
		factorzapatainter := 0.6;
		factorpiloteinter := 0.0;
		
		factorgridablando := 0.0;
		factorzapatablando := 0.4;
		factorpiloteblando := 0.6;
		
		factorgridasumer := 0.0;
		factorzapatasumer := 0.1;
		factorpilotesumer := 0.9;
	elseif id_unidadconstructivaltint = 10 then
		factorgridafirme := 1;
		factorzapatafirme := 0.0;
		factorpilotefirme := 0.0;
		
		factorgridainter := 0.0;
		factorzapatainter := 1;
		factorpiloteinter := 0.0;
		
		factorgridablando := 0.0;
		factorzapatablando := 0.0;
		factorpiloteblando := 1;
		
		factorgridasumer := 0.0;
		factorzapatasumer := 0.0;
		factorpilotesumer := 1;
	ELSEIF factoroc = 1 AND id_unidadconstructivaltint <> 10 THEN
		factorgridafirme := 0.5;
		factorzapatafirme := 0.4;
		factorpilotefirme := 0.1;
		
		factorgridainter := 0.5;
		factorzapatainter := 0.4;
		factorpiloteinter := 0.1;
		
		factorgridablando := 0.5;
		factorzapatablando := 0.4;
		factorpiloteblando := 0.1;
		
		factorgridasumer := 0;
		factorzapatasumer := 0.9;
		factorpilotesumer := 0.1;
	ELSEIF factoroc = 2 AND id_unidadconstructivaltint <> 10 THEN
		factorgridafirme := 0;
		factorzapatafirme := 0;
		factorpilotefirme := 1;
		
		factorgridainter := 0;
		factorzapatainter := 0;
		factorpiloteinter := 1;
		
		factorgridablando := 0;
		factorzapatablando := 0;
		factorpiloteblando := 1;
		
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
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorgridafirme * uclt.porcmterrenofirme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorzapatafirme * uclt.porcmterrenofirme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorpilotefirme * uclt.porcmterrenofirme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorgridafirme * uclt.porcmterrenofirme / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorzapatafirme * uclt.porcmterrenofirme / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 7 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorpilotefirme * uclt.porcmterrenofirme / 100 * ucltmate2.cantidaditem				
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorgridainter * uclt.porcmterrenointerme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorzapatainter * uclt.porcmterrenointerme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorpiloteinter * uclt.porcmterrenointerme / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorgridainter * uclt.porcmterrenointerme / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorzapatainter * uclt.porcmterrenointerme / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 8 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorpiloteinter * uclt.porcmterrenointerme / 100 * ucltmate2.cantidaditem				
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorgridablando * uclt.porcmterrenoterrenoblando / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorzapatablando * uclt.porcmterrenoterrenoblando / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 3 AND ucltmate1.id_item = 10 THEN factorpiloteblando * uclt.porcmterrenoterrenoblando / 100 * ucltmate1.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 2 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorgridablando * uclt.porcmterrenoterrenoblando / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 3 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorzapatablando * uclt.porcmterrenoterrenoblando / 100 * ucltmate2.cantidaditem
					WHEN terr.id_terrenolt = 9 AND tcim.id_tipocimentacion = 4 AND fest.id_funcionestructura = 2 AND ucltmate2.id_item = 13 THEN factorpiloteblando * uclt.porcmterrenoterrenoblando / 100 * ucltmate2.cantidaditem				
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
												  occlt.id_tipoestructura = uclt.id_tipoestructura AND occlt.id_configuracionlt = uclt.id_configuracionlt and
											      occlt.id_bancoductos = uclt.id_bancoductos and occlt.id_cajaempalme = uclt.id_cajaempalme
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 2 and uclt.id_unidadconstructivalt <> 19
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
												  occlt.id_configuracionlt = uclt.id_configuracionlt and
											      occlt.id_bancoductos = uclt.id_bancoductos and occlt.id_cajaempalme = uclt.id_cajaempalme
	WHERE		uclt.id_unidadconstructivalt = id_unidadconstructivaltint AND uclt.id_tipolinea = 2 AND occlt.id_tipoestructura = 11 and uclt.id_unidadconstructivalt <> 19 AND
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
				occlt.id_tipocanalizacion = 5 and uclt.id_unidadconstructivalt <> 19
	GROUP BY	uclt.id_unidadconstructivalt, uclt.longitud;

	--Si es la UUCC L 18
	if id_unidadconstructivaltint=19 then
		INSERT INTO ttemppbracivil
		SELECT		uclt.id_unidadconstructivalt,
					'' AS terrenolt,
					'' AS funcionestructura,
					bc.bancoductos as tipocimentacion,
					uclt.longitud as cantidaditem,
					SUM((occlt.cantidadobracivillt * snx.calcularprecioobracivillt(occlt.id_obracivillt, id_revistaint))) as cosotunitariooc,
					0.0 AS costototaloc,
					SUM(oclt.peso * occlt.cantidadobracivillt) AS pesounitariooc,
					0.0 AS pesototaloc
		FROM		snx.tobracivilcantidadlt occlt	
		INNER JOIN	snx.tobracivillt oclt ON occlt.id_obracivillt = oclt.id_obracivillt	
		INNER JOIN	snx.tunidadconstructivalt uclt on occlt.id_bancoductos = uclt.id_bancoductos
		INNER JOIN	snx.tbancoductos bc on 	occlt.id_bancoductos = bc.id_bancoductos												  
		WHERE		occlt.id_bancoductos <> 1 and uclt.id_unidadconstructivalt = id_unidadconstructivaltint
		GROUP BY    uclt.id_unidadconstructivalt, bc.bancoductos, uclt.longitud;
		
		INSERT INTO ttemppbracivil
		SELECT		uclt.id_unidadconstructivalt,
					'' AS terrenolt,
					'' AS funcionestructura,
					ce.cajaempalme as tipocimentacion,
					(uclt.longitud/2)+1 as cantidaditem,
					SUM((occlt.cantidadobracivillt * snx.calcularprecioobracivillt(occlt.id_obracivillt, id_revistaint))) as cosotunitariooc,
					0.0 AS costototaloc,
					SUM(oclt.peso * occlt.cantidadobracivillt) AS pesounitariooc,
					0.0 AS pesototaloc
		FROM		snx.tobracivilcantidadlt occlt	
		INNER JOIN	snx.tobracivillt oclt ON occlt.id_obracivillt = oclt.id_obracivillt	
		INNER JOIN	snx.tunidadconstructivalt uclt on occlt.id_cajaempalme = uclt.id_cajaempalme
		INNER JOIN	snx.tcajaempalme ce on 	occlt.id_cajaempalme = ce.id_cajaempalme												  
		WHERE		occlt.id_cajaempalme <> 1 and uclt.id_unidadconstructivalt = id_unidadconstructivaltint
		GROUP BY    uclt.id_unidadconstructivalt, ce.cajaempalme, uclt.longitud;
	
		INSERT INTO ttemppbracivil
		SELECT		id_unidadconstructivaltint as id_unidadconstructivalt,
					'' AS terrenolt,
					'' AS funcionestructura,
					bc.bancoductos as tipocimentacion,
					uclt.longitud/20 as cantidaditem,
					SUM((occlt.cantidadobracivillt * snx.calcularprecioobracivillt(occlt.id_obracivillt, id_revistaint))) as cosotunitariooc,
					0.0 AS costototaloc,
					SUM(oclt.peso * occlt.cantidadobracivillt) AS pesounitariooc,
					0.0 AS pesototaloc
		FROM		snx.tobracivilcantidadlt occlt	
		INNER JOIN	snx.tobracivillt oclt ON occlt.id_obracivillt = oclt.id_obracivillt		
		INNER JOIN	snx.tbancoductos bc on 	occlt.id_bancoductos = bc.id_bancoductos
		cross join	snx.tunidadconstructivalt uclt
		WHERE		occlt.id_bancoductos = 5 and uclt.id_unidadconstructivalt = id_unidadconstructivaltint
		GROUP BY    uclt.id_unidadconstructivalt, bc.bancoductos, uclt.longitud;
	end if;

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


$function$
;
