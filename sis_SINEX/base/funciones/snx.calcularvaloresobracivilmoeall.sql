-- FUNCTION: snx.calcularvaloresobracivilmoeall()

-- DROP FUNCTION snx.calcularvaloresobracivilmoeall();

CREATE OR REPLACE FUNCTION snx.calcularvaloresobracivilmoeall(
	)
    RETURNS TABLE(id_obracivilmoe integer, preciounitariorlp numeric, preciounitariorcb numeric, preciounitariorsc numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

BEGIN	
	
	RETURN QUERY
	SELECT 		ocmoe.id_obracivilmoe,
				CAST(SUM(tresum.costototalrlp) as numeric(18,2)) AS preciounitariorlp,
				CAST(SUM(tresum.costototalrcb) as numeric(18,2)) AS preciounitariorcb,
				CAST(SUM(tresum.costototalrsc) as numeric(18,2)) AS preciounitariorsc
	FROM		snx.tobracivilmoe ocmoe
	INNER JOIN 	snx.obtenerotrosmoe(ocmoe.id_obracivilmoe) tresum ON ocmoe.id_obracivilmoe = ocmoe.id_obracivilmoe
	GROUP BY	ocmoe.id_obracivilmoe;
	
END;

$BODY$;

ALTER FUNCTION snx.calcularvaloresobracivilmoeall()
    OWNER TO dbkerp_conexion;