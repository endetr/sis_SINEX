-- FUNCTION: snx.obtenerotrasunidadesconstructivas(character varying, integer, integer, numeric)

-- DROP FUNCTION snx.obtenerotrasunidadesconstructivas(character varying, integer, integer, numeric);

CREATE OR REPLACE FUNCTION snx.obtenerotrasunidadesconstructivas(
	id_otraunidadint character varying,
	numerobahiasint integer,
	id_revistaint integer,
	distanciatrans numeric DEFAULT 36)
    RETURNS TABLE(id_otraunidad character varying, codigo character varying, descripcion character varying, codigo_descripcion character varying, valortotal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$



BEGIN
	DROP TABLE if exists ttempotrasunidades;
	
	--Módulo Común
	CREATE TEMP table ttempotrasunidades AS 
	SELECT		TA.id_otraunidad, TA.codigo, TA.descripcion, TA.codigo_descripcion,
				TA.valortotal + (SELECT SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(TA.id_unidadconstructivamo,numerobahiasint,TA.valortotal,1,id_revistaint,distanciatrans)) AS valortotal
	FROM		(
				SELECT		CAST('1000000' || CAST(unconmo.id_unidadconstructivamo as character varying) AS character varying) AS id_otraunidad,				
							unconmo.id_unidadconstructivamo,
							unconmo.codigo,
							unconmo.descripcion,	
							CAST(unconmo.codigo || ' - ' || unconmo.descripcion AS character varying) AS codigo_descripcion,
							CASE 
								WHEN id_revistaint=1 THEN cast(sum(valoc.preciounitariorlp * mooc.cantidadobra) as numeric(18,2))	
								WHEN id_revistaint=2 THEN cast(sum(valoc.preciounitariorcb * mooc.cantidadobra) as numeric(18,2))
								ELSE cast(sum(valoc.preciounitariorsc * mooc.cantidadobra) as numeric(18,2))
							END AS valortotal
				FROM 		snx.tunidadconstructivamo unconmo	
				INNER JOIN 	snx.tucmogrupo mogr on unconmo.id_unidadconstructivamo = mogr.id_unidadconstructivamo
				INNER JOIN 	snx.tucmoobracivil mooc on mogr.id_ucmogrupo = mooc.id_ucmogrupo
				INNER JOIN 	snx.tobracivilmoe ocmoe on mooc.id_obracivilmoe = ocmoe.id_obracivilmoe
				INNER JOIN	snx.calcularvaloresobracivilmoe(ocmoe.id_obracivilmoe) valoc ON ocmoe.id_obracivilmoe = valoc.id_obracivilmoe
				WHERE		('1000000' || CAST(unconmo.id_unidadconstructivamo as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = ''
				GROUP BY	unconmo.id_unidadconstructivamo, unconmo.codigo, unconmo.descripcion
				) TA;
																						  
	--Edificiones
	INSERT INTO ttempotrasunidades
	SELECT		TA.id_otraunidad, TA.codigo, TA.descripcion, TA.codigo_descripcion,
				TA.valortotal + (SELECT SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(TA.id_unidadconstructivaedif,numerobahiasint,TA.valortotal,2,id_revistaint,distanciatrans)) AS valortotal
	FROM		(										  
				SELECT		CAST('2000000' || CAST(uce.id_unidadconstructivaedif as character varying) AS character varying) AS id_otraunidad,
							uce.id_unidadconstructivaedif,
							uce.codigo,
							uce.descripcion,
							CAST(uce.codigo || ' - ' || uce.descripcion AS character varying) AS codigo_descripcion,
							CASE 
								WHEN id_revistaint=1 THEN cast(sum(valoc.preciounitariorlp * edoc.cantidadobracivil) as numeric(18,2))						
								WHEN id_revistaint=2 THEN cast(sum(valoc.preciounitariorcb * edoc.cantidadobracivil) as numeric(18,2))						
								ELSE cast(sum(valoc.preciounitariorsc * edoc.cantidadobracivil) as numeric(18,2))						
							END as valortotal
				FROM 		snx.tunidadconstructivaedif uce	
				INNER JOIN snx.tucedifgrupo edgr on uce.id_unidadconstructivaedif = edgr.id_unidadconstructivaedif
				INNER JOIN snx.tucedifsubgrupo edsgr on edgr.id_ucedifgrupo = edsgr.id_ucedifgrupo
				INNER JOIN snx.tucedifobracivil edoc on edsgr.id_ucedifsubgrupo = edoc.id_ucedifsubgrupo
				INNER JOIN snx.tobracivilmoe ocmoe on edoc.id_obracivilmoe = edoc.id_obracivilmoe
				INNER JOIN snx.calcularvaloresobracivilmoe(edoc.id_obracivilmoe) valoc ON ocmoe.id_obracivilmoe = valoc.id_obracivilmoe
				WHERE		('2000000' || CAST(uce.id_unidadconstructivaedif as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = ''
				GROUP BY	uce.id_unidadconstructivaedif, uce.codigo, uce.descripcion
				) TA;
																							   
	--Módulo Eléctrico
	INSERT INTO ttempotrasunidades
	SELECT		mcuc.id_otraunidad,
				mcuc.codigo,
				mcuc.descripcion,
				mcuc.codigo_descripcion,
				mcuc.valortotal + (SELECT SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(mcuc.id_unidadconstructivamcelec,numerobahiasint,mcuc.valortotal,3,id_revistaint)) AS valortotal
	FROM		(
				SELECT		CAST('3000000' || CAST(mcuc.id_unidadconstructivamcelec as character varying) AS character varying) AS id_otraunidad,
							mcuc.id_unidadconstructivamcelec,
							mcuc.codigo,
							mcuc.descripcion,
							CAST(mcuc.codigo || ' - ' || mcuc.descripcion AS character varying) AS codigo_descripcion,																							   				
							(select SUM(CAST(CASE
								WHEN tuci.descripcion = 'Cantidad de cable de tierra 4/0 AWG (m)' THEN (((select cableporbahina from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)*mcuc.numerobahias) 
								+(mcuc.areasub * (select factortorre from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion))) * tuci.precio
								WHEN tuci.descripcion = 'Cantidad de cable de guarda Alumoweld (m)' THEN ((mcuc.numerobahias * (select cableporbahia from snx.tmcelecapantallamiento where id_claseaislamiento = mcuc.id_claseaislacion))* tuci.precio)
								WHEN tuci.descripcion = 'Total de luminarias viales' THEN (ceil(mcuc.longitudvia / 25))* tuci.precio
								WHEN tuci.descripcion = 'Total de Luminarias en pórticos' THEN (mcuc.numerobahias * (select luminariaporpb from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
								WHEN tuci.descripcion = 'Total tubo PVC 2.5 enterrado' THEN (mcuc.numerobahias * (select tubopvc from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
								WHEN tuci.descripcion = 'Total cable 4x12 AWG' THEN (mcuc.numerobahias * (select totalcable from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
								ELSE 0.0
								END AS numeric))
							from snx.tucmceitem tuci
							WHERE tuci.id_unidadconstructivamcelec = mcuc.id_unidadconstructivamcelec) as valortotal	
				FROM 		snx.tunidadconstructivamcelec mcuc	
				INNER JOIN 	snx.tclaseaislacion clas on clas.id_claseaislacion = mcuc.id_claseaislacion
				INNER JOIN 	snx.ttensionservicio ten on ten.id_tensionservicio = mcuc.id_tensionservicio
				WHERE		('3000000' || CAST(mcuc.id_unidadconstructivamcelec as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = ''
				) mcuc;
															
	--Compensación
	INSERT INTO ttempotrasunidades
	SELECT		CAST('4000000' || CAST(ucc.id_unidadconstructivacomp as character varying) AS character varying) AS id_otraunidad,								
				ucc.codigo_unicomp AS codigo,
				ucc.unidadconstructivacomp AS descripcion,
				CAST(ucc.codigo_unicomp || ' - ' || ucc.unidadconstructivacomp AS character varying) AS codigo_descripcion,			
				(ucc.capacidad * ucc.valor) AS valortotal	
	FROM 		snx.tunidadconstructivacomp ucc
	WHERE		('4000000' || CAST(ucc.id_unidadconstructivacomp as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = '';															
															
	--Estudios Especiales
	INSERT INTO ttempotrasunidades
	select		CAST('5000000' || CAST(ucee.id_unidadconstructivaeep as character varying) AS character varying) AS id_otraunidad,								
				CAST(ucee.codigo_unieepp || ' (' || ten.tensionservicio || ')' AS character varying) AS codigo,	
				ucee.descripcion,
				CAST(ucee.codigo_unieepp || ' (' || ten.tensionservicio || ') - ' || ucee.descripcion AS character varying) AS codigo_descripcion,																				
				cast(((select sum(valor * cantidadeep) from snx.tuceepitem where id_unidadconstructivaeep = ucee.id_unidadconstructivaeep) * (1 + (select sum(valor/100) from snx.tueepotros where id_unidadconstructivaeep = ucee.id_unidadconstructivaeep))) as numeric(18,2)) as valortotal				
	FROM 		snx.tunidadconstructivaeep ucee
	INNER JOIN	snx.ttensionservicio ten on Ten.id_tensionservicio = ucee.id_tensionservicio
	WHERE		('5000000' || CAST(ucee.id_unidadconstructivaeep as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = '';		
	
	--Tableros
	INSERT INTO ttempotrasunidades
	SELECT		CAST('6000000' || CAST(uctcpenc.id_unidadconstructivaenctablerocp as character varying) AS character varying) AS id_otraunidad,	
				uctcpenc.codigo,
				uctcpenc.descripcion,
				CAST(uctcpenc.codigo || ' - ' || uctcpenc.descripcion AS character varying) AS codigo_descripcion,							
				coalesce(items.valoritem,0) + coalesce(uctcserv.valorserv,0) + (SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(uctcpenc.id_unidadconstructivaenctablerocp,numerobahiasint,coalesce(items.valoritem,0)+coalesce(uctcserv.valorserv,0),4)) AS valortotal
	FROM 		snx.tunidadconstructivaenctablerocp uctcpenc	
	LEFT JOIN 	(
				  SELECT 	items.id_unidadconstructivaenctablerocp,
							SUM(items.cantidadtablerocp * items.precio) AS valoritem
				  FROM		snx.tunidadconstructivatablerocp items
				  GROUP BY	items.id_unidadconstructivaenctablerocp
				 ) items ON uctcpenc.id_unidadconstructivaenctablerocp = items.id_unidadconstructivaenctablerocp
	LEFT JOIN 	(
			  	SELECT		uctcserv.id_unidadconstructivaenctablerocp,
							SUM(uctcserv.cantidadserv * uctcserv.precio) AS valorserv
			  	FROM		snx.tunidadconstructivatablerocpserv uctcserv 
			  	GROUP BY	uctcserv.id_unidadconstructivaenctablerocp
			    ) uctcserv ON uctcpenc.id_unidadconstructivaenctablerocp = uctcserv.id_unidadconstructivaenctablerocp
	WHERE		('6000000' || CAST(uctcpenc.id_unidadconstructivaenctablerocp as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = '';		
	
	--Servicios Auxiliares
	INSERT INTO ttempotrasunidades
	SELECT		CAST('7000000' || CAST(ucsaenc.unidadconstructivaencseraux as character varying) AS character varying) AS id_otraunidad,	
				ucsaenc.codigo,
				ucsaenc.descripcion,
				CAST(ucsaenc.codigo || ' - ' || ucsaenc.descripcion AS character varying) AS codigo_descripcion,
				coalesce(SUM(items.cantidadseraux * items.precio),0) + (SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(ucsaenc.unidadconstructivaencseraux,numerobahiasint,coalesce(SUM(items.cantidadseraux * items.precio),0))) as valortotal
	FROM		snx.tunidadconstructivaencseraux ucsaenc	
	LEFT JOIN 	snx.tunidadconstructivaseraux items ON ucsaenc.unidadconstructivaencseraux = items.unidadconstructivaencseraux
	WHERE		('7000000' || CAST(ucsaenc.unidadconstructivaencseraux as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = ''
	GROUP BY	ucsaenc.unidadconstructivaencseraux, ucsaenc.codigo, ucsaenc.descripcion;
	
	--Comunicaciones
	INSERT INTO ttempotrasunidades
	SELECT		CAST('8000000' || CAST(uccmenc.id_unidadconstructivaenccomun as character varying) AS character varying) AS id_otraunidad,	
				uccmenc.codigo,
				uccmenc.descripcion,
				CAST(uccmenc.codigo || ' - ' || uccmenc.descripcion AS character varying) AS codigo_descripcion,
				coalesce(SUM(items.cantidadcomun * items.precio),0) + (SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(uccmenc.id_unidadconstructivaenccomun,numerobahiasint,coalesce(SUM(items.cantidadcomun * items.precio),0))) AS valortotal
	FROM 		snx.tunidadconstructivaenccomun uccmenc	
	LEFT JOIN	snx.tunidadconstructivacomun items ON uccmenc.id_unidadconstructivaenccomun = items.id_unidadconstructivaenccomun
	WHERE		('8000000' || CAST(uccmenc.id_unidadconstructivaenccomun as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = ''
	GROUP BY	uccmenc.id_unidadconstructivaenccomun, uccmenc.codigo, uccmenc.descripcion;
		
	--Estudios y Trámites Ambientales
	INSERT INTO ttempotrasunidades
	SELECT		CAST('9000000' || CAST(uceta.id_unidadconstructivaeta as character varying) AS character varying) AS id_otraunidad,	
				uceta.codigo,
				uceta.unidadconstructivaeta as descripcion,
				CAST(uceta.codigo || ' - ' || uceta.unidadconstructivaeta AS character varying) AS codigo_descripcion,
				coalesce(SUM(items.cantidaditem * items.valorunitario),0) + (SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(uceta.id_unidadconstructivaeta,0,coalesce(SUM(items.cantidaditem * items.valorunitario),0),9)) AS valortotal
	FROM 		snx.tunidadconstructivaeta uceta
	LEFT JOIN 	snx.tunidadconstructivaetaitem items on uceta.id_unidadconstructivaeta = items.id_unidadconstructivaeta
	WHERE		('9000000' || CAST(uceta.id_unidadconstructivaeta as character varying) = id_otraunidadint AND id_otraunidadint <> '') OR id_otraunidadint = ''
	GROUP BY	uceta.id_unidadconstructivaeta, uceta.codigo, uceta.unidadconstructivaeta;

	RETURN QUERY
	SELECT * FROM ttempotrasunidades;
END;



$BODY$;

ALTER FUNCTION snx.obtenerotrasunidadesconstructivas(character varying, integer, integer, numeric)
    OWNER TO postgres;
