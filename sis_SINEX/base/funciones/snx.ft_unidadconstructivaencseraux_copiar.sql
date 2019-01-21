-- FUNCTION: snx.ft_unidadconstructivaencseraux_copiar(integer)

-- DROP FUNCTION snx.ft_unidadconstructivaencseraux_copiar(integer);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaencseraux_copiar(
	unidadconstructivaencserauxint integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	unidadconstructivaencserauxint_new integer;
	
BEGIN
	--Encabezado
	INSERT INTO snx.tunidadconstructivaencseraux
	(
		estado_reg,
		numerobahias,
		descripcion,
		codigo,
		id_usuario_reg,
		fecha_reg,
		usuario_ai,
		id_usuario_ai,
		id_usuario_mod,
		fecha_mod
	)
	SELECT 	estado_reg,
			numerobahias,
			descripcion || ' [Copia]' AS descripcion,
			codigo || ' [Copia]' AS codigo,
			id_usuario_reg,
			now() AS fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			now() AS fecha_mod 
	FROM 	snx.tunidadconstructivaencseraux
	WHERE	unidadconstructivaencseraux = unidadconstructivaencserauxint
	RETURNING unidadconstructivaencseraux into unidadconstructivaencserauxint_new;
	
	--Items
	INSERT INTO snx.tunidadconstructivaseraux
	(
		unidadconstructivaencseraux,
		id_unidad,
		cantidadseraux,
		precio,
		estado_reg,
		unidadconstructivaseraux,
		id_usuario_ai,
		id_usuario_reg,
		fecha_reg,
		usuario_ai,
		id_usuario_mod,
		fecha_mod
	)
	SELECT	unidadconstructivaencserauxint_new AS unidadconstructivaencseraux,
			id_unidad,
			cantidadseraux,
			precio,
			estado_reg,
			unidadconstructivaseraux,
			id_usuario_ai,
			id_usuario_reg,
			now() AS fecha_reg,
			usuario_ai,
			id_usuario_mod,
			now() AS fecha_mod
	FROM	snx.tunidadconstructivaseraux
	WHERE	unidadconstructivaencseraux = unidadconstructivaencserauxint;
		
	
	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_unidadconstructivaencseraux_copiar(integer)
    OWNER TO dbkerp_admin;