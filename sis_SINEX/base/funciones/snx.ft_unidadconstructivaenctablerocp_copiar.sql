-- FUNCTION: snx.ft_unidadconstructivaenctablerocp_copiar(integer)

-- DROP FUNCTION snx.ft_unidadconstructivaenctablerocp_copiar(integer);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaenctablerocp_copiar(
	id_unidadconstructivaenctablerocpint integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	id_unidadconstructivaenctablerocpint_new integer;
	
BEGIN
	--Encabezado
	INSERT INTO snx.tunidadconstructivaenctablerocp
	(
		codigo,
		numerobahias,
		descripcion,
		porcrepuestos,
		estado_reg,
		id_usuario_ai,
		id_usuario_reg,
		fecha_reg,
		usuario_ai,
		fecha_mod,
		id_usuario_mod
	)
	SELECT 	codigo || ' [Copia]' AS codigo,
			numerobahias,
			descripcion || ' [Copia]' AS descripcion,
			porcrepuestos,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			now() AS fecha_reg,
			usuario_ai,
			now() AS fecha_mod,
			id_usuario_mod 
	FROM 	snx.tunidadconstructivaenctablerocp
	WHERE	id_unidadconstructivaenctablerocp = id_unidadconstructivaenctablerocpint
	RETURNING id_unidadconstructivaenctablerocp into id_unidadconstructivaenctablerocpint_new;
	
	--Items
	INSERT INTO snx.tunidadconstructivatablerocp
	(
		id_unidadconstructivaenctablerocp,
		precio,
		cantidadtablerocp,
		estado_reg,
		unidadconstructivatablerocp,
		id_usuario_ai,
		id_usuario_reg,
		usuario_ai,
		fecha_reg,
		id_usuario_mod,
		fecha_mod
	)
	SELECT	id_unidadconstructivaenctablerocpint_new AS id_unidadconstructivaenctablerocp,
			precio,
			cantidadtablerocp,
			estado_reg,
			unidadconstructivatablerocp,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			now() AS fecha_reg,
			id_usuario_mod,
			now() AS fecha_mod
	FROM	snx.tunidadconstructivatablerocp
	WHERE	id_unidadconstructivaenctablerocp = id_unidadconstructivaenctablerocpint;
	
	--Servicios
	INSERT INTO snx.tunidadconstructivatablerocpserv
	(
		id_unidadconstructivaenctablerocp,
		estado_reg,
		cantidadserv,
		precio,
		unidadconstructivatablerocpserv,
		fecha_reg,
		usuario_ai,
		id_usuario_reg,
		id_usuario_ai,
		fecha_mod,
		id_usuario_mod
	)
	SELECT	id_unidadconstructivaenctablerocpint_new AS id_unidadconstructivaenctablerocp,
			estado_reg,
			cantidadserv,
			precio,
			unidadconstructivatablerocpserv,
			now() AS fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			now() AS fecha_mod,
			id_usuario_mod
	FROM	snx.tunidadconstructivatablerocpserv
	WHERE	id_unidadconstructivaenctablerocp = id_unidadconstructivaenctablerocpint;
	
	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_unidadconstructivaenctablerocp_copiar(integer)
    OWNER TO dbkerp_admin;