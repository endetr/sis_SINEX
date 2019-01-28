-- FUNCTION: snx.ft_actualizarucsbequ()

-- DROP FUNCTION snx.ft_actualizarucsbequ();

CREATE OR REPLACE FUNCTION snx.ft_actualizarucsbequ()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$

BEGIN	 	
	
	IF (TG_OP = 'DELETE') THEN
		PERFORM snx.calcularprecioucsbsingle(OLD.id_unidadconstructivasb,1,1);
	ELSE
		IF NEW.cantidadequ <> OLD.cantidadequ THEN	
			PERFORM snx.calcularprecioucsbsingle(NEW.id_unidadconstructivasb,1,1);
		END IF;
	END IF;	
	
	
	RETURN NEW;
END;

$BODY$;

ALTER FUNCTION snx.ft_actualizarucsbequ()
    OWNER TO dbkerp_admin;
