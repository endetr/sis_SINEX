-- FUNCTION: snx.calcularprecioequipo(integer)

-- DROP FUNCTION snx.calcularprecioequipo(integer);

CREATE OR REPLACE FUNCTION snx.calcularprecioequipo(
	id_equipoint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valortotalequipo NUMERIC := 0;
	valoripphoy NUMERIC(18,4) := 0;
	id_factorindexacionint INTEGER := 5;
Begin
	id_factorindexacionint := (SELECT id_factorindexacion FROM snx.tequipo WHERE id_equipo = id_equipoint);
	
	valoripphoy := (SELECT snx.obtenerfactorindexacion(id_factorindexacionint));
						 
	valortotalequipo := (SELECT		AVG(CASE
											WHEN valortasa1 IS NOT NULL AND valoripp1 IS NOT NULL THEN (valorequipo * valortasa1) * valoripphoy / valoripp1
											WHEN valortasa1 IS NOT NULL AND valoripp1 IS NULL THEN (valorequipo * valortasa1) * valoripphoy / valoripp2
											WHEN valortasa1 IS NULL AND valoripp1 IS NOT NULL THEN (valorequipo * valortasa2) * valoripphoy / valoripp1
											WHEN valortasa1 IS NULL AND valoripp1 IS NULL THEN (valorequipo * valortasa2) * valoripphoy / valoripp2
										END) AS valortotalmaterial
						 FROM		(
										SELECT		CV.valorequipo,
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
										FROM		snx.tequipoprecio CV
										WHERE		CV.id_equipo = id_equipoint
								) AS PRECIO	
						);
	
	RETURN valortotalequipo;
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioequipo(integer)
    OWNER TO dbkerp_admin;