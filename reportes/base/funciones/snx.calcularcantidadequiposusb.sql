-- FUNCTION: snx.calcularcantidadequiposusb(integer, integer)

-- DROP FUNCTION snx.calcularcantidadequiposusb(integer, integer);

CREATE OR REPLACE FUNCTION snx.calcularcantidadequiposusb(
	id_unidadconstructivasbint integer,
	id_claseaislacion_new integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$


Declare
	id_claseaislacion_old integer := 0;

Begin

	id_claseaislacion_old := (SELECT id_claseaislacion FROM snx.tunidadconstructivasb WHERE id_unidadconstructivasb = id_unidadconstructivasbint);

	IF id_claseaislacion_new <> id_claseaislacion_old THEN
	
		--Equipo nuevos
		INSERT INTO snx.tucsbequipo (id_usuario_reg,fecha_reg,estado_reg,id_unidadconstructivasb,id_equipo,cantidadequ)
		SELECT	1 AS id_usuario_reg,
				now() AS fecha_reg,
				'activo' AS estado_reg,					
				id_unidadconstructivasbint AS id_unidadconstructivasb,
				id_equipo,
				0 AS cantidadequ					
		FROM	snx.tequipo equ
		WHERE 	equ.id_claseaislacion = id_claseaislacion_new;

		--Items nuevos
		UPDATE	snx.tucsbequipo
		SET		cantidadequ = equold.cantidadequ
		FROM	(
				SELECT		*
				FROM		snx.tucsbequipo ucsbe
				INNER JOIN	snx.tequipo equ ON ucsbe.id_equipo = equ.id_equipo
				WHERE		ucsbe.id_unidadconstructivasb = id_unidadconstructivasbint AND 
							equ.id_claseaislacion = id_claseaislacion_old AND ucsbe.cantidadequ > 0
				) equold, snx.tequipo
		WHERE	tucsbequipo.id_unidadconstructivasb = equold.id_unidadconstructivasb AND
				tucsbequipo.id_equipo = tequipo.id_equipo AND
				tequipo.equipo = equold.equipo AND
				tequipo.id_claseaislacion = id_claseaislacion_new AND
				tucsbequipo.id_unidadconstructivasb = id_unidadconstructivasbint;

		--Items viejos
		UPDATE	snx.tucsbequipo
		SET		cantidadequ = 0
		FROM	snx.tequipo
		WHERE	tucsbequipo.id_equipo = tequipo.id_equipo AND
				tucsbequipo.id_unidadconstructivasb = id_unidadconstructivasbint AND
				tequipo.id_claseaislacion = id_claseaislacion_old;

		--Elimino equipos viejos
		DELETE FROM snx.tucsbequipo
		WHERE tucsbequipo.id_ucsbequipo IN (SELECT		ucsbe.id_ucsbequipo
										FROM		snx.tucsbequipo ucsbe
										INNER JOIN	snx.tequipo equ ON ucsbe.id_equipo = equ.id_equipo
										WHERE		ucsbe.id_unidadconstructivasb = id_unidadconstructivasbint AND
													equ.id_claseaislacion = id_claseaislacion_old);
	END IF;
	
	RETURN;
end;


$BODY$;

ALTER FUNCTION snx.calcularcantidadequiposusb(integer, integer)
    OWNER TO dbkerp_admin;
