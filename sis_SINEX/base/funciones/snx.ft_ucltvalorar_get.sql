-- FUNCTION: snx.ft_ucltvalorar_get(integer)

-- DROP FUNCTION snx.ft_ucltvalorar_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_ucltvalorar_get(
	id_ucltvalorarint integer)
    RETURNS TABLE(id_ucltvalorar integer, codigoproy character varying, nombreproy character varying, valorproyecto numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN
	
	RETURN QUERY
	select	vpuclt.id_ucltvalorar,
			vpuclt.codigoproy,			
			vpuclt.nombreproy,
			(SELECT CAST(SUM(tucltvaloraruc.longitud*tucltvaloraruc.numcostototaluc) as numeric(18,2)) FROM snx.tucltvaloraruc WHERE tucltvaloraruc.id_ucltvalorar = vpuclt.id_ucltvalorar) as valorproyecto	from 	snx.tucltvalorar vpuclt
	where	vpuclt.id_ucltvalorar = id_ucltvalorarint;
						 
END;

$BODY$;

ALTER FUNCTION snx.ft_ucltvalorar_get(integer)
    OWNER TO dbkerp_admin;