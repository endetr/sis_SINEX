-- FUNCTION: snx.calcularprecioucsbmaquinaria(integer)

-- DROP FUNCTION snx.calcularprecioucsbmaquinaria(integer);

CREATE OR REPLACE FUNCTION snx.calcularprecioucsbmaquinaria(
	id_unidadconstructivasbint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valortotalucsbm NUMERIC := 0;
	valoripphoy NUMERIC(18,4) := 0;
	mesactual INTEGER := 0;
	anoactual INTEGER := 0;
Begin
	
	valortotalucsbm := (SELECT		SUM(snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) * ucsbm.cantidadmaq) AS valorucsbm
						FROM		snx.tucsbmaquinaria ucsbm
						WHERE 		ucsbm.id_unidadconstructivasb = id_unidadconstructivasbint);
	
	RETURN valortotalucsbm;
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioucsbmaquinaria(integer)
    OWNER TO dbkerp_admin;