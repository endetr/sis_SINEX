CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaeta_copiar(id_unidadconstructivaetaint integer)
 RETURNS void
 LANGUAGE plpgsql
AS $function$

DECLARE
	id_unidadconstructivaetaint_new integer;
	
BEGIN
	--Encabezado
	INSERT INTO snx.tunidadconstructivaeta
	(
		estado_reg,
		unidadconstructivaeta,
		codigo,
		fecha_reg,
		usuario_ai,
		id_usuario_reg,
		id_usuario_ai,
		id_usuario_mod,
		fecha_mod
	)
	SELECT 	estado_reg,
			unidadconstructivaeta || ' [Copia]' AS unidadconstructivaeta,
			codigo || ' [Copia]' AS codigo,
			now() AS fecha_reg,						
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			now() AS fecha_mod			
	FROM 	snx.tunidadconstructivaeta
	WHERE	id_unidadconstructivaeta = id_unidadconstructivaetaint
	RETURNING id_unidadconstructivaeta into id_unidadconstructivaetaint_new;
	
	--Items
	INSERT INTO snx.tunidadconstructivaetaitem
	(
		id_unidadconstructivaeta,
		id_unidad,
		valorunitario,
		estado_reg,
		cantidaditem,
		unidadconstructivaetaitem,
		id_usuario_reg,
		fecha_reg,
		usuario_ai,
		id_usuario_ai,
		id_usuario_mod,
		fecha_mod
	)
	SELECT	id_unidadconstructivaetaint_new AS id_unidadconstructivaeta,
			id_unidad,
			valorunitario,
			estado_reg,
			cantidaditem,
			unidadconstructivaetaitem,
			id_usuario_reg,
			now() fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			now() fecha_mod
	FROM	snx.tunidadconstructivaetaitem
	WHERE	id_unidadconstructivaeta = id_unidadconstructivaetaint;
		
	
	RETURN;
END;

$function$
;
