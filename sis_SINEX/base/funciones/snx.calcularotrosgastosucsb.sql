-- FUNCTION: snx.calcularotrosgastosucsb(integer)

-- DROP FUNCTION snx.calcularotrosgastosucsb(integer);

CREATE OR REPLACE FUNCTION snx.calcularotrosgastosucsb(
	id_unidadconstructivasbint integer)
    RETURNS TABLE(id_item integer, id_unidadconstructivasb integer, codigo character varying, descripcion character varying, otrosgastos character varying, cantidadog numeric, valorunitario numeric, valorog numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

BEGIN
	DROP TABLE if exists ttempequipos;
	DROP TABLE if exists ttempmaquinaria;
	DROP TABLE if exists ttempmateriales;
	DROP TABLE if exists ttempcdc;
	DROP TABLE if exists ttempog;
	
	--Cantidades equipos
	CREATE TEMP TABLE ttempequipos AS
	SELECT		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				equ.id_ambitoprecio,
				(snx.calcularprecioequipo(ucsbe.id_equipo) * ucsbe.cantidadequ) AS cantidadog
	FROM		snx.tucsbequipo ucsbe
	INNER JOIN	snx.tequipo equ on ucsbe.id_equipo = equ.id_equipo
	INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND ucsbe.cantidadequ <> 0;
	
	--Cantidades maquinaria
	CREATE TEMP TABLE ttempmaquinaria AS
	SELECT		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				(snx.calcularpreciomaquinaria(ucsbmaq.id_maquinaria) * ucsbmaq.cantidadmaq) AS cantidadog
	FROM		snx.tucsbmaquinaria ucsbmaq
	INNER JOIN	snx.tmaquinaria maq on ucsbmaq.id_maquinaria = maq.id_maquinaria
	INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbmaq.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND ucsbmaq.cantidadmaq <> 0;
	
	--Cantidades materiales
	CREATE TEMP TABLE ttempmateriales AS
	SELECT		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				mate.id_ambitoprecio,
				(snx.calcularpreciomaterial(MP.id_material) * EM.cantidadequimat * ucsbe.cantidadequ) AS cantidadog
	FROM		snx.tequipomaterial EM
	INNER JOIN	snx.tmaterial mate ON EM.id_material = mate.id_material
	INNER JOIN	snx.tmaterialprecio MP ON EM.id_material = MP.id_material
	INNER JOIN	snx.tucsbequipo ucsbe on EM.id_equipo = ucsbe.id_equipo
	INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;
	
	INSERT INTO ttempmateriales
	SELECT		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				mate.id_ambitoprecio,
				(snx.calcularpreciomaterial(MP.id_material) * MM.cantidadmate * ucsbm.cantidadmaq) AS cantidadog
	FROM		snx.tmaquinariamaterial MM
	INNER JOIN	snx.tmaterial mate ON MM.id_material = mate.id_material
	INNER JOIN	snx.tmaterialprecio MP ON MM.id_material = MP.id_material
	INNER JOIN	snx.tucsbmaquinaria ucsbm on MM.id_maquinaria = ucsbm.id_maquinaria
	INNER JOIN  snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;
	
	--Cantidades Costos Directos
	CREATE TEMP TABLE ttempcdc AS
	SELECT	*
	FROM	snx.calcularobracivilucsb(id_unidadconstructivasbint,1);
	
	
	--PRUEBAS DE EQUIPOS EN FÁBRICA
	CREATE TEMP TABLE ttempog AS
	SELECT		1 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'PRUEBAS DE EQUIPOS EN FÁBRICA'::varchar AS otrosgastos,
				coalesce((SELECT SUM(ttempequipos.cantidadog) FROM ttempequipos),0) +
				coalesce((SELECT SUM(ttempmaquinaria.cantidadog) FROM ttempmaquinaria),0) AS cantidadog,
				coalesce((SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 10),0) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;
	
	--INSTALACIÓN DE FAENAS Y MOVILIZACIÓN DEL PERSONAL
	INSERT INTO ttempog
	SELECT		2 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'INSTALACIÓN DE FAENAS Y MOVILIZACIÓN DEL PERSONAL'::varchar AS otrosgastos,
				coalesce((SELECT SUM(ttempmateriales.cantidadog) FROM ttempmateriales WHERE ttempmateriales.id_ambitoprecio = 2),0) + 
				coalesce((SELECT SUM(ttempcdc.valorobracivil) FROM ttempcdc WHERE ttempcdc.id_obracivil not in (8,10,11)),0) AS cantidadog,
				(SELECT porceidfaenas FROM snx.ttarifaingsb WHERE numerobahias = ucsb.numerobahias) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;
	
	--PRUEBAS Y PUESTA EN SERVICIO
	INSERT INTO ttempog
	SELECT		3 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'PRUEBAS Y PUESTA EN SERVICIO'::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 12) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 1;
	
	--INGENIERÍA
	INSERT INTO ttempog
	SELECT		4 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'INGENIERÍA'::varchar AS otrosgastos,
				CASE ucsb.varloringenieria
					WHEN 0 THEN coalesce((SELECT SUM(ttempequipos.cantidadog) FROM ttempequipos),0) +	
								coalesce((SELECT SUM(ttempmaquinaria.cantidadog) FROM ttempmaquinaria),0) + 
								coalesce((SELECT SUM(ttempmateriales.cantidadog) FROM ttempmateriales),0) + 
								coalesce((SELECT SUM(ttempcdc.valorobracivil) FROM ttempcdc WHERE ttempcdc.id_obracivil not in (8,10,11)),0)
					ELSE 0
				END AS cantidadog,
				CASE ucsb.varloringenieria
					WHEN 0 THEN (SELECT porceingenieria FROM snx.ttarifaingsb WHERE numerobahias = ucsb.numerobahias)
					ELSE 0
				END AS valorunitario,
				CASE ucsb.varloringenieria
					WHEN 0 THEN 0.0 
					ELSE ucsb.varloringenieria
				END AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;	
	
	--SUPERVISIÓN DE OBRA
	INSERT INTO ttempog
	SELECT		5 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'SUPERVISIÓN DE OBRA'::varchar AS otrosgastos,
				coalesce((SELECT SUM(ttempequipos.cantidadog) FROM ttempequipos),0) +	
				coalesce((SELECT SUM(ttempmaquinaria.cantidadog) FROM ttempmaquinaria),0) + 
				coalesce((SELECT SUM(ttempmateriales.cantidadog) FROM ttempmateriales),0) + 
				coalesce((SELECT SUM(ttempcdc.valorobracivil) FROM ttempcdc WHERE ttempcdc.id_obracivil not in (8,10,11)),0) + 
				SUM(tempb.valorunitario * tempb.cantidadog / 100) AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 22) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb	
	INNER JOIN	ttempog tempb ON ucsb.id_unidadconstructivasb = tempb.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint
	GROUP BY	ucsb.id_unidadconstructivasb, ucsb.codigo, ucsb.descripcion;
	
	--GRAVAMEN ADUANERO 
	INSERT INTO ttempog
	SELECT		6 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'GRAVAMEN ADUANERO '::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 26) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 1;
	
	--GASTOS ADUANEROS
	INSERT INTO ttempog
	SELECT		7 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'GASTOS ADUANEROS'::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 27) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 1;
	
	--ITF
	INSERT INTO ttempog
	SELECT		8 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'ITF'::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 28) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 1;
	
	--BOLETA BANCARIA DE SERIEDAD DE LA OFERTA 
	INSERT INTO ttempog
	SELECT		9 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'BOLETA BANCARIA DE SERIEDAD DE LA OFERTA'::varchar AS otrosgastos,
				coalesce((SELECT SUM(ttempequipos.cantidadog) FROM ttempequipos),0) +	
				coalesce((SELECT SUM(ttempmaquinaria.cantidadog) FROM ttempmaquinaria),0) + 
				coalesce((SELECT SUM(ttempmateriales.cantidadog) FROM ttempmateriales),0) +
				coalesce((SELECT SUM(ttempcdc.valorobracivil) FROM ttempcdc),0) +
				SUM(tempa.valorunitario * tempa.cantidadog / 100) AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 29) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item <> 8
	GROUP BY	ucsb.id_unidadconstructivasb, ucsb.codigo, ucsb.descripcion;
	
	--PAGO DE DERECHO DE LICENCIA DE TRANSMISIÓN
	INSERT INTO ttempog
	SELECT		10 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'PAGO DE DERECHO DE LICENCIA DE TRANSMISIÓN'::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 30) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 9;
	
	--BOLETA BANCARIA DE CUMPLIMIENTO
	INSERT INTO ttempog
	SELECT		11 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'BOLETA BANCARIA DE CUMPLIMIENTO'::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 31) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 9;
	
	--IMPUESTO A LAS TRANSACCIONES IT
	INSERT INTO ttempog
	SELECT		17 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'IMPUESTO A LAS TRANSACCIONES IT'::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 34) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 9;
	
	--SEGUROS
	INSERT INTO ttempog
	SELECT		12 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'SEGUROS'::varchar AS otrosgastos,
				coalesce((SELECT SUM(ttempequipos.cantidadog) FROM ttempequipos),0) +
				coalesce((SELECT SUM(ttempmaquinaria.cantidadog) FROM ttempmaquinaria),0) + 
				coalesce((SELECT SUM(ttempmateriales.cantidadog) FROM ttempmateriales),0) + 
				coalesce((SELECT SUM(ttempcdc.valorobracivil) FROM ttempcdc WHERE ttempcdc.id_obracivil not in (8,10,11)),0) +
				SUM(tempa.cantidadog * tempa.valorunitario / 100 ) AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 15) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint
	GROUP BY	ucsb.id_unidadconstructivasb, ucsb.codigo, ucsb.descripcion;
	
	--ADMINISTRACIÓN
	INSERT INTO ttempog
	SELECT		13 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'ADMINISTRACIÓN'::varchar AS otrosgastos,
				coalesce((SELECT SUM(ttempmateriales.cantidadog) FROM ttempmateriales),0) + 
				coalesce((SELECT SUM(ttempcdc.valorobracivil) FROM ttempcdc WHERE ttempcdc.id_obracivil not in (8,10,11)),0) +
				SUM(tempa.cantidadog * tempa.valorunitario / 100 ) AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 32) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item IN (2,3,4,5)
	GROUP BY	ucsb.id_unidadconstructivasb, ucsb.codigo, ucsb.descripcion;
	
	--IMPREVISTOS
	INSERT INTO ttempog
	SELECT		14 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'IMPREVISTOS'::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 20) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 13;
	
	--UTILIDAD
	INSERT INTO ttempog
	SELECT		15 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'UTILIDAD'::varchar AS otrosgastos,
				tempa.cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 33) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint AND tempa.id_item = 13;
	
	--GASTOS FINANCIEROS
	INSERT INTO ttempog
	SELECT		16 AS id_item,
				ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				ucsb.descripcion,
				'GASTOS FINANCIEROS'::varchar AS otrosgastos,
				coalesce((SELECT SUM(ttempequipos.cantidadog) FROM ttempequipos),0) +
				coalesce((SELECT SUM(ttempmaquinaria.cantidadog) FROM ttempmaquinaria),0) + 
				coalesce((SELECT SUM(ttempmateriales.cantidadog) FROM ttempmateriales),0) + 
				coalesce((SELECT SUM(ttempcdc.valorobracivil) FROM ttempcdc WHERE ttempcdc.id_obracivil not in (8,10,11)),0) +
				SUM(tempa.cantidadog * tempa.valorunitario / 100 ) AS cantidadog,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 14) AS valorunitario,
				0.0 AS valorog
	FROM		snx.tunidadconstructivasb ucsb
	INNER JOIN	ttempog tempa ON ucsb.id_unidadconstructivasb = tempa.id_unidadconstructivasb
	WHERE 		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint
	GROUP BY	ucsb.id_unidadconstructivasb, ucsb.codigo, ucsb.descripcion;
	
	
	UPDATE	ttempog
	SET		valorog = ttempog.cantidadog * ttempog.valorunitario / 100
	WHERE	ttempog.valorog = 0.0;
	
	RETURN QUERY
	SELECT * FROM ttempog ORDER BY id_item;
	
	
end;

$BODY$;

ALTER FUNCTION snx.calcularotrosgastosucsb(integer)
    OWNER TO dbkerp_conexion;