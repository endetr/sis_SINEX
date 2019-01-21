-- FUNCTION: snx.obtenermanoobramoe(integer)

-- DROP FUNCTION snx.obtenermanoobramoe(integer);

CREATE OR REPLACE FUNCTION snx.obtenermanoobramoe(
	id_obracivilmoeint integer)
    RETURNS TABLE(id_obracivilmoe integer, id_manoobramoe integer, id_ocmanoobramoe integer, manoobramoe character varying, cantidadmanoobramoe numeric, valorunitariorlpusd numeric, valorunitariorcbusd numeric, valorunitariorscusd numeric, costototalrlp numeric, costototalrcb numeric, costototalrsc numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

Declare
	factorespe NUMERIC := 1.2;	
	id_auxint integer := 0; 
BEGIN
	DROP TABLE if exists ttempmanoobramoe;
	
	factorespe := (SELECT valortarifa FROM snx.ttarifassb WHERE id_tarifasb = 24);
	id_auxint := CAST(CAST(EXTRACT(YEAR FROM now()) AS character varying) || CAST(EXTRACT(MONTH FROM now()) AS character varying) || CAST(EXTRACT(DAY FROM now()) AS character varying) AS integer);

	CREATE TEMP table ttempmanoobramoe AS 
	SELECT		ocmoe.id_obracivilmoe,
				ocmoe.id_manoobramoe,
				ocmoe.id_ocmanoobramoe,
				momoe.manoobramoe,
				ocmoe.cantidadmanoobramoe,
				momoe.valorunitariorlp / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) AS valorunitariorlpusd,
				momoe.valorunitariorcb / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) AS valorunitariorcbusd,
				momoe.valorunitariorsc / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer)) AS valorunitariorscusd,
				(momoe.valorunitariorlp / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmanoobramoe AS costototalrlp,
				(momoe.valorunitariorcb / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmanoobramoe AS costototalrcb,
				(momoe.valorunitariorsc / snx.obtenertrm(CAST(EXTRACT(YEAR FROM now()) as integer), CAST(EXTRACT(MONTH FROM now()) as integer))) * ocmoe.cantidadmanoobramoe AS costototalrsc
	FROM		snx.tocmanoobramoe ocmoe
	INNER JOIN	snx.tmanoobramoe momoe ON ocmoe.id_manoobramoe = momoe.id_manoobramoe
	WHERE		ocmoe.id_obracivilmoe = id_obracivilmoeint;

	INSERT INTO ttempmanoobramoe																											 
	SELECT		oc.id_obracivilmoe,
				0 AS id_manoobramoe,
				id_auxint + 1 AS id_ocmanoobramoe,
				'FACTOR ESPECIALIZACION DE MANO DE OBRA' AS manoobramoe,
				factorespe AS cantidadmanoobramoe,
				SUM(ttempmanoobramoe.costototalrlp) AS valorunitariorlpusd,
				SUM(ttempmanoobramoe.costototalrcb) AS valorunitariorcbusd,
				SUM(ttempmanoobramoe.costototalrsc) AS valorunitariorscusd,
				SUM(ttempmanoobramoe.costototalrlp) * factorespe AS costototalrlp,
				SUM(ttempmanoobramoe.costototalrcb) * factorespe AS costototalrcb,
				SUM(ttempmanoobramoe.costototalrsc) * factorespe AS costototalrsc
	FROM		ttempmanoobramoe
	INNER JOIN	snx.tobracivilmoe oc ON ttempmanoobramoe.id_obracivilmoe = oc.id_obracivilmoe
	GROUP BY	oc.id_obracivilmoe;
																												 
	INSERT INTO ttempmanoobramoe																											 
	SELECT		oc.id_obracivilmoe,
				0 AS id_manoobramoe,
				id_auxint + 2 AS id_ocmanoobramoe,
				'CARGAS SOCIALES = (% DEL SUBTOTAL DE MANO DE OBRA)' AS manoobramoe,
				oc.porccargasocial AS cantidadmanoobramoe,
				SUM(ttempmanoobramoe.costototalrlp) AS valorunitariorlpusd,
				SUM(ttempmanoobramoe.costototalrcb) AS valorunitariorcbusd,
				SUM(ttempmanoobramoe.costototalrsc) AS valorunitariorscusd,
				SUM(ttempmanoobramoe.costototalrlp) * oc.porccargasocial / 100 AS costototalrlp,
				SUM(ttempmanoobramoe.costototalrcb) * oc.porccargasocial / 100 AS costototalrcb,
				SUM(ttempmanoobramoe.costototalrsc) * oc.porccargasocial / 100 AS costototalrsc
	FROM		ttempmanoobramoe
	INNER JOIN	snx.tobracivilmoe oc ON ttempmanoobramoe.id_obracivilmoe = oc.id_obracivilmoe
	WHERE		ttempmanoobramoe.id_ocmanoobramoe = id_auxint + 1
	GROUP BY	oc.id_obracivilmoe, oc.porccargasocial;

	INSERT INTO ttempmanoobramoe																											 
	SELECT		oc.id_obracivilmoe,
				0 AS id_manoobramoe,
				id_auxint + 3 AS id_ocmanoobramoe,
				'IMPUESTOS IVA MANO DE OBRA = (% DE SUMA DE SUBTOTAL DE MANO DE OBRA + CARGAS SOCIALES)' AS manoobramoe,
				oc.porcimpmanoobra AS cantidadmanoobramoe,
				SUM(ttempmanoobramoe.costototalrlp) AS valorunitariorlpusd,
				SUM(ttempmanoobramoe.costototalrcb) AS valorunitariorcbusd,
				SUM(ttempmanoobramoe.costototalrsc) AS valorunitariorscusd,
				SUM(ttempmanoobramoe.costototalrlp) * oc.porcimpmanoobra / 100 AS costototalrlp,
				SUM(ttempmanoobramoe.costototalrcb) * oc.porcimpmanoobra / 100 AS costototalrcb,
				SUM(ttempmanoobramoe.costototalrsc) * oc.porcimpmanoobra / 100 AS costototalrsc
	FROM		ttempmanoobramoe
	INNER JOIN	snx.tobracivilmoe oc ON ttempmanoobramoe.id_obracivilmoe = oc.id_obracivilmoe		
	WHERE		ttempmanoobramoe.id_ocmanoobramoe >= id_auxint + 1																											 
	GROUP BY	oc.id_obracivilmoe, oc.porcimpmanoobra;
																											 
	RETURN QUERY
	SELECT 	ttempa.id_obracivilmoe,
			ttempa.id_manoobramoe,
			ttempa.id_ocmanoobramoe,
			ttempa.manoobramoe,
			ttempa.cantidadmanoobramoe,
			CAST(ttempa.valorunitariorlpusd as numeric(18,2)) AS valorunitariorlpusd,
			CAST(ttempa.valorunitariorcbusd as numeric(18,2)) AS valorunitariorcbusd,
			CAST(ttempa.valorunitariorscusd as numeric(18,2)) AS valorunitariorscusd,
			CAST(ttempa.costototalrlp as numeric(18,2)) AS costototalrlp,
			CAST(ttempa.costototalrcb as numeric(18,2)) AS costototalrcb,
			CAST(ttempa.costototalrsc as numeric(18,2)) AS costototalrsc
	FROM 	ttempmanoobramoe ttempa;																											 
																											 
end;

$BODY$;

ALTER FUNCTION snx.obtenermanoobramoe(integer)
    OWNER TO dbkerp_conexion;