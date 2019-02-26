CREATE OR REPLACE FUNCTION snx.insertarotrasucsb(id_otraunidadint character varying, id_ucsbvaloraroucint integer, numerobahiasint integer, id_revistaint integer, distanciatrans numeric DEFAULT 36)
 RETURNS void
 LANGUAGE plpgsql
AS $function$

DECLARE
	valototaltemp numeric := 0;
	id_ucsbotro integer := 0;
BEGIN
	--Módulo Común Civil
	IF (SUBSTRING(id_otraunidadint,1,1) = '1') THEN
		--Detalle
		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					A.nivel, A.descripcion, A.unidadabrev,
					A.cantidaditem, A.valorunitario, A.valortotal
		FROM		(
					SELECT		1 AS nivel,
								mogr.unmogrupo as descripcion,	
								CAST('' AS character varying) AS unidadabrev,
								CAST(CAST(mogr.id_ucmogrupo as character varying) as BYTEA) AS orden,
								0.0 AS cantidaditem,
								0.0 AS valorunitario,
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
					WHERE		'1000000' || CAST(unconmo.id_unidadconstructivamo as character varying) = id_otraunidadint																										  
					GROUP  BY 	mogr.unmogrupo, mogr.id_ucmogrupo
					UNION ALL
					SELECT		3 AS nivel,
								ocmoe.obracivilmoe  as descripcion,
								uni.unidadabrev AS unidadabrev,
								CAST(CAST(mogr.id_ucmogrupo as character varying) || '.' || CAST(mooc.id_obracivilmoe as character varying) as BYTEA) AS orden,
								mooc.cantidadobra AS cantidaditem,
								CASE 
									WHEN id_revistaint=1 THEN valoc.preciounitariorlp 
									WHEN id_revistaint=2 THEN valoc.preciounitariorcb 
									ELSE valoc.preciounitariorsc
								END AS valorunitario,
								CASE 
									WHEN id_revistaint=1 THEN valoc.preciounitariorlp * mooc.cantidadobra	
									WHEN id_revistaint=2 THEN valoc.preciounitariorcb * mooc.cantidadobra
									ELSE valoc.preciounitariorsc * mooc.cantidadobra
								END AS valortotal
					FROM 		snx.tunidadconstructivamo unconmo	
					INNER JOIN 	snx.tucmogrupo mogr on unconmo.id_unidadconstructivamo = mogr.id_unidadconstructivamo
					INNER JOIN 	snx.tucmoobracivil mooc on mogr.id_ucmogrupo = mooc.id_ucmogrupo
					INNER JOIN 	snx.tobracivilmoe ocmoe on mooc.id_obracivilmoe = ocmoe.id_obracivilmoe
					INNER JOIN	snx.calcularvaloresobracivilmoe(ocmoe.id_obracivilmoe) valoc ON ocmoe.id_obracivilmoe = valoc.id_obracivilmoe
					INNER JOIN	snx.tunidad uni ON ocmoe.id_unidad = uni.id_unidad
					WHERE		'1000000' || CAST(unconmo.id_unidadconstructivamo as character varying) = id_otraunidadint										
					) A 
		ORDER BY	A.orden, A.descripcion;

		valototaltemp := (SELECT SUM(valortotal) FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = id_ucsbvaloraroucint AND tucsbvaloraroucdet.nivel=3);			
		id_ucsbotro := (SELECT unconmo.id_unidadconstructivamo FROM snx.tunidadconstructivamo unconmo WHERE '1000000' || CAST(unconmo.id_unidadconstructivamo as character varying) = id_otraunidadint);
											  
		--Otros Gastos
		INSERT INTO snx.tucsbvaloraroucog(id_ucsbvalorarouc, otrosgastos, cantidadog, valorunitario, valorog)											  
		SELECT 	id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
				tvalores.otrosgastos, tvalores.cantidadog,
				tvalores.valorunitario, tvalores.valorog											  
		FROM 	snx.calcularotrosgastosotrasuc(id_ucsbotro,numerobahiasint,valototaltemp,1,id_revistaint,distanciatrans) tvalores;	
	END IF;
	
	--Edificaciones
	IF (SUBSTRING(id_otraunidadint,1,1) = '2') THEN											  
		--Detalle
		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)		
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					A.nivel, A.descripcion, A.unidadabrev,
					A.cantidaditem, A.valorunitario, A.valortotal
		FROM		(
					SELECT		1 AS nivel,
								edgr.ucedifgrupo AS descripcion,
								CAST('' AS character varying) AS unidadabrev,
								CAST(CAST(edgr.id_ucedifgrupo as character varying) as BYTEA) AS orden,
								0.0 AS cantidaditem,
								0.0 AS valorunitario,
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
					WHERE		'2000000' || CAST(uce.id_unidadconstructivaedif as character varying) = id_otraunidadint AND id_otraunidadint <> ''
					GROUP BY	edgr.ucedifgrupo, edgr.id_ucedifgrupo
					UNION ALL
					SELECT		2 AS nivel,
								edsgr.ucedifsubgrupo AS descripcion,
								CAST('' AS character varying) AS unidadabrev,
								CAST(CAST(edgr.id_ucedifgrupo as character varying) || '.' || CAST(edsgr.id_ucedifsubgrupo as character varying) as BYTEA) AS orden,
								0.0 AS cantidaditem,
								0.0 AS valorunitario,
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
					WHERE		'2000000' || CAST(uce.id_unidadconstructivaedif as character varying) = id_otraunidadint AND id_otraunidadint <> ''
					GROUP BY	edsgr.ucedifsubgrupo, edgr.id_ucedifgrupo, edsgr.id_ucedifsubgrupo
					UNION ALL
					SELECT		3 AS nivel,
								ocmoe.obracivilmoe AS descripcion,
								uni.unidadabrev AS unidadabrev,
								CAST(CAST(edgr.id_ucedifgrupo as character varying) || '.' || CAST(edsgr.id_ucedifsubgrupo as character varying) || '.' || CAST(edoc.id_obracivilmoe as character varying) as BYTEA) AS orden,
								edoc.cantidadobracivil AS cantidaditem,
								CASE 
									WHEN id_revistaint=1 THEN cast(sum(valoc.preciounitariorlp) as numeric(18,2))						
									WHEN id_revistaint=2 THEN cast(sum(valoc.preciounitariorcb) as numeric(18,2))						
									ELSE cast(sum(valoc.preciounitariorsc) as numeric(18,2))						
								END AS valorunitario,
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
					INNER JOIN	snx.tunidad uni ON ocmoe.id_unidad = uni.id_unidad
					WHERE		'2000000' || CAST(uce.id_unidadconstructivaedif as character varying) = id_otraunidadint AND id_otraunidadint <> ''
					GROUP BY	ocmoe.obracivilmoe, edgr.id_ucedifgrupo, edsgr.id_ucedifsubgrupo, uni.unidadabrev, edoc.id_obracivilmoe, edoc.cantidadobracivil
					) A 
		ORDER BY	A.orden, A.descripcion;	

		valototaltemp := (SELECT SUM(valortotal) FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = id_ucsbvaloraroucint AND tucsbvaloraroucdet.nivel=3);			
		id_ucsbotro := (SELECT uce.id_unidadconstructivaedif FROM snx.tunidadconstructivaedif uce	 WHERE '2000000' || CAST(uce.id_unidadconstructivaedif as character varying) = id_otraunidadint);
											  
		--Otros Gastos
		INSERT INTO snx.tucsbvaloraroucog(id_ucsbvalorarouc, otrosgastos, cantidadog, valorunitario, valorog)											  
		SELECT 	id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
				tvalores.otrosgastos, tvalores.cantidadog,
				tvalores.valorunitario, tvalores.valorog											  
		FROM 	snx.calcularotrosgastosotrasuc(id_ucsbotro,numerobahiasint,valototaltemp,2,id_revistaint,distanciatrans) tvalores;											  
	END IF;	
											  
	--Eléctrico
	IF (SUBSTRING(id_otraunidadint,1,1) = '3') THEN												  
		--Detalle
		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					3 AS nivel, tuci.descripcion, CAST('' AS character varying) AS unidadabrev,
					CAST(CASE
							WHEN tuci.id_ucmeitem = 1 THEN (((select cableporbahina from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)*numerobahiasint) 
							+(mcuc.areasub * (select factortorre from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)))
							WHEN tuci.id_ucmeitem = 2 THEN ((numerobahiasint * (select cableporbahia from snx.tmcelecapantallamiento where id_claseaislamiento = mcuc.id_claseaislacion)))
							WHEN tuci.id_ucmeitem = 3 THEN (ceil(mcuc.longitudvia / 25))
							WHEN tuci.id_ucmeitem = 4 THEN (numerobahiasint * (select luminariaporpb from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))
							WHEN tuci.id_ucmeitem = 5 THEN (numerobahiasint * (select tubopvc from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))
							WHEN tuci.id_ucmeitem = 6 THEN (numerobahiasint * (select totalcable from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))
							ELSE 0.0
					END AS numeric) AS cantidaditem,
					tuci.precio AS valorunitario,
					CAST(CASE
							WHEN tuci.id_ucmeitem = 1 THEN (((select cableporbahina from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)*numerobahiasint) 
							+(mcuc.areasub * (select factortorre from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion))) * tuci.precio
							WHEN tuci.id_ucmeitem = 2 THEN ((numerobahiasint * (select cableporbahia from snx.tmcelecapantallamiento where id_claseaislamiento = mcuc.id_claseaislacion))* tuci.precio)
							WHEN tuci.id_ucmeitem = 3 THEN (ceil(mcuc.longitudvia / 25))* tuci.precio
							WHEN tuci.id_ucmeitem = 4 THEN (numerobahiasint * (select luminariaporpb from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
							WHEN tuci.id_ucmeitem = 5 THEN (numerobahiasint * (select tubopvc from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
							WHEN tuci.id_ucmeitem = 6 THEN (numerobahiasint * (select totalcable from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
							ELSE 0.0
						END AS numeric) AS valortotal
		FROM 		snx.tucmceitem tuci
		inner join 	snx.tunidadconstructivamcelec mcuc on mcuc.id_unidadconstructivamcelec = tuci.id_unidadconstructivamcelec															
		WHERE		'3000000' || CAST(tuci.id_unidadconstructivamcelec as character varying) = id_otraunidadint;

		valototaltemp := (SELECT SUM(valortotal) FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = id_ucsbvaloraroucint AND tucsbvaloraroucdet.nivel=3);			
		id_ucsbotro := (SELECT mcuc.id_unidadconstructivamcelec FROM snx.tunidadconstructivamcelec mcuc	 WHERE '3000000' || CAST(mcuc.id_unidadconstructivamcelec as character varying) = id_otraunidadint);
											  
		--Otros Gastos
		INSERT INTO snx.tucsbvaloraroucog(id_ucsbvalorarouc, otrosgastos, cantidadog, valorunitario, valorog)											  
		SELECT 	id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
				tvalores.otrosgastos, tvalores.cantidadog,
				tvalores.valorunitario, tvalores.valorog											  
		FROM 	snx.calcularotrosgastosotrasuc(id_ucsbotro,numerobahiasint,valototaltemp,3,id_revistaint,distanciatrans) tvalores;															
	END IF;	
															
	--Tablero
	IF (SUBSTRING(id_otraunidadint,1,1) = '6') THEN		
		--Detalle
		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT 		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					1 AS nivel, CAST('Items' AS character varying) AS descripcion, 
					CAST('' AS character varying) AS unidadabrev,
					0.0 AS cantidaditem,
					0.0 AS valorunitario,
					SUM(items.cantidadtablerocp * items.precio) AS valortotal
		FROM		snx.tunidadconstructivatablerocp items
		WHERE		'6000000' || CAST(items.id_unidadconstructivaenctablerocp as character varying) = id_otraunidadint
		GROUP BY	items.id_unidadconstructivaenctablerocp;

		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT 		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					3 AS nivel, items.unidadconstructivatablerocp AS descripcion, 
					CAST('' AS character varying) AS unidadabrev,
					items.cantidadtablerocp AS cantidaditem,
					items.precio AS valorunitario,
					items.cantidadtablerocp * items.precio AS valortotal
		FROM		snx.tunidadconstructivatablerocp items
		WHERE		'6000000' || CAST(items.id_unidadconstructivaenctablerocp as character varying) = id_otraunidadint;

		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					1 AS nivel, CAST('Servicios' AS character varying) AS descripcion, 
					CAST('' AS character varying) AS unidadabrev,
					0.0 AS cantidaditem,
					0.0 AS valorunitario,
					SUM(uctcserv.cantidadserv * uctcserv.precio) AS valortotal
		FROM		snx.tunidadconstructivatablerocpserv uctcserv 
		WHERE		'6000000' || CAST(uctcserv.id_unidadconstructivaenctablerocp as character varying) = id_otraunidadint
		GROUP BY	uctcserv.id_unidadconstructivaenctablerocp;

		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					3 AS nivel, uctcserv.unidadconstructivatablerocpserv AS descripcion, 
					CAST('' AS character varying) AS unidadabrev,
					uctcserv.cantidadserv AS cantidaditem,
					uctcserv.precio AS valorunitario,
					uctcserv.cantidadserv * uctcserv.precio AS valortotal
		FROM		snx.tunidadconstructivatablerocpserv uctcserv 
		WHERE		'6000000' || CAST(uctcserv.id_unidadconstructivaenctablerocp as character varying) = id_otraunidadint;
	
		valototaltemp := (SELECT SUM(valortotal) FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = id_ucsbvaloraroucint AND tucsbvaloraroucdet.nivel=3);			
		id_ucsbotro := (SELECT uctcpenc.id_unidadconstructivaenctablerocp FROM snx.tunidadconstructivaenctablerocp uctcpenc	 WHERE '6000000' || CAST(uctcpenc.id_unidadconstructivaenctablerocp as character varying) = id_otraunidadint);
											  
		--Otros Gastos
		INSERT INTO snx.tucsbvaloraroucog(id_ucsbvalorarouc, otrosgastos, cantidadog, valorunitario, valorog)											  
		SELECT 	id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
				tvalores.otrosgastos, tvalores.cantidadog,
				tvalores.valorunitario, tvalores.valorog											  
		FROM 	snx.calcularotrosgastosotrasuc(id_ucsbotro,numerobahiasint,valototaltemp,0,id_revistaint,distanciatrans) tvalores;									 
	END IF;	
															
	--Servicios Auxiliares
	IF (SUBSTRING(id_otraunidadint,1,1) = '7') THEN			
		--Detalle															
		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					3 AS nivel, items.unidadconstructivaseraux AS descripcion,
					uni.unidadabrev AS unidadabrev,
					items.cantidadseraux AS cantidaditem,
					items.precio AS valorunitario,
					items.cantidadseraux * items.precio AS valortotal
		FROM		snx.tunidadconstructivaencseraux ucsaenc	
		LEFT JOIN 	snx.tunidadconstructivaseraux items ON ucsaenc.unidadconstructivaencseraux = items.unidadconstructivaencseraux
		INNER JOIN	snx.tunidad uni ON items.id_unidad = uni.id_unidad
		WHERE		'7000000' || CAST(ucsaenc.unidadconstructivaencseraux as character varying) = id_otraunidadint;

		valototaltemp := (SELECT SUM(valortotal) FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = id_ucsbvaloraroucint AND tucsbvaloraroucdet.nivel=3);			
		id_ucsbotro := (SELECT ucsaenc.unidadconstructivaencseraux FROM snx.tunidadconstructivaencseraux ucsaenc WHERE '7000000' || CAST(ucsaenc.unidadconstructivaencseraux as character varying) = id_otraunidadint);
											  
		--Otros Gastos
		INSERT INTO snx.tucsbvaloraroucog(id_ucsbvalorarouc, otrosgastos, cantidadog, valorunitario, valorog)											  
		SELECT 	id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
				tvalores.otrosgastos, tvalores.cantidadog,
				tvalores.valorunitario, tvalores.valorog											  
		FROM 	snx.calcularotrosgastosotrasuc(id_ucsbotro,numerobahiasint,valototaltemp,0,id_revistaint,distanciatrans) tvalores;																	
	END IF;		
															
	--Comunicación
	IF (SUBSTRING(id_otraunidadint,1,1) = '8') THEN																		
		--Detalle															
		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					3 AS nivel, items.unidadconstructivacomun AS descripcion,
					uni.unidadabrev AS unidadabrev,
					items.cantidadcomun AS cantidaditem,
					items.precio AS valorunitario,
					items.cantidadcomun * items.precio AS valortotal
		FROM 		snx.tunidadconstructivaenccomun uccmenc	
		LEFT JOIN	snx.tunidadconstructivacomun items ON uccmenc.id_unidadconstructivaenccomun = items.id_unidadconstructivaenccomun
		INNER JOIN	snx.tunidad uni ON items.id_unidad = uni.id_unidad
		WHERE		'8000000' || CAST(uccmenc.id_unidadconstructivaenccomun as character varying) = id_otraunidadint;

		valototaltemp := (SELECT SUM(valortotal) FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = id_ucsbvaloraroucint AND tucsbvaloraroucdet.nivel=3);			
		id_ucsbotro := (SELECT uccmenc.id_unidadconstructivaenccomun FROM snx.tunidadconstructivaenccomun uccmenc WHERE '8000000' || CAST(uccmenc.id_unidadconstructivaenccomun as character varying) = id_otraunidadint);
											  
		--Otros Gastos
		INSERT INTO snx.tucsbvaloraroucog(id_ucsbvalorarouc, otrosgastos, cantidadog, valorunitario, valorog)											  
		SELECT 	id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
				tvalores.otrosgastos, tvalores.cantidadog,
				tvalores.valorunitario, tvalores.valorog											  
		FROM 	snx.calcularotrosgastosotrasuc(id_ucsbotro,numerobahiasint,valototaltemp,0,id_revistaint,distanciatrans) tvalores;																
	END IF;	
															
	--Estudios Especiales
	IF (SUBSTRING(id_otraunidadint,1,1) = '5') THEN	
		--Detalle															
		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					3 AS nivel, uci.descripcion,
					CAST('' AS character varying) AS unidadabrev,
					0.0 AS cantidaditem,
					0.0 AS valorunitario,
					uci.valor AS valortotal	
		FROM	 	snx.tuceepitem uci			
		WHERE		'5000000' || CAST(uci.id_unidadconstructivaeep as character varying) = id_otraunidadint;
															
		id_ucsbotro := (SELECT ucee.id_unidadconstructivaeep FROM snx.tunidadconstructivaeep ucee WHERE '5000000' || CAST(ucee.id_unidadconstructivaeep as character varying) = id_otraunidadint);
											  
		--Otros Gastos
		INSERT INTO snx.tucsbvaloraroucog(id_ucsbvalorarouc, otrosgastos, cantidadog, valorunitario, valorog)
		SELECT	id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
				tuco.descripcion AS otrosgastos,
				tuco.valor AS cantidadog,
				0.0 AS valorunitario,
				0.0 AS valorog
		FROM	snx.tueepotros tuco
		WHERE	tuco.id_unidadconstructivaeep = id_ucsbotro;
	END IF;	

	--Estudios y Trámites Ambientales
	IF (SUBSTRING(id_otraunidadint,1,1) = '9') then
		--Detalle
		--Detalle															
		INSERT INTO snx.tucsbvaloraroucdet(id_ucsbvalorarouc, nivel, descripcion, unidadabrev, cantidaditem, valorunitario, valortotal)
		SELECT		id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
					3 AS nivel, 
					items.unidadconstructivaetaitem as descripcion,
					uni.unidadabrev AS unidadabrev,
					items.cantidaditem AS cantidaditem,
					items.valorunitario AS valorunitario,
					items.cantidaditem * items.valorunitario AS valortotal	
		FROM	 	snx.tunidadconstructivaeta uci
		inner join	snx.tunidadconstructivaetaitem items on uci.id_unidadconstructivaeta = items.id_unidadconstructivaeta	
		INNER JOIN	snx.tunidad uni ON items.id_unidad = uni.id_unidad
		WHERE		'9000000' || CAST(uci.id_unidadconstructivaeta as character varying) = id_otraunidadint;
															
		valototaltemp := (SELECT SUM(valortotal) FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = id_ucsbvaloraroucint AND tucsbvaloraroucdet.nivel=3);			
		id_ucsbotro := (SELECT uccmenc.id_unidadconstructivaeta FROM snx.tunidadconstructivaeta uccmenc WHERE '9000000' || CAST(uccmenc.id_unidadconstructivaeta as character varying) = id_otraunidadint);
											  
		--Otros Gastos
		INSERT INTO snx.tucsbvaloraroucog(id_ucsbvalorarouc, otrosgastos, cantidadog, valorunitario, valorog)											  
		SELECT 	id_ucsbvaloraroucint AS id_ucsbvalorarouc, 
				tvalores.otrosgastos, tvalores.cantidadog,
				tvalores.valorunitario, tvalores.valorog											  
		FROM 	snx.calcularotrosgastosotrasuc(id_ucsbotro,0,valototaltemp,9,id_revistaint,distanciatrans) tvalores;			
	end if;
END

$function$
;
