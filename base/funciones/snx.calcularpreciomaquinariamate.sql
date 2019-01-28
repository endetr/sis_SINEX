-- FUNCTION: snx.calcularpreciomaquinariamate(integer)

-- DROP FUNCTION snx.calcularpreciomaquinariamate(integer);

CREATE OR REPLACE FUNCTION snx.calcularpreciomaquinariamate(
	id_maquinariaint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valortotalmaquinaria NUMERIC := 0;
	valoripphoy NUMERIC(18,4) := 0;
	mesactual INTEGER := 0;
	anoactual INTEGER := 0;
Begin
	
	valortotalmaquinaria := (SELECT		SUM(snx.calcularpreciomaterial(MP.id_material) * MM.cantidadmate) AS valormaquinaria
							 FROM		snx.tmaquinariamaterial MM
							 INNER JOIN	snx.tmaterialprecio MP ON MM.id_material = MP.id_material
							 WHERE 		MM.id_maquinaria = id_maquinariaint);
	
	RETURN valortotalmaquinaria;
end;

$BODY$;

ALTER FUNCTION snx.calcularpreciomaquinariamate(integer)
    OWNER TO dbkerp_admin;
