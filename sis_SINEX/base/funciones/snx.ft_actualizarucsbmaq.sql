-- FUNCTION: snx.ft_actualizarucsbmaq()

-- DROP FUNCTION snx.ft_actualizarucsbmaq();

CREATE OR REPLACE FUNCTION snx.ft_actualizarucsbmaq()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$

BEGIN	 	
	
	IF (TG_OP = 'DELETE') THEN
		PERFORM snx.calcularprecioucsbsingle(OLD.id_unidadconstructivasb,1,1);
	ELSE
		IF NEW.cantidadmaq <> OLD.cantidadmaq THEN	
			PERFORM snx.calcularprecioucsbsingle(NEW.id_unidadconstructivasb,1,1);
		END IF;
	END IF;	
	
	
	RETURN NEW;
END;

$BODY$;

ALTER FUNCTION snx.ft_actualizarucsbmaq()
    OWNER TO dbkerp_admin;
