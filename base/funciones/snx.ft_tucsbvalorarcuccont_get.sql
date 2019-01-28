-- FUNCTION: snx.ft_tucsbvalorarcuccont_get(integer)

-- DROP FUNCTION snx.ft_tucsbvalorarcuccont_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvalorarcuccont_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsbvalorarcuccont integer, id_ucsbvalorarcuc integer, id_obracivil integer, obracivil character varying, unidadbrev character varying, cantidadpeso numeric, valorunitario numeric, valorobracivil numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vuccont.id_ucsbvalorarcuccont,
				vuccont.id_ucsbvalorarcuc,
				vuccont.id_obracivil,
				vuccont.obracivil,
				vuccont.unidadbrev,
				vuccont.cantidadpeso,
				vuccont.valorunitario,
				vuccont.valorobracivil	
	from 		snx.tucsbvalorarcuccont vuccont
	inner join	snx.tucsbvalorarcuc vucu on vuccont.id_ucsbvalorarcuc = vucu.id_ucsvalorarcuc
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;												   
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvalorarcuccont_get(integer)
    OWNER TO postgres;