-- FUNCTION: snx.ft_ucltvalorarucgc_get(integer)

-- DROP FUNCTION snx.ft_ucltvalorarucgc_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_ucltvalorarucgc_get(
	id_ucltvalorarint integer)
    RETURNS TABLE(id_ucltvalorarucgc integer, id_ucltvaloraruc integer, id_descripcion integer, descripcion character varying, unidad character varying, costobase numeric, cantidaditem numeric, costototal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucltgc.id_ucltvalorarucgc,
				vucltgc.id_ucltvaloraruc,
				vucltgc.id_descripcion,
				vucltgc.descripcion,								
				vucltgc.unidad,
				vucltgc.costobase,
				vucltgc.cantidaditem,				
				vucltgc.costototal
	from 		snx.tucltvalorarucgc vucltgc
	inner join	snx.tucltvaloraruc vuclt ON vucltgc.id_ucltvaloraruc = vuclt.id_ucltvaloraruc
	where		vuclt.id_ucltvalorar = id_ucltvalorarint;
													   
END;

$BODY$;

ALTER FUNCTION snx.ft_ucltvalorarucgc_get(integer)
    OWNER TO postgres;