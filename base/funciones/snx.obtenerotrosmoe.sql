-- FUNCTION: snx.obtenerotrosmoe(integer)

-- DROP FUNCTION snx.obtenerotrosmoe(integer);

CREATE OR REPLACE FUNCTION snx.obtenerotrosmoe(
	id_obracivilmoeint integer)
    RETURNS TABLE(id_obracivilmoe integer, id_otromoe integer, otromoe character varying, cantidadocmoe numeric, valorunitariorlpusd numeric, valorunitariorcbusd numeric, valorunitariorscusd numeric, costototalrlp numeric, costototalrcb numeric, costototalrsc numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

BEGIN
	DROP TABLE if exists ttempresummoe;
	
	CREATE TEMP table ttempresummoe AS 
	SELECT		mate.id_obracivilmoe,
				1 AS id_otromoe,
				CAST('TOTAL MATERIALES' AS varchar) AS otromoe,
				0.0 AS cantidadocmoe,
				0.0 AS valorunitariorlpusd,
				0.0 AS valorunitariorcbusd,
				0.0 AS valorunitariorscusd,
				SUM(mate.costototalrlp) AS costototalrlp,
				SUM(mate.costototalrcb) AS costototalrcb,
				SUM(mate.costototalrsc) AS costototalrsc
	FROM		snx.obtenermaterialesmoe(id_obracivilmoeint) mate
	GROUP BY	mate.id_obracivilmoe;
	
	INSERT INTO ttempresummoe 
	SELECT		mo.id_obracivilmoe,
				2 AS id_otromoe,
				CAST('TOTAL MANO DE OBRA' AS varchar) AS otromoe,
				0.0 AS cantidadocmoe,
				0.0 AS valorunitariorlpusd,
				0.0 AS valorunitariorcbusd,
				0.0 AS valorunitariorscusd,
				SUM(mo.costototalrlp) AS costototalrlp,
				SUM(mo.costototalrcb) AS costototalrcb,
				SUM(mo.costototalrsc) AS costototalrsc
	FROM		snx.obtenermanoobramoe(id_obracivilmoeint) mo
	WHERE		mo.id_manoobramoe = 0
	GROUP BY	mo.id_obracivilmoe;
	
	INSERT INTO ttempresummoe 
	SELECT		maq.id_obracivilmoe,
				3 AS id_otromoe,
				CAST('TOTAL EQUIPO, MAQUINARIA Y HERRAMIENTAS' AS varchar) AS otromoe,
				0.0 AS cantidadocmoe,
				0.0 AS valorunitariorlpusd,
				0.0 AS valorunitariorcbusd,
				0.0 AS valorunitariorscusd,
				SUM(maq.costototalrlp) AS costototalrlp,
				SUM(maq.costototalrcb) AS costototalrcb,
				SUM(maq.costototalrsc) AS costototalrsc
	FROM		snx.obtenermaquinariamoe(id_obracivilmoeint) maq
	GROUP BY	maq.id_obracivilmoe;
	
	INSERT INTO ttempresummoe 
	SELECT		oc.id_obracivilmoe,
				4 AS id_otromoe,
				CAST('GASTOS GENERALES Y ADMINISTRATIVOS' AS varchar) AS otromoe,
				oc.porcgastosga AS cantidadocmoe,
				SUM(ttempresummoe.costototalrlp) AS valorunitariorlpusd,
				SUM(ttempresummoe.costototalrcb) AS valorunitariorcbusd,
				SUM(ttempresummoe.costototalrsc) AS valorunitariorscusd,
				SUM(ttempresummoe.costototalrlp) * oc.porcgastosga / 100 AS costototalrlp,
				SUM(ttempresummoe.costototalrcb) * oc.porcgastosga / 100 AS costototalrcb,
				SUM(ttempresummoe.costototalrsc) * oc.porcgastosga / 100 AS costototalrsc
	FROM		ttempresummoe
	INNER JOIN	snx.tobracivilmoe oc ON ttempresummoe.id_obracivilmoe = oc.id_obracivilmoe	
	GROUP BY	oc.id_obracivilmoe, oc.porcgastosga;
	
	INSERT INTO ttempresummoe 
	SELECT		oc.id_obracivilmoe,
				5 AS id_otromoe,
				CAST('UTILIDAD' AS varchar) AS otromoe,
				oc.porcutilidad AS cantidadocmoe,
				SUM(ttempresummoe.costototalrlp) AS valorunitariorlpusd,
				SUM(ttempresummoe.costototalrcb) AS valorunitariorcbusd,
				SUM(ttempresummoe.costototalrsc) AS valorunitariorscusd,
				SUM(ttempresummoe.costototalrlp) * oc.porcutilidad / 100 AS costototalrlp,
				SUM(ttempresummoe.costototalrcb) * oc.porcutilidad / 100 AS costototalrcb,
				SUM(ttempresummoe.costototalrsc) * oc.porcutilidad / 100 AS costototalrsc
	FROM		ttempresummoe
	INNER JOIN	snx.tobracivilmoe oc ON ttempresummoe.id_obracivilmoe = oc.id_obracivilmoe	
	GROUP BY	oc.id_obracivilmoe, oc.porcutilidad;
	
	INSERT INTO ttempresummoe 
	SELECT		oc.id_obracivilmoe,
				6 AS id_otromoe,
				CAST('IMPUESTOS' AS varchar) AS otromoe,
				oc.porcimpuestos AS cantidadocmoe,
				SUM(ttempresummoe.costototalrlp) AS valorunitariorlpusd,
				SUM(ttempresummoe.costototalrcb) AS valorunitariorcbusd,
				SUM(ttempresummoe.costototalrsc) AS valorunitariorscusd,
				SUM(ttempresummoe.costototalrlp) * oc.porcimpuestos / 100 AS costototalrlp,
				SUM(ttempresummoe.costototalrcb) * oc.porcimpuestos / 100 AS costototalrcb,
				SUM(ttempresummoe.costototalrsc) * oc.porcimpuestos / 100 AS costototalrsc
	FROM		ttempresummoe
	INNER JOIN	snx.tobracivilmoe oc ON ttempresummoe.id_obracivilmoe = oc.id_obracivilmoe	
	GROUP BY	oc.id_obracivilmoe, oc.porcimpuestos;

	RETURN QUERY
	SELECT * FROM ttempresummoe;																											 
																										 
end;

$BODY$;

ALTER FUNCTION snx.obtenerotrosmoe(integer)
    OWNER TO dbkerp_conexion;