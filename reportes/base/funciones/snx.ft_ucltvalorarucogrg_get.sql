-- FUNCTION: snx.ft_ucltvalorarucogrg_get(integer)

-- DROP FUNCTION snx.ft_ucltvalorarucogrg_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_ucltvalorarucogrg_get(
	id_ucltvalorarint integer)
    RETURNS TABLE(id_ucltvalorarucgc integer, id_ucltvaloraruc integer, id_descripcion integer, descripcion character varying, unidad character varying, costobase numeric, cantidaditem numeric, costototal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucltogrg.id_ucltvalorarucogrg,
				vucltogrg.id_ucltvaloraruc,
				vucltogrg.id_descripcion,
				vucltogrg.descripcion,								
				vucltogrg.unidad,
				vucltogrg.costobase,
				vucltogrg.cantidaditem,				
				vucltogrg.costototal
	from 		snx.tucltvalorarucogrg vucltogrg
	inner join	snx.tucltvaloraruc vuclt ON vucltogrg.id_ucltvaloraruc = vuclt.id_ucltvaloraruc
	where		vuclt.id_ucltvalorar = id_ucltvalorarint;
													   
END;

$BODY$;

ALTER FUNCTION snx.ft_ucltvalorarucogrg_get(integer)
    OWNER TO postgres;