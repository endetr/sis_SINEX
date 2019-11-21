-- FUNCTION: snx.ft_tucsbvalorarcucmate_get(integer)

-- DROP FUNCTION snx.ft_tucsbvalorarcucmate_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvalorarcucmate_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsbnalorarcucmate integer, id_ucsbvalorarcuc integer, id_material integer, material character varying, unidadbrev character varying, cantidadmate numeric, valorunitarioext numeric, valortotalext numeric, valorunitarionac numeric, valortotalnac numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucucm.id_ucsbnalorarcucmate,
				vucucm.id_ucsbvalorarcuc,
				vucucm.id_material,
				vucucm.material,
				vucucm.unidadbrev,
				vucucm.cantidadmate,
				vucucm.valorunitarioext,
				vucucm.valortotalext,
				vucucm.valorunitarionac,
				vucucm.valortotalnac	
	from 		snx.tucsbvalorarcucmate vucucm
	inner join	snx.tucsbvalorarcuc vucu on vucucm.id_ucsbvalorarcuc = vucu.id_ucsvalorarcuc
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;																					   
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvalorarcucmate_get(integer)
    OWNER TO postgres;