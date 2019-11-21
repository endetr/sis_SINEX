-- FUNCTION: snx.ft_ucltvalorarumon_get(integer)

-- DROP FUNCTION snx.ft_ucltvalorarumon_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_ucltvalorarumon_get(
	id_ucltvalorarint integer)
    RETURNS TABLE(id_ucltvalorarucmon integer, id_ucltvaloraruc integer, id_grupo integer, grupo character varying, id_item integer, item character varying, unidadabrev character varying, cantidaditem numeric, costounitario numeric, costototal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucltmon.id_ucltvalorarucmon,
				vucltmon.id_ucltvaloraruc,
				vucltmon.id_grupo,
				vucltmon.grupo,
				vucltmon.id_item,
				vucltmon.item,
				vucltmon.unidadabrev,
				vucltmon.cantidaditem,
				vucltmon.costounitario,
				CAST(vucltmon.cantidaditem*vucltmon.costounitario as numeric(18,2)) AS costototal
	from 		snx.tucltvalorarucmon vucltmon
	inner join	snx.tucltvaloraruc vuclt ON vucltmon.id_ucltvaloraruc = vuclt.id_ucltvaloraruc
	where		vuclt.id_ucltvalorar = id_ucltvalorarint;
													   
END;

$BODY$;

ALTER FUNCTION snx.ft_ucltvalorarumon_get(integer)
    OWNER TO postgres;