-- FUNCTION: snx.ft_ucltvalorarucoc_get(integer)

-- DROP FUNCTION snx.ft_ucltvalorarucoc_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_ucltvalorarucoc_get(
	id_ucltvalorarint integer)
    RETURNS TABLE(id_ucltvalorarucem integer, id_ucltvaloraruc integer, terrenolt character varying, funcionestructura character varying, tipocimentacion character varying, cantidaditem numeric, costounitariooc numeric, pesounitariooc numeric, costototaloc numeric, pesototaloc numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucltoc.id_ucltvalorarucoc,
				vucltoc.id_ucltvaloraruc,
				vucltoc.terrenolt,
				vucltoc.funcionestructura,
				vucltoc.tipocimentacion,
				vucltoc.cantidaditem,
				vucltoc.costounitariooc,
				vucltoc.pesounitariooc,
				CAST(vucltoc.cantidaditem*vucltoc.costounitariooc as numeric(18,2)) AS costototaloc,
				CAST(vucltoc.cantidaditem*vucltoc.pesounitariooc as numeric(18,2)) AS pesototaloc
	from 		snx.tucltvalorarucoc vucltoc
	inner join	snx.tucltvaloraruc vuclt ON vucltoc.id_ucltvaloraruc = vuclt.id_ucltvaloraruc
	where		vuclt.id_ucltvalorar = id_ucltvalorarint;
													   
END;

$BODY$;

ALTER FUNCTION snx.ft_ucltvalorarucoc_get(integer)
    OWNER TO postgres;