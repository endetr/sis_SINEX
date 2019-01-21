-- FUNCTION: snx.obtenerfactorindexacion(integer)

-- DROP FUNCTION snx.obtenerfactorindexacion(integer);

CREATE OR REPLACE FUNCTION snx.obtenerfactorindexacion(
	id_factorindexacionint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valoripphoy NUMERIC := 0;
	mesactual INTEGER := 0;
	anoactual INTEGER := 0;
Begin
	mesactual := EXTRACT(MONTH FROM now());
	anoactual := EXTRACT(YEAR FROM now());
						 
	IF id_factorindexacionint = 1 THEN
		IF (SELECT AVG(valor) FROM snx.tpcu335313335313 WHERE ano = anoactual and id_mes = mesactual) IS NOT NULL THEN
			valoripphoy := (SELECT AVG(valor)  FROM snx.tpcu335313335313 WHERE ano = anoactual and id_mes = mesactual);
		ELSE
			valoripphoy := (SELECT valor FROM snx.tpcu335313335313 ORDER BY ano desc, id_mes desc LIMIT 1);
		END IF;
	ELSEIF id_factorindexacionint = 2 THEN
		IF (SELECT AVG(valor) FROM snx.tpuc33123312 WHERE ano = anoactual and id_mes = mesactual) IS NOT NULL THEN
			valoripphoy := (SELECT AVG(valor)  FROM snx.tpuc33123312 WHERE ano = anoactual and id_mes = mesactual);
		ELSE
			valoripphoy := (SELECT valor FROM snx.tpuc33123312 ORDER BY ano desc, id_mes desc LIMIT 1);
		END IF;
	ELSEIF id_factorindexacionint = 3 THEN
		IF (SELECT AVG(valor) FROM snx.tpcu335311335311 WHERE ano = anoactual and id_mes = mesactual) IS NOT NULL THEN
			valoripphoy := (SELECT AVG(valor)  FROM snx.tpcu335311335311 WHERE ano = anoactual and id_mes = mesactual);
		ELSE
			valoripphoy := (SELECT valor FROM snx.tpcu335311335311 ORDER BY ano desc, id_mes desc LIMIT 1);
		END IF;
	ELSEIF id_factorindexacionint = 4 THEN
		IF (SELECT AVG(valor) FROM snx.tpuc3359293359291 WHERE ano = anoactual and id_mes = mesactual) IS NOT NULL THEN
			valoripphoy := (SELECT AVG(valor)  FROM snx.tpuc3359293359291 WHERE ano = anoactual and id_mes = mesactual);
		ELSE
			valoripphoy := (SELECT valor FROM snx.tpuc3359293359291 ORDER BY ano desc, id_mes desc LIMIT 1);
		END IF;
	ELSE
		valoripphoy := 1;
	END IF;
	
	RETURN valoripphoy;
end;

$BODY$;

ALTER FUNCTION snx.obtenerfactorindexacion(integer)
    OWNER TO dbkerp_conexion;