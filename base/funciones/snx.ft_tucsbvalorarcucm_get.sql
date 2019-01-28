-- FUNCTION: snx.ft_tucsbvalorarcucm_get(integer)

-- DROP FUNCTION snx.ft_tucsbvalorarcucm_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvalorarcucm_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsbvalorarcucm integer, id_ucsbvalorarcuc integer, id_maquinaria integer, maquinaria character varying, cantidadmaq numeric, valorunitario numeric, valortotal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucucm.id_ucsbvalorarcucm,
				vucucm.id_ucsbvalorarcuc,
				vucucm.id_maquinaria,
				vucucm.maquinaria,
				vucucm.cantidadmaq,
				vucucm.valorunitario,
				vucucm.valortotal	
	from 		snx.tucsbvalorarcucm vucucm
	inner join	snx.tucsbvalorarcuc vucu on vucucm.id_ucsbvalorarcuc = vucu.id_ucsvalorarcuc
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;													   
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvalorarcucm_get(integer)
    OWNER TO postgres;