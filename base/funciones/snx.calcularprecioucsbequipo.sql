-- FUNCTION: snx.calcularprecioucsbequipo(integer)

-- DROP FUNCTION snx.calcularprecioucsbequipo(integer);

CREATE OR REPLACE FUNCTION snx.calcularprecioucsbequipo(
	id_unidadconstructivasbint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valortotalucsbe NUMERIC := 0;
	valoripphoy NUMERIC(18,4) := 0;
	mesactual INTEGER := 0;
	anoactual INTEGER := 0;
Begin
	
	valortotalucsbe := (SELECT		SUM(snx.calcularprecioequipo(ucsbe.id_equipo) * ucsbe.cantidadequ) AS valorucsbe
						FROM		snx.tucsbequipo ucsbe
						WHERE 		ucsbe.id_unidadconstructivasb = id_unidadconstructivasbint);
	
	RETURN valortotalucsbe;
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioucsbequipo(integer)
    OWNER TO dbkerp_admin;