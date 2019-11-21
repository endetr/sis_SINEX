-- FUNCTION: snx.calcularprecioobracivil(numeric, character varying)

-- DROP FUNCTION snx.calcularprecioobracivil(numeric, character varying);

CREATE OR REPLACE FUNCTION snx.calcularprecioobracivil(
	cantidadmoc numeric,
	obracivil character varying)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare

	valortotalobracivil NUMERIC := 0;	
	vtarifa NUMERIC := 0;
	
Begin
	
	IF obracivil = 'MANO DE OBRA MONTAJE' THEN	
			vtarifa := (select valortarifa from snx.ttarifassb where id_tarifasb = 3);
			valortotalobracivil := (cantidadmoc * vtarifa);
	ELSIF obracivil = 'EXCAVACIONES' THEN
			vtarifa := (select valortarifa from snx.ttarifassb where id_tarifasb = 5);
			valortotalobracivil := (cantidadmoc * vtarifa);
	ELSIF obracivil = 'HORMIGONES' THEN
			vtarifa := (select valortarifa from snx.ttarifassb where id_tarifasb = 6);
			valortotalobracivil := (cantidadmoc * vtarifa);
	ELSIF obracivil = 'RELLENOS' THEN
			vtarifa := (select valortarifa from snx.ttarifassb where id_tarifasb = 7);
			valortotalobracivil := (cantidadmoc * vtarifa);
	ELSIF obracivil = 'ESTRUCTURAS GALVANIZADAS' THEN
			vtarifa := (select valortarifa from snx.ttarifassb where id_tarifasb = 4);
			valortotalobracivil := (cantidadmoc * vtarifa);
	ELSE
			valortotalobracivil := 0;
	END IF;
	
	
	RETURN  valortotalobracivil;
END 

$BODY$;

ALTER FUNCTION snx.calcularprecioobracivil(numeric, character varying)
    OWNER TO dbkerp_admin;