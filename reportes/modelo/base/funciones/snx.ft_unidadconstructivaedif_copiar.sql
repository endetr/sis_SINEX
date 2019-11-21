-- FUNCTION: snx.ft_unidadconstructivaedif_copiar(integer)

-- DROP FUNCTION snx.ft_unidadconstructivaedif_copiar(integer);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaedif_copiar(
	id_unidadconstructivaedifint integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	id_unidadconstructivaedifint_new integer;
	
BEGIN
	--Encabezado
	INSERT INTO snx.tunidadconstructivaedif
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
	FROM 	snx.tunidadconstructivaedif
	WHERE	id_unidadconstructivaedif = id_unidadconstructivaedifint
	RETURNING id_unidadconstructivaedif into id_unidadconstructivaedifint_new;
	
	--Grupos
	INSERT INTO snx.tucedifgrupo
	(
		estado_reg,
		ucedifgrupo,
		id_unidadconstructivaedif,
		fecha_reg,
		usuario_ai,
		id_usuario_reg,
		id_usuario_ai,
		id_usuario_mod,
		fecha_mod
	)
	SELECT	estado_reg,
			ucedifgrupo,
			id_unidadconstructivaedifint_new AS id_unidadconstructivaedif,
			now() AS fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			now() AS fecha_mod
	FROM	snx.tucedifgrupo
	WHERE	id_unidadconstructivaedif = id_unidadconstructivaedifint;
	
	--SubGrupos
	INSERT INTO snx.tucedifsubgrupo
	(
		id_ucedifgrupo,
		ucedifsubgrupo,
		estado_reg,
		id_usuario_ai,
		id_usuario_reg,
		usuario_ai,
		fecha_reg,
		fecha_mod,
		id_usuario_mod
	)
	SELECT		ucgn.id_ucedifgrupo,
				ucsg.ucedifsubgrupo,
				ucsg.estado_reg,
				ucsg.id_usuario_ai,
				ucsg.id_usuario_reg,
				ucsg.usuario_ai,
				now() AS fecha_reg,
				now() AS fecha_mod,
				ucsg.id_usuario_mod
	FROM		snx.tucedifsubgrupo ucsg
	INNER JOIN	snx.tucedifgrupo ucg ON ucsg.id_ucedifgrupo = ucg.id_ucedifgrupo
	INNER JOIN	snx.tucedifgrupo ucgn ON ucg.ucedifgrupo = ucgn.ucedifgrupo
	WHERE		ucg.id_unidadconstructivaedif = id_unidadconstructivaedifint AND
				ucgn.id_unidadconstructivaedif = id_unidadconstructivaedifint_new;
			
	--Obra Civil
	INSERT INTO snx.tucedifobracivil
	(
		id_ucedifsubgrupo,
		cantidadobracivil,
		id_obracivilmoe,
		estado_reg,
		id_usuario_ai,
		id_usuario_reg,
		fecha_reg,
		usuario_ai,
		fecha_mod,
		id_usuario_mod
	)
	SELECT		ucsgn.id_ucedifsubgrupo,
				ucoc.cantidadobracivil,
				ucoc.id_obracivilmoe,
				ucoc.estado_reg,
				ucoc.id_usuario_ai,
				ucoc.id_usuario_reg,
				now() AS fecha_reg,
				ucoc.usuario_ai,
				now() AS fecha_mod,
				ucoc.id_usuario_mod
	FROM		snx.tucedifobracivil ucoc
	INNER JOIN	snx.tucedifsubgrupo ucsg ON ucoc.id_ucedifsubgrupo = ucsg.id_ucedifsubgrupo
	INNER JOIN	snx.tucedifgrupo ucg ON ucsg.id_ucedifgrupo = ucg.id_ucedifgrupo
	INNER JOIN	snx.tucedifsubgrupo ucsgn ON ucsg.ucedifsubgrupo = ucsgn.ucedifsubgrupo
	INNER JOIN	snx.tucedifgrupo ucgn ON ucsgn.id_ucedifgrupo = ucgn.id_ucedifgrupo AND ucg.ucedifgrupo = ucgn.ucedifgrupo
	WHERE		ucg.id_unidadconstructivaedif = id_unidadconstructivaedifint AND 
				ucgn.id_unidadconstructivaedif = id_unidadconstructivaedifint_new;
	
	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_unidadconstructivaedif_copiar(integer)
    OWNER TO dbkerp_admin;