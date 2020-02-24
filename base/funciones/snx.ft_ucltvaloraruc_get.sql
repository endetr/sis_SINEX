-- FUNCTION: snx.ft_ucltvaloraruc_get(integer)

-- DROP FUNCTION snx.ft_ucltvaloraruc_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_ucltvaloraruc_get(
	id_ucltvalorarint integer)
    RETURNS TABLE(id_ucltvaloraruc integer, id_ucltvalorar integer, id_unidadconstructivalt integer, codigo character varying, descripcion character varying, id_tipolinea integer, tipolinea character varying, id_tensionservicio integer, tensionservicio character varying, longitud numeric, numddp numeric, nummontaje numeric, numoc numeric, numingenieria numeric, numinspeccion numeric, numadmeje numeric, numsupero numeric, numcfinan numeric, numcaamb numeric, numcapred numeric, numcostototaluc numeric, numcostototaluct numeric, desc_tipoconductor character varying, distanciatransporte numeric, distanciatransporteext numeric, conductorfase integer, desc_configuracionlt character varying, desc_hilosguarda character varying, desc_valoraltura character varying, desc_revista character varying, desc_pararrayolinea character varying, estructurapasocantidad numeric, estructurapasopeso numeric, estructuraamarrecantidad numeric, estructuraamarrepeso numeric, porcmterrenofirme numeric, porcmterrenointerme numeric, porcmterrenoterrenoblando numeric, porcmterrenosumer numeric, porcvegetamaleza numeric, porcvegetamatorral numeric, porcvegetaforestacion numeric, porcvegetabosque numeric, porcterrenoplano numeric, porcterrenoondulado numeric, porcterrenocerros numeric, desc_areaprotegida character varying, desc_tipoestructura character varying, desc_nivelcontaminacionlt character varying, numaccesos numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vuclt.id_ucltvaloraruc,
				vuclt.id_ucltvalorar,
				vuclt.id_unidadconstructivalt,
				vuclt.codigo,
				vuclt.descripcion,
				vuclt.id_tipolinea,
				tlin.tipolinea,
				vuclt.id_tensionservicio,
				tserv.tensionservicio,
				vuclt.longitud,
				vuclt.numddp,
				vuclt.nummontaje,
				vuclt.numoc,
				vuclt.numingenieria,
				vuclt.numinspeccion,
				vuclt.numadmeje,
				vuclt.numsupero,
				vuclt.numcfinan,	
				vuclt.numcaamb,
				vuclt.numcapred,
				vuclt.numcostototaluc,				
				CAST(vuclt.longitud * vuclt.numcostototaluc as numeric(18,2)) AS numcostototaluct,
				vuclt.desc_tipoconductor,
				vuclt.distanciatransporte,
				vuclt.distanciatransporteext,
				vuclt.conductorfase,
				vuclt.desc_configuracionlt,
				vuclt.desc_hilosguarda,
				vuclt.desc_valoraltura,
				vuclt.desc_revista,
				vuclt.desc_pararrayolinea,
				vuclt.estructurapasocantidad,
				vuclt.estructurapasopeso,
				vuclt.estructuraamarrecantidad,
				vuclt.estructuraamarrepeso,
				vuclt.porcmterrenofirme,
				vuclt.porcmterrenointerme,
				vuclt.porcmterrenoterrenoblando,
				vuclt.porcmterrenosumer,
				vuclt.porcvegetamaleza,
				vuclt.porcvegetamatorral,
				vuclt.porcvegetaforestacion,
				vuclt.porcvegetabosque,
				vuclt.porcterrenoplano,
				vuclt.porcterrenoondulado,
				vuclt.porcterrenocerros,
				vuclt.desc_areaprotegida,
				vuclt.desc_tipoestructura,
				vuclt.desc_nivelcontaminacionlt,
				vuclt.numaccesos
	from 		snx.tucltvaloraruc vuclt
	inner join 	snx.ttipolinea tlin on vuclt.id_tipolinea = tlin.id_tipolinea
	inner join 	snx.ttensionservicio tserv on vuclt.id_tensionservicio = tserv.id_tensionservicio	
	inner join  (SELECT tu.id_unidadconstructivalt, tu.numaccesos FROM snx.tunidadconstructivalt tu) tucalt on vuclt.id_unidadconstructivalt = tucalt.id_unidadconstructivalt
	where		vuclt.id_ucltvalorar = id_ucltvalorarint;
													   
END;

$BODY$;

ALTER FUNCTION snx.ft_ucltvaloraruc_get(integer)
    OWNER TO postgres;