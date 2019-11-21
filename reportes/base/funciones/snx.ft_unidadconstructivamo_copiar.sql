-- FUNCTION: snx.ft_unidadconstructivamo_copiar(integer)

-- DROP FUNCTION snx.ft_unidadconstructivamo_copiar(integer);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivamo_copiar(
	id_unidadconstructivamoint integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	id_unidadconstructivamoint_new integer;
	
BEGIN
	--Encabezado
	INSERT INTO snx.tunidadconstructivamo
	(
		codigo,
		descripcion,
		estado_reg,
		id_usuario_ai,
		id_usuario_reg,
		fecha_reg,
		usuario_ai,
		fecha_mod,
		id_usuario_mod
	)
	SELECT 	codigo || ' [Copia]' AS codigo,
			descripcion || ' [Copia]' AS descripcion,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			now() AS fecha_reg,
			usuario_ai,
			now() AS fecha_mod,
			id_usuario_mod 
	FROM 	snx.tunidadconstructivamo
	WHERE	id_unidadconstructivamo = id_unidadconstructivamoint
	RETURNING id_unidadconstructivamo into id_unidadconstructivamoint_new;
	
	--Grupos
	INSERT INTO snx.tucmogrupo
	(
		id_unidadconstructivamo,
		estado_reg,
		unmogrupo,
		fecha_reg,
		usuario_ai,
		id_usuario_reg,
		id_usuario_ai,
		fecha_mod,
		id_usuario_mod
	)
	SELECT	id_unidadconstructivamoint_new AS id_unidadconstructivamo,
			estado_reg,
			unmogrupo,
			now() AS fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			now() AS fecha_mod,
			id_usuario_mod
	FROM	snx.tucmogrupo
	WHERE	id_unidadconstructivamo = id_unidadconstructivamoint;
	
	--Obra Civil
	INSERT INTO snx.tucmoobracivil
	(
		id_obracivilmoe,
		cantidadobra,
		estado_reg,
		id_ucmogrupo,
		id_usuario_ai,
		id_usuario_reg,
		usuario_ai,
		fecha_reg,
		id_usuario_mod,
		fecha_mod
     )
	SELECT		mooc.id_obracivilmoe,
				mooc.cantidadobra,
				mooc.estado_reg,
				mogn.id_ucmogrupo,
				mooc.id_usuario_ai,
				mooc.id_usuario_reg,
				mooc.usuario_ai,
				now() AS fecha_reg,
				mooc.id_usuario_mod,
				now() AS fecha_mod
	FROM		snx.tucmoobracivil mooc
	INNER JOIN	snx.tucmogrupo mog ON mooc.id_ucmogrupo = mog.id_ucmogrupo
	INNER JOIN	snx.tucmogrupo mogn ON mog.unmogrupo = mogn.unmogrupo
	WHERE		mog.id_unidadconstructivamo = id_unidadconstructivamoint AND 
				mogn.id_unidadconstructivamo = id_unidadconstructivamoint_new;
	
	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_unidadconstructivamo_copiar(integer)
    OWNER TO dbkerp_admin;