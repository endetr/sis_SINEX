-- FUNCTION: snx.calcularprecioucsb()

-- DROP FUNCTION snx.calcularprecioucsb();

CREATE OR REPLACE FUNCTION snx.calcularprecioucsb(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	cur_ucsb CURSOR FOR SELECT ucsb.id_unidadconstructivasb FROM snx.tunidadconstructivasb ucsb;
	rec_ucsb RECORD;
	
Begin
	OPEN cur_ucsb;

	LOOP
		FETCH cur_ucsb into rec_ucsb;
		EXIT WHEN NOT FOUND;
		
		PERFORM snx.calcularprecioucsbsingle(rec_ucsb.id_unidadconstructivasb,1,1);		
	END LOOP;
	
	CLOSE cur_ucsb;
	
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioucsb()
    OWNER TO dbkerp_admin;
