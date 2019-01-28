-- FUNCTION: snx.obtenertrm(integer, integer)

-- DROP FUNCTION snx.obtenertrm(integer, integer);

CREATE OR REPLACE FUNCTION snx.obtenertrm(
	anoint integer,
	mesint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valortrm NUMERIC := 1;
Begin
	valortrm = (SELECT AVG(valor) FROM snx.ttasacambio WHERE id_monedaorigen = 2 AND ano = anoint and id_mes = mesint);
	
	IF valortrm is null THEN
		valortrm = (SELECT AVG(valor) FROM snx.ttasacambio WHERE id_monedaorigen = 2 GROUP BY ano, id_mes ORDER BY ano desc, id_mes desc LIMIT 1);
	END IF;
	
	RETURN valortrm;
end;

$BODY$;

ALTER FUNCTION snx.obtenertrm(integer, integer)
    OWNER TO dbkerp_admin;