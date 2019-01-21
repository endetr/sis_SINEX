-- FUNCTION: snx.ft_ucsbequipo_reset()

-- DROP FUNCTION snx.ft_ucsbequipo_reset();

CREATE OR REPLACE FUNCTION snx.ft_ucsbequipo_reset(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

BEGIN
	TRUNCATE TABLE snx.tucsbequipo;

	--Cantidades de clase de aislación
	INSERT INTO snx.tucsbequipo (id_unidadconstructivasb, id_equipo, cantidadequ, id_usuario_reg, fecha_reg, estado_reg)
	SELECT		ucsb.id_unidadconstructivasb, equ.id_equipo, equcant.cantidadequ, 
				1 AS id_usuario_reg, now() AS fecha_reg, 'Activo' AS estado_reg
	FROM		snx.tequipo equ
	INNER JOIN	snx.tunidadconstructivasb ucsb ON equ.id_claseaislacion = ucsb.id_claseaislacion
	INNER JOIN	(
				SELECT 		ucsbequ.id_unidadconstructivasb, ucsbequ.id_equipo, equ.equipo, ucsbequ.cantidadequ
				FROM 		snx.tucsbequipotemp ucsbequ
				INNER JOIN	snx.tequipo equ ON ucsbequ.id_equipo = equ.id_equipo
				WHERE		equ.id_claseaislacion <> 11
				) equcant ON equ.equipo = equcant.equipo AND ucsb.id_unidadconstructivasb = equcant.id_unidadconstructivasb
	WHERE		equ.id_claseaislacion <> 11;

	--Las otras
	INSERT INTO snx.tucsbequipo (id_unidadconstructivasb, id_equipo, cantidadequ, id_usuario_reg, fecha_reg, estado_reg)
	SELECT 		ucsbequ.id_unidadconstructivasb, ucsbequ.id_equipo, ucsbequ.cantidadequ,
				1 AS id_usuario_reg, now() AS fecha_reg, 'Activo' AS estado_reg
	FROM 		snx.tucsbequipotemp ucsbequ
	INNER JOIN	snx.tequipo equ ON ucsbequ.id_equipo = equ.id_equipo
	WHERE		equ.id_claseaislacion = 11;

	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_ucsbequipo_reset()
    OWNER TO dbkerp_conexion;