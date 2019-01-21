-- FUNCTION: snx.calcularvaloresobracivilmoe(integer)

-- DROP FUNCTION snx.calcularvaloresobracivilmoe(integer);

CREATE OR REPLACE FUNCTION snx.calcularvaloresobracivilmoe(
	id_obracivilmoeint integer)
    RETURNS TABLE(id_obracivilmoe integer, preciounitariorlp numeric, preciounitariorcb numeric, preciounitariorsc numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

BEGIN	
	
	RETURN QUERY
	SELECT 	tresum.id_obracivilmoe,
			CAST(SUM(tresum.costototalrlp) as numeric(18,2)) AS preciounitariorlp,
			CAST(SUM(tresum.costototalrcb) as numeric(18,2)) AS preciounitariorcb,
			CAST(SUM(tresum.costototalrsc) as numeric(18,2)) AS preciounitariorsc
	FROM 	snx.obtenerotrosmoe(id_obracivilmoeint) tresum
	GROUP BY tresum.id_obracivilmoe;
	
END;

$BODY$;

ALTER FUNCTION snx.calcularvaloresobracivilmoe(integer)
    OWNER TO dbkerp_conexion;