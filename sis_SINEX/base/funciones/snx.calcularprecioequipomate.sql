-- FUNCTION: snx.calcularprecioequipomate(integer)

-- DROP FUNCTION snx.calcularprecioequipomate(integer);

CREATE OR REPLACE FUNCTION snx.calcularprecioequipomate(
	id_equipoint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valortotalequipo NUMERIC := 0;
	valoripphoy NUMERIC(18,4) := 0;
	mesactual INTEGER := 0;
	anoactual INTEGER := 0;
Begin
	
	valortotalequipo := (SELECT		SUM(snx.calcularpreciomaterial(MP.id_material) * EM.cantidadequimat) AS valorequipo
						 FROM		snx.tequipomaterial EM
						 INNER JOIN	snx.tmaterialprecio MP ON EM.id_material = MP.id_material
						 WHERE 		EM.id_equipo = id_equipoint);
	
	RETURN valortotalequipo;
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioequipomate(integer)
    OWNER TO dbkerp_admin;