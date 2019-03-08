CREATE OR REPLACE FUNCTION snx.calcularprecioobracivillt(id_obracivilltint integer, id_revistaint integer)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$

Declare
	valortotalobracivil NUMERIC := 0;
	valoripphoy NUMERIC(18,4) := 0;
	id_factorindexacionint INTEGER := 5;
Begin
	id_factorindexacionint := (SELECT id_factorindexacion FROM snx.tobracivillt WHERE id_obracivillt = id_obracivilltint);
	
	valoripphoy := (SELECT snx.obtenerfactorindexacion(id_factorindexacionint));
													   
	IF id_obracivilltint IN (5,6,7) THEN
	
		valortotalobracivil := (SELECT	AVG(CASE
											WHEN valortasa1 IS NOT NULL AND valoripp1 IS NOT NULL THEN (valorobracivillt * valortasa1) * valoripphoy / valoripp1
											WHEN valortasa1 IS NOT NULL AND valoripp1 IS NULL THEN (valorobracivillt * valortasa1) * valoripphoy / valoripp2
											WHEN valortasa1 IS NULL AND valoripp1 IS NOT NULL THEN (valorobracivillt * valortasa2) * valoripphoy / valoripp1
											WHEN valortasa1 IS NULL AND valoripp1 IS NULL THEN (valorobracivillt * valortasa2) * valoripphoy / valoripp2
										END) AS valortotalmaterial
							FROM		(
										SELECT		CV.valorobracivillt,
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
										FROM		snx.tobracivilpreciolt CV
										WHERE		CV.id_obracivillt = id_obracivilltint
										) AS PRECIO	
							);
	
	else
		valortotalobracivil := (select 		CASE id_revistaint
												WHEN 1 THEN tc.preciounitariorlp
												WHEN 2 THEN tc.preciounitariorcb
												WHEN 3 THEN tc.preciounitariorsc
												ELSE preciounitariorlp
											END AS valortotalobracivil
								from		snx.tobracivillt ta
								inner join  snx.tobracivilmoe tb on ta.obracivillt = tb.obracivilmoe
								inner join	snx.calcularvaloresobracivilmoe(tb.id_obracivilmoe) tc on tb.id_obracivilmoe = tc.id_obracivilmoe
								where		ta.id_obracivillt = id_obracivilltint);
							
	END IF;
		
	RETURN valortotalobracivil;
end;

$function$
;
