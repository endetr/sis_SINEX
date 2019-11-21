-- FUNCTION: snx.calcularobracivilucsbsingle(integer, integer, integer)

-- DROP FUNCTION snx.calcularobracivilucsbsingle(integer, integer, integer);

CREATE OR REPLACE FUNCTION snx.calcularobracivilucsbsingle(
	id_unidadconstructivasbint integer,
	id_terrenosbint integer DEFAULT 2,
	id_revistaint integer DEFAULT 1)
    RETURNS TABLE(id_unidadconstructivasb integer, codigo character varying, id_obracivil integer, descripcion character varying, obracivil character varying, unidadabrev character varying, cantidadpeso numeric, valorunitario numeric, valorobracivil numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

DECLARE
	valorhormigon numeric := 0;
	distanciatransporteint numeric := 0;
	factor1 numeric := 1;
	factor2 numeric := 1;
	
BEGIN	
	DROP TABLE if exists ttempobracivil;
	DROP TABLE if exists ttemppesomate;	
	DROP TABLE if exists ttempcantoc;
	
	factor1 := (SELECT ter.factor FROM snx.tterrenosb ter WHERE id_terrenosb = id_terrenosbint);
	IF id_terrenosbint = 4 THEN
		factor2 := 1.5;
	END IF;
	
	--Peso materiales
	CREATE TEMP table ttemppesomate AS 
	SELECT  tmateri.id_unidadconstructivasb,
			tmateri.codigo,
			tmateri.descripcion,                                      
			tmateri.id_material,
			tmateri.material,
			SUM(tmateri.Peso) AS Peso
	FROM 	(
			SELECT 		ucsb.id_unidadconstructivasb,
						ucsb.codigo,
						ucsb.descripcion,                                           
						mate.id_material,
						mate.material,
						CASE mate.id_unidad
							WHEN 6 THEN ucsbe.cantidadequ * emate.cantidadequimat / 1000
							WHEN 7 THEN ucsbe.cantidadequ * emate.cantidadequimat / 1000
							WHEN 9 THEN ucsbe.cantidadequ * emate.cantidadequimat
						END AS Peso
			FROM		snx.tucsbequipo ucsbe
			INNER JOIN 	snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
			INNER JOIN 	snx.tequipomaterial emate ON ucsbe.id_equipo = emate.id_equipo
			INNER JOIN 	snx.tmaterial mate ON emate.id_material = mate.id_material		
			WHERE 		ucsbe.cantidadequ > 0 AND emate.cantidadequimat > 0 AND mate.id_unidad in (6,7,9)
			UNION ALL
			SELECT 		ucsb.id_unidadconstructivasb,
						ucsb.codigo,
						ucsb.descripcion,                                           
						mate.id_material,
						mate.material,
						CASE mate.id_unidad
							WHEN 6 THEN ucsbm.cantidadmaq * mmate.cantidadmate / 1000
							WHEN 7 THEN ucsbm.cantidadmaq * mmate.cantidadmate / 1000
							WHEN 9 THEN ucsbm.cantidadmaq * mmate.cantidadmate
						END AS Peso
			FROM 		snx.tucsbmaquinaria ucsbm
			INNER JOIN 	snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
			INNER JOIN 	snx.tmaquinariamaterial mmate ON ucsbm.id_maquinaria = mmate.id_maquinaria
			INNER JOIN 	snx.tmaterial mate ON mmate.id_material = mate.id_material
			WHERE 		ucsbm.cantidadmaq > 0 AND mmate.cantidadmate > 0 AND mate.id_unidad in (6,7,9)
			) as tmateri 
	where	tmateri.id_unidadconstructivasb = id_unidadconstructivasbint
	GROUP BY tmateri.id_unidadconstructivasb,
			tmateri.codigo,
			tmateri.descripcion,                                      
			tmateri.id_material,
			tmateri.material;
	
	--Cantidades OC Equipo
	CREATE TEMP TABLE ttempcantoc AS
	SELECT 		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				equoc.id_obracivil,
				ucsb.descripcion,
				equoc.cantidadeoc * ucsbe.cantidadequ AS cantidadpeso,
				1 AS Origen
	FROM 		snx.tucsbequipo ucsbe
	INNER JOIN snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb			
	INNER JOIN snx.tequipoobracivil equoc ON ucsbe.id_equipo = equoc.id_equipo
	WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;
	
	--Cantidades OC Maquinaria	
	INSERT INTO ttempcantoc
	SELECT 		ucsb.id_unidadconstructivasb,
				ucsb.codigo,
				moc.id_obracivil,
				ucsb.descripcion,
				moc.cantidadmoc * ucsbm.cantidadmaq AS cantidadpeso,
				2 AS Origen
	FROM 		snx.tucsbmaquinaria ucsbm
	INNER JOIN snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
	INNER JOIN snx.tmaquinariaobracivil moc ON ucsbm.id_maquinaria = moc.id_maquinaria			
	WHERE		ucsb.id_unidadconstructivasb = id_unidadconstructivasbint;
				
	--Estructuras Galvanizadas
	CREATE TEMP TABLE ttempobracivil AS
	SELECT  	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion, 
				oc.obracivil,
				un.unidadabrev,
				SUM(tobracivil.cantidadpeso) * factor1 * factor2 AS cantidadpeso,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 4) * 1000 AS valorunitario,
				0.0 AS valorobracivil
	FROM 		ttempcantoc as tobracivil 
	INNER JOIN	snx.tobracivil oc ON tobracivil.id_obracivil = oc.id_obracivil
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad
	where		tobracivil.id_unidadconstructivasb = id_unidadconstructivasbint AND tobracivil.id_obracivil = 3
	GROUP BY	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev;		
				
	--Excavación y Relleno
	INSERT INTO ttempobracivil
	SELECT  	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion, 
				oc.obracivil,
				un.unidadabrev,
				SUM(tobracivil.cantidadpeso) * factor1 AS cantidadpeso,
				CASE 
					WHEN tobracivil.id_obracivil=4 THEN (SELECT CASE WHEN id_revistaint=1 THEN preciounitariorlp WHEN id_revistaint=2 THEN preciounitariorcb WHEN id_revistaint=3 THEN preciounitariorsc END preciounitario FROM snx.calcularvaloresobracivilmoe(31))
					WHEN tobracivil.id_obracivil=6 THEN (SELECT CASE WHEN id_revistaint=1 THEN preciounitariorlp WHEN id_revistaint=2 THEN preciounitariorcb WHEN id_revistaint=3 THEN preciounitariorsc END preciounitario FROM snx.calcularvaloresobracivilmoe(89))
				END AS valorunitario,
				0.0 AS valorobracivil
	FROM 		ttempcantoc as tobracivil 
	INNER JOIN	snx.tobracivil oc ON tobracivil.id_obracivil = oc.id_obracivil
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad
	INNER JOIN	snx.tunidadconstructivasb ucsb ON tobracivil.id_unidadconstructivasb = ucsb.id_unidadconstructivasb	
	where		tobracivil.id_unidadconstructivasb = id_unidadconstructivasbint AND tobracivil.id_obracivil in (4,6)
	GROUP BY	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev;
	
	--Hormigón y Acero
	INSERT INTO ttempobracivil
	SELECT  	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion, 
				oc.obracivil,
				un.unidadabrev,
				SUM(tobracivil.cantidadpeso) AS cantidadpeso,
				CASE tobracivil.id_obracivil
					WHEN 7 THEN (SELECT CASE WHEN id_revistaint=1 THEN preciounitariorlp WHEN id_revistaint=2 THEN preciounitariorcb WHEN id_revistaint=3 THEN preciounitariorsc END preciounitario FROM snx.calcularvaloresobracivilmoe(3))
					ELSE (SELECT CASE WHEN id_revistaint=1 THEN preciounitariorlp WHEN id_revistaint=2 THEN preciounitariorcb WHEN id_revistaint=3 THEN preciounitariorsc END preciounitario FROM snx.calcularvaloresobracivilmoe(44))
				END AS valorunitario,
				0.0 AS valorobracivil
	FROM 		ttempcantoc as tobracivil 
	INNER JOIN	snx.tobracivil oc ON tobracivil.id_obracivil = oc.id_obracivil
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad
	INNER JOIN	snx.tunidadconstructivasb ucsb ON tobracivil.id_unidadconstructivasb = ucsb.id_unidadconstructivasb	
	where		tobracivil.id_unidadconstructivasb = id_unidadconstructivasbint AND tobracivil.id_obracivil in (5,7)
	GROUP BY	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev;
				
	--Peso Maquinaria
	INSERT INTO ttempobracivil
	SELECT  	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion, 
				'PESO SUMINISTROS IMPORTADOS (MÁQUINAS)' AS obracivil,
				un.unidadabrev,
				SUM(tobracivil.cantidadpeso) AS cantidadpeso,
				0.0 AS valorunitario,
				0.0 valorobracivil
	FROM 		ttempcantoc as tobracivil 
	INNER JOIN	snx.tobracivil oc ON tobracivil.id_obracivil = oc.id_obracivil
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad	
	where		tobracivil.id_unidadconstructivasb = id_unidadconstructivasbint AND tobracivil.id_obracivil = 1 and tobracivil.Origen = 2
	GROUP BY	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev;
				
	--Peso Equipos
	INSERT INTO ttempobracivil
	SELECT  	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				12 AS id_obracivil,
				tobracivil.descripcion, 
				'PESO SUMINISTROS IMPORTADOS' AS obracivil,
				un.unidadabrev,
				SUM(tobracivil.cantidadpeso) + 
				(SELECT ttempobracivil.cantidadpeso FROM ttempobracivil WHERE ttempobracivil.id_obracivil = 3) + 
				(SELECT SUM(Peso) FROM ttemppesomate) AS cantidadpeso,
				0.0 AS valorunitario,
				0.0 valorobracivil
	FROM 		ttempcantoc as tobracivil 
	INNER JOIN	snx.tobracivil oc ON tobracivil.id_obracivil = oc.id_obracivil
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad	
	where		tobracivil.id_unidadconstructivasb = id_unidadconstructivasbint AND tobracivil.id_obracivil = 1 and tobracivil.Origen = 1
	GROUP BY	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev;
				
	--Peso
	INSERT INTO ttempobracivil
	SELECT  	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				13 AS id_obracivil,
				tobracivil.descripcion, 
				'PESO SUMINISTROS NACIONALES' AS obracivil,
				un.unidadabrev,
				((SELECT ttempobracivil.cantidadpeso FROM ttempobracivil WHERE ttempobracivil.id_obracivil = 5)*2.4) + 
				((SELECT ttempobracivil.cantidadpeso FROM ttempobracivil WHERE ttempobracivil.id_obracivil = 6)/1000) AS cantidadpeso,
				0.0 AS valorunitario,
				0.0 valorobracivil
	FROM 		ttempcantoc as tobracivil 
	INNER JOIN	snx.tobracivil oc ON tobracivil.id_obracivil = oc.id_obracivil
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad	
	where		tobracivil.id_unidadconstructivasb = id_unidadconstructivasbint AND tobracivil.id_obracivil = 1
	GROUP BY	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev;
				
	--TRANSPORTE SUMINISTROS IMPORTADOS (MÁQUINAS)
	INSERT INTO ttempobracivil
	SELECT 		ttempobracivil.id_unidadconstructivasb,
				ttempobracivil.codigo,
				oc.id_obracivil,
				ttempobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev,
				((SELECT SUM(ttempobracivil.cantidadpeso) FROM ttempobracivil WHERE ttempobracivil.id_obracivil = 1) * 
				(SELECT distanciatransporte FROM snx.tunidadconstructivasb ucsb WHERE ucsb.id_unidadconstructivasb = id_unidadconstructivasbint)) AS cantidadpeso,
				 (SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 1)*3 AS valorunitario,
				0.0 AS valorobracivil
	FROM 		snx.tobracivil oc
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad
	CROSS JOIN	ttempobracivil
	WHERE		oc.id_obracivil = 8 AND ttempobracivil.id_obracivil = 1;
	
	--TRANSPORTE SUMINISTROS IMPORTADOS
	INSERT INTO ttempobracivil
	SELECT 		ttempobracivil.id_unidadconstructivasb,
				ttempobracivil.codigo,
				oc.id_obracivil,
				ttempobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev,
				((SELECT SUM(ttempobracivil.cantidadpeso) FROM ttempobracivil WHERE ttempobracivil.id_obracivil = 12) * 
				(SELECT distanciatransporte FROM snx.tunidadconstructivasb ucsb WHERE ucsb.id_unidadconstructivasb = id_unidadconstructivasbint)) AS cantidadpeso,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 1) AS valorunitario,
				0.0 AS valorobracivil
	FROM 		snx.tobracivil oc
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad
	CROSS JOIN	ttempobracivil
	WHERE		oc.id_obracivil = 10 AND ttempobracivil.id_obracivil = 12;
	
	--TRANSPORTE SUMINISTROS NACIONALES				 
	INSERT INTO ttempobracivil
	SELECT 		ttempobracivil.id_unidadconstructivasb,
				ttempobracivil.codigo,
				oc.id_obracivil,
				ttempobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev,
				((SELECT SUM(ttempobracivil.cantidadpeso) FROM ttempobracivil WHERE ttempobracivil.id_obracivil = 13) * 
				(SELECT distanciatransportemate FROM snx.tunidadconstructivasb ucsb WHERE ucsb.id_unidadconstructivasb = id_unidadconstructivasbint)) AS cantidadpeso,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 1) AS valorunitario,
				0.0 AS valorobracivil
	FROM 		snx.tobracivil oc
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad
	CROSS JOIN	ttempobracivil
	WHERE		oc.id_obracivil = 11 AND ttempobracivil.id_obracivil = 13;
		
	--Mano de Obra
	INSERT INTO ttempobracivil
	SELECT  	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion, 
				oc.obracivil,
				un.unidadabrev,
				SUM(tobracivil.cantidadpeso) + 
				((SELECT SUM(ttempobracivil.cantidadpeso) FROM ttempobracivil WHERE ttempobracivil.id_obracivil = 3)*1000*0.0032) AS cantidadpeso,
				(SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 3) AS valorunitario,
				0.0 valorobracivil
	FROM 		ttempcantoc as tobracivil 
	INNER JOIN	snx.tobracivil oc ON tobracivil.id_obracivil = oc.id_obracivil
	INNER JOIN	snx.tunidad un ON oc.id_unidad = un.id_unidad	
	where		tobracivil.id_unidadconstructivasb = id_unidadconstructivasbint AND tobracivil.id_obracivil = 2
	GROUP BY	tobracivil.id_unidadconstructivasb,
				tobracivil.codigo,
				tobracivil.id_obracivil,
				tobracivil.descripcion,
				oc.obracivil,
				un.unidadabrev;
	
	UPDATE	ttempobracivil
	SET		valorobracivil = ttempobracivil.cantidadpeso * ttempobracivil.valorunitario;
	
	
	
	
	RETURN QUERY
	SELECT * FROM ttempobracivil;

end;

$BODY$;

ALTER FUNCTION snx.calcularobracivilucsbsingle(integer, integer, integer)
    OWNER TO dbkerp_admin;
