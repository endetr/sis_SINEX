-- FUNCTION: snx.ft_tucsbvalorarcuce_get(integer)

-- DROP FUNCTION snx.ft_tucsbvalorarcuce_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvalorarcuce_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsbvalorarcuce integer, id_ucsbvalorarcuc integer, id_equipo integer, equipo character varying, unidadabrer character varying, cantidadequ numeric, valorunitario numeric, valortotal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucuce.id_ucsbvalorarcuce,
				vucuce.id_ucsbvalorarcuc,
				vucuce.id_equipo,
				vucuce.equipo,
				vucuce.unidadabrer,
				vucuce.cantidadequ,
				vucuce.valorunitario,
				vucuce.valortotal	
	from 		snx.tucsbvalorarcuce vucuce
	inner join	snx.tucsbvalorarcuc vucu on vucuce.id_ucsbvalorarcuc = vucu.id_ucsvalorarcuc
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;													   
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvalorarcuce_get(integer)
    OWNER TO postgres;