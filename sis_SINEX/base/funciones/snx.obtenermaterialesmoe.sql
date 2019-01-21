-- FUNCTION: snx.obtenermaterialesmoe(integer)

-- DROP FUNCTION snx.obtenermaterialesmoe(integer);

CREATE OR REPLACE FUNCTION snx.obtenermaterialesmoe(
	id_obracivilmoeint integer)
    RETURNS TABLE(id_obracivilmoe integer, id_materialmoe integer, materialmoe character varying, valorunitariorlpusd numeric, valorunitariorcbusd numeric, valorunitariorscusd numeric, costototalrlp numeric, costototalrcb numeric, costototalrsc numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

BEGIN																											  
																											 
	RETURN QUERY
	SELECT		ocmoe.id_obracivilmoe,
				matemoe.id_materialmoe,
				matemoe.materialmoe,
				CAST(matemoe.valorunitariorlp / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) as numeric(18,2)) AS valorunitariorlpusd,
				CAST(matemoe.valorunitariorcb / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) as numeric(18,2)) AS valorunitariorcbusd,
				CAST(matemoe.valorunitariorsc / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) as numeric(18,2)) AS valorunitariorscusd,
				CAST((matemoe.valorunitariorlp / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmaterialmoe as numeric(18,2)) AS costototalrlp,
				CAST((matemoe.valorunitariorcb / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmaterialmoe as numeric(18,2)) AS costototalrcb,
				CAST((matemoe.valorunitariorsc / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmaterialmoe as numeric(18,2)) AS costototalrsc
	FROM		snx.tocmaterialmoe ocmoe
	INNER JOIN	snx.tmaterialmoe matemoe ON ocmoe.id_materialmoe = matemoe.id_materialmoe
	WHERE		ocmoe.id_obracivilmoe = id_obracivilmoeint;																									 
																											 
end;

$BODY$;

ALTER FUNCTION snx.obtenermaterialesmoe(integer)
    OWNER TO dbkerp_conexion;