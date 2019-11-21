-- FUNCTION: snx.ft_tucsbvaloraroucog_get(integer)

-- DROP FUNCTION snx.ft_tucsbvaloraroucog_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvaloraroucog_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsbvaloraroucog integer, id_ucsbvalorarouc integer, otrosgastos character varying, cantidadog numeric, valorunitario numeric, valorog numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		det.id_ucsbvaloraroucog,
				det.id_ucsbvalorarouc,
				det.otrosgastos,
				det.cantidadog,
				det.valorunitario,
				det.valorog
	from 		snx.tucsbvaloraroucog det
	inner join	snx.tucsbvalorarouc vucu ON det.id_ucsbvalorarouc = vucu.id_ucsbvalorarouc
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;													   
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvaloraroucog_get(integer)
    OWNER TO postgres;
