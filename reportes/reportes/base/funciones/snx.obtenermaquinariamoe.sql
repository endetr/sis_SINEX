-- FUNCTION: snx.obtenermaquinariamoe(integer)

-- DROP FUNCTION snx.obtenermaquinariamoe(integer);

CREATE OR REPLACE FUNCTION snx.obtenermaquinariamoe(
	id_obracivilmoeint integer)
    RETURNS TABLE(id_obracivilmoe integer, id_maquinariamoe integer, maquinariamoe character varying, cantidadmaquinariamoe numeric, valorunitariorlpusd numeric, valorunitariorcbusd numeric, valorunitariorscusd numeric, costototalrlp numeric, costototalrcb numeric, costototalrsc numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

Declare
	factorespe NUMERIC := 1.2;
	
BEGIN
	DROP TABLE if exists ttempmaquinariamoe;
	
	factorespe := (SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 24);

	CREATE TEMP table ttempmaquinariamoe AS 
	SELECT		ocmoe.id_obracivilmoe,
				ocmoe.id_maquinariamoe,
				momoe.maquinariamoe,
				ocmoe.cantidadmaquinariamoe,
				momoe.valorunitariorlp / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) AS valorunitariorlpusd,
				momoe.valorunitariorcb / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) AS valorunitariorcbusd,
				momoe.valorunitariorsc / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) AS valorunitariorscusd,
				(momoe.valorunitariorlp / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmaquinariamoe AS costototalrlp,
				(momoe.valorunitariorcb / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmaquinariamoe AS costototalrcb,
				(momoe.valorunitariorsc / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmaquinariamoe AS costototalrsc
	FROM		snx.tocmaquinariamoe ocmoe
	INNER JOIN	snx.tmaquinariamoe momoe ON ocmoe.id_maquinariamoe = momoe.id_maquinariamoe
	WHERE		ocmoe.id_obracivilmoe = id_obracivilmoeint;

	INSERT INTO ttempmaquinariamoe																											 
	SELECT		oc.id_obracivilmoe,
				0 AS id_maquinariamoe,
				'HERRAMIENTAS = (% DEL TOTAL DE MANO DE OBRA)' AS maquinariamoe,
				oc.porcherramientas AS cantidadmaquinariamoe,
				SUM(momoe.costototalrlp) AS valorunitariorlpusd,
				SUM(momoe.costototalrcb) AS valorunitariorcbusd,
				SUM(momoe.costototalrsc) AS valorunitariorscusd,
				SUM(momoe.costototalrlp) * oc.porcherramientas / 100 AS costototalrlp,
				SUM(momoe.costototalrcb) * oc.porcherramientas / 100 AS costototalrcb,
				SUM(momoe.costototalrsc) * oc.porcherramientas / 100 AS costototalrsc
	FROM		snx.obtenermanoobramoe(id_obracivilmoeint) momoe
	INNER JOIN	snx.tobracivilmoe oc ON momoe.id_obracivilmoe = oc.id_obracivilmoe
	WHERE		momoe.id_manoobramoe = 0
	GROUP BY	oc.id_obracivilmoe, oc.porcherramientas;
			
																											 
	RETURN QUERY
	SELECT 	ttempa.id_obracivilmoe,
			ttempa.id_maquinariamoe,			
			ttempa.maquinariamoe,
			ttempa.cantidadmaquinariamoe,
			CAST(ttempa.valorunitariorlpusd as numeric(18,2)) AS valorunitariorlpusd,
			CAST(ttempa.valorunitariorcbusd as numeric(18,2)) AS valorunitariorcbusd,
			CAST(ttempa.valorunitariorscusd as numeric(18,2)) AS valorunitariorscusd,
			CAST(ttempa.costototalrlp as numeric(18,2)) AS costototalrlp,
			CAST(ttempa.costototalrcb as numeric(18,2)) AS costototalrcb,
			CAST(ttempa.costototalrsc as numeric(18,2)) AS costototalrsc
	FROM ttempmaquinariamoe ttempa;																											 
																											 
end;

$BODY$;

ALTER FUNCTION snx.obtenermaquinariamoe(integer)
    OWNER TO dbkerp_conexion;