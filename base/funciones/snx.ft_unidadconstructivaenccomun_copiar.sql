-- FUNCTION: snx.ft_unidadconstructivaenccomun_copiar(integer)

-- DROP FUNCTION snx.ft_unidadconstructivaenccomun_copiar(integer);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaenccomun_copiar(
	id_unidadconstructivaenccomunint integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	id_unidadconstructivaenccomunint_new integer;
	
BEGIN
	--Encabezado
	INSERT INTO snx.tunidadconstructivaenccomun
	(
		codigo,
		estado_reg,
		numerobahias,
		descripcion,
		id_usuario_reg,
		fecha_reg,
		usuario_ai,
		id_usuario_ai,
		fecha_mod,
		id_usuario_mod
	)
	SELECT 	codigo || ' [Copia]' AS codigo,
			estado_reg,
			numerobahias,
			descripcion || ' [Copia]' AS descripcion,
			id_usuario_reg,
			now() AS fecha_reg,
			usuario_ai,
			id_usuario_ai,
			now() AS fecha_mod,
			id_usuario_mod
	FROM 	snx.tunidadconstructivaenccomun
	WHERE	id_unidadconstructivaenccomun = id_unidadconstructivaenccomunint
	RETURNING id_unidadconstructivaenccomun into id_unidadconstructivaenccomunint_new;
	
	--Items
	INSERT INTO snx.tunidadconstructivacomun
	(
		id_unidadconstructivaenccomun,
		id_unidad,
		precio,
		cantidadcomun,
		estado_reg,
		unidadconstructivacomun,
		id_usuario_ai,
		id_usuario_reg,
		usuario_ai,
		fecha_reg,
		id_usuario_mod,
		fecha_mod
	)
	SELECT	id_unidadconstructivaenccomunint_new AS id_unidadconstructivaenccomun,
			id_unidad,
			precio,
			cantidadcomun,
			estado_reg,
			unidadconstructivacomun,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			now() AS fecha_reg,
			id_usuario_mod,
			now() AS fecha_mod
	FROM	snx.tunidadconstructivacomun
	WHERE	id_unidadconstructivaenccomun = id_unidadconstructivaenccomunint;
		
	
	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_unidadconstructivaenccomun_copiar(integer)
    OWNER TO dbkerp_admin;