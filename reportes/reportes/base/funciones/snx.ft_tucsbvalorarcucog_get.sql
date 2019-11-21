-- FUNCTION: snx.ft_tucsbvalorarcucog_get(integer)

-- DROP FUNCTION snx.ft_tucsbvalorarcucog_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvalorarcucog_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsbvalorarcucog integer, id_ucsbvalorarcuc integer, id_item integer, otrosgastos character varying, cantidadog numeric, valorunitario numeric, valorog numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucog.id_ucsbvalorarcucog,
				vucog.id_ucsbvalorarcuc,
				vucog.id_item,
				vucog.otrosgastos,				
				vucog.cantidadog,
				vucog.valorunitario,
				vucog.valorog	
	from 		snx.tucsbvalorarcucog vucog
	inner join	snx.tucsbvalorarcuc vucu on vucog.id_ucsbvalorarcuc = vucu.id_ucsvalorarcuc
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;												   
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvalorarcucog_get(integer)
    OWNER TO postgres;