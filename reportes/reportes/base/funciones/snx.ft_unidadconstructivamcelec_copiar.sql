-- FUNCTION: snx.ft_unidadconstructivamcelec_copiar(integer)

-- DROP FUNCTION snx.ft_unidadconstructivamcelec_copiar(integer);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivamcelec_copiar(
	id_unidadconstructivamcelecint integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	id_unidadconstructivamcelecint_new integer;
	
BEGIN
	--Encabezado
	INSERT INTO snx.tunidadconstructivamcelec
	(
		codigo,
		areasub,
		estado_reg,
		numerobahias,
		longitudvia,
		id_claseaislacion,
		descripcion,
		id_tensionservicio,
		usuario_ai,
		fecha_reg,
		id_usuario_reg,
		id_usuario_ai,
		fecha_mod,
		id_usuario_mod
	)
	SELECT 	codigo || ' [Copia]' AS codigo,
			areasub,
			estado_reg,
			numerobahias,
			longitudvia,
			id_claseaislacion,
			descripcion || ' [Copia]' AS descripcion,
			id_tensionservicio,
			usuario_ai,
			now() AS fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			now() AS fecha_mod,
			id_usuario_mod 
	FROM 	snx.tunidadconstructivamcelec
	WHERE	id_unidadconstructivamcelec = id_unidadconstructivamcelecint
	RETURNING id_unidadconstructivamcelec into id_unidadconstructivamcelecint_new;
	
	--Items
	INSERT INTO snx.tucmceitem
	(
		estado_reg,
		precio,
		grupo,
		descripcion,
		id_unidadconstructivamcelec,
		usuario_ai,
		fecha_reg,
		id_usuario_reg,
		id_usuario_ai,
		id_usuario_mod,
		fecha_mod
	)
	SELECT	estado_reg,
			precio,
			grupo,
			descripcion,
			id_unidadconstructivamcelecint_new AS id_unidadconstructivamcelec,
			usuario_ai,
			now() AS fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			now() AS fecha_mod
	FROM	snx.tucmceitem
	WHERE	id_unidadconstructivamcelec = id_unidadconstructivamcelecint;
	
	
	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_unidadconstructivamcelec_copiar(integer)
    OWNER TO dbkerp_admin;