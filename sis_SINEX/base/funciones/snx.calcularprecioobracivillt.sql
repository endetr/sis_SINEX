-- FUNCTION: snx.calcularprecioobracivillt(integer, integer)

-- DROP FUNCTION snx.calcularprecioobracivillt(integer, integer);

CREATE OR REPLACE FUNCTION snx.calcularprecioobracivillt(
	id_obracivilltint integer,
	id_revistaint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

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
	
	ELSEIF id_obracivilltint = 1 THEN
		valortotalobracivil := (SELECT	CASE id_revistaint
											WHEN 1 THEN preciounitariorlp
											WHEN 2 THEN preciounitariorcb
											WHEN 3 THEN preciounitariorsc
											ELSE preciounitariorlp
										END AS valortotalobracivil
								FROM	snx.calcularvaloresobracivilmoe(31));
	ELSEIF id_obracivilltint = 2 THEN
		valortotalobracivil := (SELECT	CASE id_revistaint
											WHEN 1 THEN preciounitariorlp
											WHEN 2 THEN preciounitariorcb
											WHEN 3 THEN preciounitariorsc
											ELSE preciounitariorlp
										END AS valortotalobracivil
								FROM	snx.calcularvaloresobracivilmoe(44));
	ELSEIF id_obracivilltint = 3 THEN
		valortotalobracivil := (SELECT	CASE id_revistaint
											WHEN 1 THEN preciounitariorlp
											WHEN 2 THEN preciounitariorcb
											WHEN 3 THEN preciounitariorsc
											ELSE preciounitariorlp
										END AS valortotalobracivil
								FROM	snx.calcularvaloresobracivilmoe(3));
	ELSEIF id_obracivilltint = 4 THEN
		valortotalobracivil := (SELECT	CASE id_revistaint
											WHEN 1 THEN preciounitariorlp
											WHEN 2 THEN preciounitariorcb
											WHEN 3 THEN preciounitariorsc
											ELSE preciounitariorlp
										END AS valortotalobracivil
								FROM	snx.calcularvaloresobracivilmoe(89));
	END IF;
		
	RETURN valortotalobracivil;
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioobracivillt(integer, integer)
    OWNER TO dbkerp_conexion;