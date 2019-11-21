-- FUNCTION: snx.ft_ucsbequipotemp_add()

-- DROP FUNCTION snx.ft_ucsbequipotemp_add();

CREATE OR REPLACE FUNCTION snx.ft_ucsbequipotemp_add(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

BEGIN
	TRUNCATE TABLE snx.tucsbequipotemp;
	INSERT INTO snx.tucsbequipotemp (id_unidadconstructivasb, id_equipo, cantidadequ)
	SELECT		id_unidadconstructivasb, id_equipo, cantidadequ
	FROM		snx.tucsbequipo;

	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_ucsbequipotemp_add()
    OWNER TO dbkerp_conexion;