-- FUNCTION: snx.actualizartodasucsb()

-- DROP FUNCTION snx.actualizartodasucsb();

CREATE OR REPLACE FUNCTION snx.actualizartodasucsb(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare	
	id_unidadconstructivasb_ent integer := 0;
	
	db_cursor CURSOR FOR SELECT id_unidadconstructivasb FROM snx.tunidadconstructivasb;
	
Begin
	OPEN db_cursor;	
	LOOP
	
	-- fetch row into the film
      FETCH db_cursor INTO id_unidadconstructivasb_ent;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;
	  
		PERFORM snx.calcularprecioucsbsingle(id_unidadconstructivasb_ent,1,1);
			
	END LOOP;		
	-- Close the cursor
   CLOSE db_cursor;
   
   
   
	RETURN;
end;

$BODY$;

ALTER FUNCTION snx.actualizartodasucsb()
    OWNER TO dbkerp_conexion;
