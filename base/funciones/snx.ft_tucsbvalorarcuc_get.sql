-- FUNCTION: snx.ft_tucsbvalorarcuc_get(integer)

-- DROP FUNCTION snx.ft_tucsbvalorarcuc_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvalorarcuc_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsvalorarcuc integer, id_ucsbvalorar integer, codigo character varying, descripcion character varying, tensionservicio character varying, cantidaditem numeric, potencia numeric, valorucsbe numeric, valorucsbm numeric, valorucsbmate numeric, valorucsbcont numeric, valorucsbog numeric, valorucsbtotal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucu.id_ucsvalorarcuc,
				vucu.id_ucsbvalorar,
				vucu.codigo,
				vucu.descripcion,
				tserv.tensionservicio,
				vucu.cantidaditem,
				vucu.potencia,
				vucu.valorucsbe,
				vucu.valorucsbm,
				vucu.valorucsbmate,
				vucu.valorucsbcont,
				vucu.valorucsbog,
				vucu.valorucsbtotal
	from 		snx.tucsbvalorarcuc vucu
	inner join	snx.ttensionservicio tserv on vucu.id_tensionservicio = tserv.id_tensionservicio
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;													   
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvalorarcuc_get(integer)
    OWNER TO postgres;