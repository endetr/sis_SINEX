-- FUNCTION: snx.ft_actualizarucsbobracivil()

-- DROP FUNCTION snx.ft_actualizarucsbobracivil();

CREATE FUNCTION snx.ft_actualizarucsbobracivil()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$

BEGIN	 	
	
	IF (TG_OP = 'DELETE') THEN
		PERFORM snx.calcularprecioucsbsingle(OLD.id_unidadconstructivasb,1,1);
	ELSE
		IF NEW.cantidadmoc <> OLD.cantidadmoc THEN	
			PERFORM snx.calcularprecioucsbsingle(NEW.id_unidadconstructivasb,1,1);
		END IF;
	END IF;	
	
	
	RETURN NEW;
END;

$BODY$;

ALTER FUNCTION snx.ft_actualizarucsbobracivil()
    OWNER TO dbkerp_admin;
