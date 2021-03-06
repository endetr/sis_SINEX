-- FUNCTION: snx.calcularpreciomaterial(integer)

-- DROP FUNCTION snx.calcularpreciomaterial(integer);

CREATE OR REPLACE FUNCTION snx.calcularpreciomaterial(
	id_materialint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valortotalmaterial NUMERIC := 0;
	valoripphoy NUMERIC(18,4) := 0;
	id_factorindexacionint INTEGER := 5;
Begin
	id_factorindexacionint := (SELECT id_factorindexacion FROM snx.tmaterial WHERE id_material = id_materialint);
	
	valoripphoy := (SELECT snx.obtenerfactorindexacion(id_factorindexacionint));
	
	valortotalmaterial := (SELECT		AVG(CASE
									WHEN valortasa1 IS NOT NULL AND valoripp1 IS NOT NULL THEN (valormaterial * valortasa1) * valoripphoy / valoripp1
									WHEN valortasa1 IS NOT NULL AND valoripp1 IS NULL THEN (valormaterial * valortasa1) * valoripphoy / valoripp2
									WHEN valortasa1 IS NULL AND valoripp1 IS NOT NULL THEN (valormaterial * valortasa2) * valoripphoy / valoripp1
									WHEN valortasa1 IS NULL AND valoripp1 IS NULL THEN (valormaterial * valortasa2) * valoripphoy / valoripp2
								END) AS valortotalmaterial
					FROM		(
								SELECT		CV.valormaterial,
											CASE id_moneda
												WHEN 2 THEN (SELECT AVG(valor) FROM snx.ttasacambio WHERE id_monedaorigen = CV.id_moneda AND ano = EXTRACT(YEAR FROM CV.fechaprecio) and id_mes = EXTRACT(MONTH FROM CV.fechaprecio))
												WHEN 1 THEN 1
											END valortasa1,
											CASE id_moneda
												WHEN 2 THEN  (SELECT AVG(valor) FROM snx.ttasacambio WHERE id_monedaorigen = CV.id_moneda GROUP BY ano, id_mes ORDER BY ano desc, id_mes desc LIMIT 1) 
												WHEN 1 THEN 1
											END AS valortasa2,
											CASE
												WHEN id_factorindexacionint=1 THEN (SELECT AVG(valor) FROM snx.tpcu335313335313 WHERE ano = EXTRACT(YEAR FROM CV.fechaprecio) and id_mes = EXTRACT(MONTH FROM CV.fechaprecio))
												WHEN id_factorindexacionint=2 THEN (SELECT AVG(valor) FROM snx.tpuc33123312 WHERE ano = EXTRACT(YEAR FROM CV.fechaprecio) and id_mes = EXTRACT(MONTH FROM CV.fechaprecio))
												WHEN id_factorindexacionint=3 THEN (SELECT AVG(valor) FROM snx.tpcu335311335311 WHERE ano = EXTRACT(YEAR FROM CV.fechaprecio) and id_mes = EXTRACT(MONTH FROM CV.fechaprecio))
												WHEN id_factorindexacionint=4 THEN (SELECT AVG(valor) FROM snx.tpuc3359293359291 WHERE ano = EXTRACT(YEAR FROM CV.fechaprecio) and id_mes = EXTRACT(MONTH FROM CV.fechaprecio))
												ELSE 1
											END AS valoripp1,
											CASE
												WHEN id_factorindexacionint=1 THEN (SELECT AVG(valor) FROM snx.tpcu335313335313 GROUP BY ano, id_mes ORDER BY ano desc, id_mes desc LIMIT 1)
												WHEN id_factorindexacionint=2 THEN (SELECT AVG(valor) FROM snx.tpuc33123312 GROUP BY ano, id_mes ORDER BY ano desc, id_mes desc LIMIT 1)
												WHEN id_factorindexacionint=3 THEN (SELECT AVG(valor) FROM snx.tpcu335311335311 GROUP BY ano, id_mes ORDER BY ano desc, id_mes desc LIMIT 1)
												WHEN id_factorindexacionint=4 THEN (SELECT AVG(valor) FROM snx.tpuc3359293359291 GROUP BY ano, id_mes ORDER BY ano desc, id_mes desc LIMIT 1)
												ELSE 1
											END AS valoripp2
								FROM		snx.tmaterialprecio CV
								WHERE		CV.id_material = id_materialint
								) AS PRECIO	
					);
	
	RETURN valortotalmaterial;
end;

$BODY$;

ALTER FUNCTION snx.calcularpreciomaterial(integer)
    OWNER TO dbkerp_conexion;