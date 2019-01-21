-- FUNCTION: snx.ft_actualizarocmaquiria()

-- DROP FUNCTION snx.ft_actualizarocmaquiria();

CREATE OR REPLACE FUNCTION snx.ft_actualizarocmaquiria()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$

BEGIN	 	
	
	IF (TG_OP <> 'DELETE') THEN
		PERFORM snx.ft_maquinariaobracivil_UpdateCant();	
	END IF;	
	
	RETURN NEW;
END;

$BODY$;

ALTER FUNCTION snx.ft_actualizarocmaquiria()
    OWNER TO dbkerp_admin;
