-- FUNCTION: snx.calcularotrosgastosotrasuc(integer, integer, numeric, integer, integer, numeric)

-- DROP FUNCTION snx.calcularotrosgastosotrasuc(integer, integer, numeric, integer, integer, numeric);

CREATE OR REPLACE FUNCTION snx.calcularotrosgastosotrasuc(
	id_otraucint integer,
	numerobahiasint integer,
	valorucint numeric,
	intorigen integer DEFAULT 0,
	id_revistaint integer DEFAULT 1,
	distanciatrans numeric DEFAULT 36)
    RETURNS TABLE(id_item integer, id_otrauc integer, otrosgastos character varying, cantidadog numeric, valorunitario numeric, valorog numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

DECLARE 
	valortransporte numeric := 0;

BEGIN	
	DROP TABLE if exists ttempog;	
	
	--PRUEBAS DE EQUIPOS EN FÁBRICA
	CREATE TEMP TABLE ttempog AS
	SELECT		1 AS id_item,
				id_otraucint AS id_otrauc,
				'PRUEBAS DE EQUIPOS EN FÁBRICA'::varchar AS otrosgastos,
				CASE
					WHEN intOrigen=1 OR intOrigen=2 OR intOrigen=3 OR intOrigen=4 THEN 0.0
					ELSE valorucint
				END AS cantidadog,
				coalesce((SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 10),0) AS valorunitario,
				0.0 AS valorog;
	
	--INSTALACIÓN DE FAENAS Y MOVILIZACIÓN DEL PERSONAL
	INSERT INTO ttempog
	SELECT		2 AS id_item,
				id_otraucint AS id_otrauc,
				'INSTALACIÓN DE FAENAS Y MOVILIZACIÓN DEL PERSONAL'::varchar AS otrosgastos,
				valorucint AS cantidadog,								
				(SELECT porceidfaenas FROM snx.ttarifaingsb WHERE numerobahias = numerobahiasint) AS valorunitario,
				0.0 AS valorog;
	
	--PRUEBAS Y PUESTA EN SERVICIO
	INSERT INTO ttempog
	SELECT		3 AS id_item,
				id_otraucint AS id_otrauc,
				'PRUEBAS Y PUESTA EN SERVICIO'::varchar AS otrosgastos,
				CASE
					WHEN intOrigen=1 OR intOrigen=2 OR intOrigen=3 OR intOrigen=4 THEN 0.0
					ELSE valorucint
				END AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 12) AS valorunitario,
				0.0 AS valorog;
	
	--INGENIERÍA
	INSERT INTO ttempog
	SELECT		4 AS id_item,
				id_otraucint AS id_otrauc,
				'INGENIERÍA'::varchar AS otrosgastos,
				valorucint AS cantidadog,	
				(SELECT porceingenieria FROM snx.ttarifaingsb WHERE numerobahias = numerobahiasint) AS valorunitario,
				0.0 AS valorog;
	
	--SUPERVISIÓN DE OBRA
	INSERT INTO ttempog
	SELECT		5 AS id_item,
				id_otraucint AS id_otrauc,
				'SUPERVISIÓN DE OBRA'::varchar AS otrosgastos,
				valorucint AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 22) AS valorunitario,
				0.0 AS valorog;
	
	--GRAVAMEN ADUANERO 
	INSERT INTO ttempog
	SELECT		6 AS id_item,
				id_otraucint AS id_otrauc,
				'GRAVAMEN ADUANERO '::varchar AS otrosgastos,
				CASE
					WHEN intOrigen=1 OR intOrigen=2 OR intOrigen=3 THEN 0.0
					ELSE valorucint
				END AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 26) AS valorunitario,
				0.0 AS valorog;
	
	--GASTOS ADUANEROS
	INSERT INTO ttempog
	SELECT		7 AS id_item,
				id_otraucint AS id_otrauc,
				'GASTOS ADUANEROS'::varchar AS otrosgastos,
				CASE
					WHEN intOrigen=1 OR intOrigen=2 OR intOrigen=3 THEN 0.0
					ELSE valorucint
				END AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 27) AS valorunitario,
				0.0 AS valorog;
	
	--ITF
	INSERT INTO ttempog
	SELECT		8 AS id_item,
				id_otraucint AS id_otrauc,
				'ITF'::varchar AS otrosgastos,
				CASE
					WHEN intOrigen=1 OR intOrigen=2 OR intOrigen=3 THEN 0.0
					ELSE valorucint
				END AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 28) AS valorunitario,
				0.0 AS valorog;
	
	--BOLETA BANCARIA DE SERIEDAD DE LA OFERTA 
	INSERT INTO ttempog
	SELECT		9 AS id_item,
				id_otraucint AS id_otrauc,
				'BOLETA BANCARIA DE SERIEDAD DE LA OFERTA'::varchar AS otrosgastos,
				valorucint AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 29) AS valorunitario,
				0.0 AS valorog;
	
	--PAGO DE DERECHO DE LICENCIA DE TRANSMISIÓN
	INSERT INTO ttempog
	SELECT		10 AS id_item,
				id_otraucint AS id_otrauc,
				'PAGO DE DERECHO DE LICENCIA DE TRANSMISIÓN'::varchar AS otrosgastos,
				valorucint AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 30) AS valorunitario,
				0.0 AS valorog;
	
	--BOLETA BANCARIA DE CUMPLIMIENTO
	INSERT INTO ttempog
	SELECT		11 AS id_item,
				id_otraucint AS id_otrauc,
				'BOLETA BANCARIA DE CUMPLIMIENTO'::varchar AS otrosgastos,
				valorucint AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 31) AS valorunitario,
				0.0 AS valorog;
	
	--IMPUESTO A LAS TRANSACCIONES IT
	INSERT INTO ttempog
	SELECT		12 AS id_item,
				id_otraucint AS id_otrauc,
				'IMPUESTO A LAS TRANSACCIONES IT'::varchar AS otrosgastos,
				valorucint AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 34) AS valorunitario,
				0.0 AS valorog;
	
	--SEGUROS
	INSERT INTO ttempog
	SELECT		13 AS id_item,
				id_otraucint AS id_otrauc,
				'SEGUROS'::varchar AS otrosgastos,
				valorucint AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 15) AS valorunitario,
				0.0 AS valorog;
	
	--ADMINISTRACIÓN
	INSERT INTO ttempog
	SELECT		14 AS id_item,
				id_otraucint AS id_otrauc,
				'ADMINISTRACIÓN'::varchar AS otrosgastos,
				CASE
					WHEN intOrigen=1 OR intOrigen=2 THEN 0.0
					ELSE valorucint
				END AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 32) AS valorunitario,
				0.0 AS valorog;
	
	--IMPREVISTOS
	INSERT INTO ttempog
	SELECT		15 AS id_item,
				id_otraucint AS id_otrauc,
				'IMPREVISTOS'::varchar AS otrosgastos,
				CASE
					WHEN intOrigen=1 OR intOrigen=2 THEN 0.0
					ELSE valorucint
				END AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 20) AS valorunitario,
				0.0 AS valorog;
	
	--UTILIDAD
	INSERT INTO ttempog
	SELECT		16 AS id_item,
				id_otraucint AS id_otrauc,
				'UTILIDAD'::varchar AS otrosgastos,
				CASE
					WHEN intOrigen=1 OR intOrigen=2 THEN 0.0
					ELSE valorucint
				END AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 33) AS valorunitario,
				0.0 AS valorog;
	
	--GASTOS FINANCIEROS
	INSERT INTO ttempog
	SELECT		17 AS id_item,
				id_otraucint AS id_otrauc,
				'GASTOS FINANCIEROS'::varchar AS otrosgastos,
				valorucint AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 14) AS valorunitario,
				0.0 AS valorog;	
	
	IF intorigen = 1 THEN
		INSERT INTO ttempog
		SELECT		18 AS id_item,
					id_otraucint AS id_otrauc,
					'TRANSPORTE'::varchar AS otrosgastos,
					cast(SUM(CASE id_unidad
						when 1 THEN (obrci.cantidadobra) / 1000
						when 6 THEN (obrci.cantidadobra) / 1000
						when 7 THEN (obrci.cantidadobra) / 1000 
						when 11 THEN (obrci.cantidadobra) * 2.4
						when 16 THEN (obrci.cantidadobra) * 0.2
						when 35 THEN (obrci.cantidadobra) * 1.51
					END) as numeric(18,2)) AS cantidadog,
					(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 1) * distanciatrans AS valorunitario,
					0.0 AS valorog										 
		from 		snx.tucmogrupo ucmogr		
		left join 	snx.tucmoobracivil obrci on ucmogr.id_ucmogrupo = obrci.id_ucmogrupo
		left join 	snx.tobracivilmoe obrcimoe on obrci.id_obracivilmoe = obrcimoe.id_obracivilmoe		
		WHERE		obrcimoe.strtransporte = 'Si' AND ucmogr.id_unidadconstructivamo = id_otraucint;						
	END IF;
									
	IF intorigen = 2 THEN									
		INSERT INTO ttempog
		SELECT		18 AS id_item,
					id_otraucint AS id_otrauc,
					'TRANSPORTE'::varchar AS otrosgastos,
					cast(SUM(CASE id_unidad
						when 1 THEN (obrci.cantidadobracivil) / 1000
						when 6 THEN (obrci.cantidadobracivil) / 1000
						when 7 THEN (obrci.cantidadobracivil) / 1000 
						when 11 THEN (obrci.cantidadobracivil) * 2.4
						when 16 THEN (obrci.cantidadobracivil) * 0.2
						when 35 THEN (obrci.cantidadobracivil) * 1.51
					END) as numeric(18,2)) AS cantidadog,
					(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 1) * distanciatrans AS valorunitario,
					0.0 AS valorog										 
		from 		snx.tucedifgrupo ucmogr	
		left join	snx.tucedifsubgrupo ucmosgr on ucmogr.id_ucedifgrupo = ucmosgr.id_ucedifgrupo
		left join 	snx.tucedifobracivil obrci on ucmosgr.id_ucedifsubgrupo = obrci.id_ucedifsubgrupo
		left join 	snx.tobracivilmoe obrcimoe on obrci.id_obracivilmoe = obrcimoe.id_obracivilmoe		
		WHERE		obrcimoe.strtransporte = 'Si' AND ucmogr.id_unidadconstructivaedif = id_otraucint;
	END IF;	
									
	IF intorigen = 1 OR intorigen = 2 THEN												
		UPDATE	ttempog
		SET		valorog = ttempog.cantidadog * ttempog.valorunitario
		WHERE	ttempog.id_item = 18;	
		
		valortransporte := (SELECT SUM(ttempog.valorog) FROM ttempog WHERE ttempog.id_item = 18);			
									
		UPDATE	ttempog		
		SET		cantidadog = ttempog.cantidadog + valortransporte
		WHERE	ttempog.id_item IN (9,10,11,12,13,17);	
	END IF;	
									
	UPDATE	ttempog
	SET		valorog = ttempog.cantidadog * ttempog.valorunitario / 100
	WHERE	ttempog.id_item <> 18;
	
	
	
	RETURN QUERY
	SELECT * FROM ttempog ORDER BY id_item;
	
	
end;

$BODY$;

ALTER FUNCTION snx.calcularotrosgastosotrasuc(integer, integer, numeric, integer, integer, numeric)
    OWNER TO dbkerp_conexion;
