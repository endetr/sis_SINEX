-- FUNCTION: snx.ft_ucltvalorarucem_get(integer)

-- DROP FUNCTION snx.ft_ucltvalorarucem_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_ucltvalorarucem_get(
	id_ucltvalorarint integer)
    RETURNS TABLE(id_ucltvalorarucem integer, id_ucltvaloraruc integer, id_grupo integer, grupo character varying, id_item integer, item character varying, unidadabrev character varying, cantidaditem numeric, costounitarioext numeric, costounitarionac numeric, pesounitarioext numeric, pesounitarionac numeric, costototalext numeric, costototalnac numeric, pesototalext numeric, pesototalnac numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		vucltem.id_ucltvalorarucem,
				vucltem.id_ucltvaloraruc,
				vucltem.id_grupo,
				vucltem.grupo,
				vucltem.id_item,
				vucltem.item,
				vucltem.unidadabrev,
				vucltem.cantidaditem,
				vucltem.costounitarioext,
				vucltem.costounitarionac,
				vucltem.pesounitarioext,
				vucltem.pesounitarionac,
				CAST(vucltem.cantidaditem*vucltem.costounitarioext as numeric(18,2)) AS costototalext,
				CAST(vucltem.cantidaditem*vucltem.costounitarionac as numeric(18,2)) AS costototalnac,
				CAST(vucltem.cantidaditem*vucltem.pesounitarioext as numeric(18,2)) AS pesototalext,
				CAST(vucltem.cantidaditem*vucltem.pesounitarionac as numeric(18,2)) AS pesototalnac
	from 		snx.tucltvalorarucem vucltem
	inner join	snx.tucltvaloraruc vuclt ON vucltem.id_ucltvaloraruc = vuclt.id_ucltvaloraruc
	where		vuclt.id_ucltvalorar = id_ucltvalorarint;
													   
END;

$BODY$;

ALTER FUNCTION snx.ft_ucltvalorarucem_get(integer)
    OWNER TO postgres;