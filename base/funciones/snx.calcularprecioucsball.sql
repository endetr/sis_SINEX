CREATE OR REPLACE FUNCTION snx.calcularprecioucsball()
 RETURNS void
 LANGUAGE plpgsql
AS $function$

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

$function$
;
