-- FUNCTION: snx.calcularucsbvalorar(integer)

-- DROP FUNCTION snx.calcularucsbvalorar(integer);

CREATE OR REPLACE FUNCTION snx.calcularucsbvalorar(
	id_ucsbvalorarint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE 
	numerobahias  NUMERIC := 1;
	valortotalproy  NUMERIC := 0;
	valortotalucsb NUMERIC := 0;
	valortotalmc NUMERIC := 0;
	valortotaledi  NUMERIC := 0;
	valortotalcomp NUMERIC := 0;
	valortotalcomun NUMERIC := 0;
	valortotaleep NUMERIC := 0;
	valortotalgis NUMERIC := 0;
	valortotalmcelec NUMERIC := 0;
	valortotalseraux NUMERIC := 0;
	valortotaltablerocp NUMERIC := 0;
		
BEGIN	
	numerobahias := (select	sbv.numerobahias
					from 		snx.tucsbvalorar sbv
					where		sbv.id_ucsbvalorar = id_ucsbvalorarint);

	valortotalucsb := (SELECT	SUM(OC.valortotalucsb) AS valortotalucsb
						FROM	(select	(sb.valorucstotal - (sb.valorucsdcont - SUM(obucsb.valorobracivil))) AS valortotalucsb
								from 		snx.tucsbvalorarcuc sbvc						
								left join 	snx.tunidadconstructivasb sb on sb.id_unidadconstructivasb = sbvc.id_unidadconstructivasb
								inner join 	snx.tucsbvalorar sbv ON sbvc.id_ucsbvalorar = sbv.id_ucsbvalorar
								inner join 	snx.calcularobracivilucsbsingle(sb.id_unidadconstructivasb, sbv.id_terrenosb, sbv.id_revista) obucsb ON sb.id_unidadconstructivasb = obucsb.id_unidadconstructivasb
								where 		sbvc.id_ucsbvalorar = id_ucsbvalorarint
								GROUP BY sb.id_unidadconstructivasb, sb.valorucstotal, sb.valorucsdcont) OC);
		
	--uc módulo común civil
	valortotalmc := (select		coalesce(sum(mooc.cantidadobra * ocmoe.valorunitario),0) as valortotalmc
					from 		snx.tucsbvalorar sbv
					left join 	snx.tunidadconstructivamo unconmo on sbv.id_unidadconstructivamo = unconmo.id_unidadconstructivamo
					left join 	snx.tucmogrupo mogr on unconmo.id_unidadconstructivamo = mogr.id_unidadconstructivamo
					left join 	snx.tucmoobracivil mooc on mogr.id_ucmogrupo = mooc.id_ucmogrupo
					left join 	snx.tobracivilmoe ocmoe on mooc.id_obracivilmoe = ocmoe.id_obracivilmoe
					where		sbv.id_ucsbvalorar = id_ucsbvalorarint);
--uc edificaciones
	valortotaledi := (select	coalesce(sum(edoc.cantidadobracivil * ocmoe.valorunitario),0) as valortotaledi
					from 		snx.tucsbvalorar sbv
					left join 	snx.tunidadconstructivaedif uce on sbv.id_unidadconstructivaedif = uce.id_unidadconstructivaedif
					left join 	snx.tucedifgrupo edgr on uce.id_unidadconstructivaedif = edgr.id_unidadconstructivaedif
					left join 	snx.tucedifsubgrupo edsgr on edgr.id_ucedifgrupo = edsgr.id_ucedifgrupo
					left join 	snx.tucedifobracivil edoc on edsgr.id_ucedifsubgrupo = edoc.id_ucedifsubgrupo
					left join 	snx.tobracivilmoe ocmoe on edoc.id_obracivilmoe = edoc.id_obracivilmoe
					where		sbv.id_ucsbvalorar = id_ucsbvalorarint);
	
	--uc compensación
	valortotalcomp := (select	coalesce(uccomp.valor,0) as valortotalcomp
					from 		snx.tucsbvalorar sbv
					left join 	snx.tunidadconstructivacomp uccomp on sbv.id_unidadconstructivacomp = uccomp.id_unidadconstructivacomp
					where		sbv.id_ucsbvalorar = id_ucsbvalorarint);
		
	--uc comunicaciones
	valortotalcomun := (select	coalesce(uccomun.precio * uccomun.cantidadcomun,0) as valortotalcomun
					from 		snx.tucsbvalorar sbv
					left join 	snx.tunidadconstructivacomun uccomun on sbv.id_unidadconstructivacomun = uccomun.id_unidadconstructivacomun
					where		sbv.id_ucsbvalorar = id_ucsbvalorarint);
	
	--uc estudios especiales
	valortotaleep := (select 	coalesce(sum(eepitem.valor),0) + (select 	coalesce(sum(eepitem.valor * (eepotros.valor / 100)),0) 					  			
								from 		snx.tucsbvalorar sbv
								left join 	snx.tunidadconstructivaeep uceep on sbv.id_unidadconstructivaeep = uceep.id_unidadconstructivaeep
								left join   snx.tuceepitem eepitem on uceep.id_unidadconstructivaeep = eepitem.id_unidadconstructivaeep		
					  			left join   snx.tueepotros eepotros on uceep.id_unidadconstructivaeep = eepotros.id_unidadconstructivaeep
								where		sbv.id_ucsbvalorar = id_ucsbvalorarint) as valortotaleep	
					 from 		snx.tucsbvalorar sbv
					 left join 	snx.tunidadconstructivaeep uceep on sbv.id_unidadconstructivaeep = uceep.id_unidadconstructivaeep
					 left join   snx.tuceepitem eepitem on uceep.id_unidadconstructivaeep = eepitem.id_unidadconstructivaeep
					 where		sbv.id_ucsbvalorar = id_ucsbvalorarint);
			
	--uc gis
	valortotalgis := (select	coalesce(sum(gisitem.valor),0) as valortotalgis
					from 		snx.tucsbvalorar sbv
					left join 	snx.tunidadconstructivagis ucgis on sbv.id_unidadconstructivagis = ucgis.id_unidadconstructivagis
					left join   snx.tucgisitem gisitem on ucgis.id_unidadconstructivagis = gisitem.id_unidadconstructivagis
					where		sbv.id_ucsbvalorar = id_ucsbvalorarint);
					
	--uc módulo común eléctrico				
	valortotalmcelec := (select coalesce(sum(cast(case
		 							when tuci.id_ucmeitem = 1 then (((select cableporbahina from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)*mcuc.numerobahias) 
	 								+(mcuc.areasub * (select factortorre from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion))) * tuci.precio
		 							when tuci.id_ucmeitem = 2 then ((mcuc.numerobahias * (select cableporbahia from snx.tmcelecapantallamiento where id_claseaislamiento = mcuc.id_claseaislacion))* tuci.precio)
									when tuci.id_ucmeitem = 3 then (ceil(mcuc.longitudvia * 25))* tuci.precio
									when tuci.id_ucmeitem = 4 then (mcuc.numerobahias * (select luminariaporpb from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
									when tuci.id_ucmeitem = 5 then (mcuc.numerobahias * (select tubopvc from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
									when tuci.id_ucmeitem = 6 then (mcuc.numerobahias * (select totalcable from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
									else 0.0
									end as numeric)),0) as valortotalmcelec
						from snx.tucmceitem tuci
						left join snx.tunidadconstructivamcelec mcuc on tuci.id_unidadconstructivamcelec = mcuc.id_unidadconstructivamcelec
						left join snx.tucsbvalorar sbv on mcuc.id_unidadconstructivamcelec = sbv.id_unidadconstructivamcelec
						where	  sbv.id_ucsbvalorar = id_ucsbvalorarint);
	
	--uc servicios auxiliares
	valortotalseraux := (select	coalesce(ucseraux.precio * ucseraux.cantidadseraux,0) as valortotalseraux
					from 		snx.tucsbvalorar sbv
					left join 	snx.tunidadconstructivaseraux ucseraux on sbv.id_unidadconstructivaseraux = ucseraux.id_unidadconstructivaseraux
					where		sbv.id_ucsbvalorar = id_ucsbvalorarint);	
	
	--uc tableros de control y protección
	valortotaltablerocp := (select	coalesce(uctabcp.precio * uctabcp.cantidadtablerocp,0) as valortotaltablerocp
					from 		snx.tucsbvalorar sbv
					left join 	snx.tunidadconstructivatablerocp uctabcp on sbv.id_unidadconstructivatablerocp = uctabcp.id_unidadconstructivatablerocp
					where		sbv.id_ucsbvalorar = id_ucsbvalorarint);
															  
	IF numerobahias = 1 THEN
		valortotalproy := (valortotalucsb + valortotalmc + valortotaledi + valortotalcomp + valortotalcomun + valortotaleep + valortotalgis + valortotalmcelec + valortotalseraux + valortotaltablerocp) * (1.101);
	ELSEIF numerobahias = 2 THEN
		valortotalproy := (valortotalucsb + valortotalmc + valortotaledi + valortotalcomp + valortotalcomun + valortotaleep + valortotalgis + valortotalmcelec + valortotalseraux + valortotaltablerocp) * (1.091);
	ELSEIF numerobahias = 3 THEN
		valortotalproy := (valortotalucsb + valortotalmc + valortotaledi + valortotalcomp + valortotalcomun + valortotaleep + valortotalgis + valortotalmcelec + valortotalseraux + valortotaltablerocp) * (1.081);
	ELSEIF numerobahias = 4 THEN
		valortotalproy := (valortotalucsb + valortotalmc + valortotaledi + valortotalcomp + valortotalcomun + valortotaleep + valortotalgis + valortotalmcelec + valortotalseraux + valortotaltablerocp) * (1.051);
	ELSEIF numerobahias = 5 THEN
		valortotalproy := (valortotalucsb + valortotalmc + valortotaledi + valortotalcomp + valortotalcomun + valortotaleep + valortotalgis + valortotalmcelec + valortotalseraux + valortotaltablerocp) * (1.051);
	ELSE
		valortotalproy := (valortotalucsb + valortotalmc + valortotaledi + valortotalcomp + valortotalcomun + valortotaleep + valortotalgis + valortotalmcelec + valortotalseraux + valortotaltablerocp) * (1.051);
	END IF;
	
	RETURN valortotalproy;
END;

$BODY$;

ALTER FUNCTION snx.calcularucsbvalorar(integer)
    OWNER TO dbkerp_conexion;