-- FUNCTION: snx.ft_maquinariaobracivil_updatecant()

-- DROP FUNCTION snx.ft_maquinariaobracivil_updatecant();

CREATE OR REPLACE FUNCTION snx.ft_maquinariaobracivil_updatecant(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

BEGIN
	--Peso
	UPDATE	snx.tmaquinariaobracivil
	SET		cantidadmoc = valorpero.peso
	FROM	(
			SELECT 		TA.id_maquinaria,
						CASE TB.id_tipopreciomaquinaria
							WHEN 1 THEN TB.peso
							WHEN 2 THEN 0.1 * TB.potencia
							WHEN 3 THEN 2 * TB.potencia
							WHEN 4 THEN 2 * TB.potencia
						END AS peso	
			FROM		snx.tmaquinariaobracivil TA
			INNER JOIN	snx.tmaquinaria TB ON TA.id_maquinaria = TB.id_maquinaria
			WHERE		TA.id_obracivil = 1
			) valorpero	
	WHERE	tmaquinariaobracivil.id_maquinaria = valorpero.id_maquinaria AND 
			tmaquinariaobracivil.id_obracivil = 1;
	
	--Hormigon
	UPDATE	snx.tmaquinariaobracivil
	SET		cantidadmoc = tfactor.cantidadmoc * tfactor.numfactor
	FROM	(
			SELECT		TA.id_maquinaria, TA.cantidadmoc, TC.numfactor
			FROM		snx.tmaquinariaobracivil TA
			INNER JOIN	snx.tmaquinaria TB ON TA.id_maquinaria = TB.id_maquinaria
			INNER JOIN	snx.tmaquinariafactor TC ON TB.id_tipopreciomaquinaria = TC.id_tipopreciomaquinaria
			WHERE		TA.id_obracivil = 1 AND TC.id_obracivil = 5 AND TB.id_tipopreciomaquinaria <> 1
			) tfactor
	WHERE	tmaquinariaobracivil.id_maquinaria = tfactor.id_maquinaria AND 
			tmaquinariaobracivil.id_obracivil = 5;

	--Excavación
	UPDATE	snx.tmaquinariaobracivil
	SET		cantidadmoc = tfactor.cantidadmoc * tfactor.numfactor
	FROM	(
			SELECT		TA.id_maquinaria, TA.cantidadmoc, TC.numfactor
			FROM		snx.tmaquinariaobracivil TA
			INNER JOIN	snx.tmaquinaria TB ON TA.id_maquinaria = TB.id_maquinaria
			INNER JOIN	snx.tmaquinariafactor TC ON TB.id_tipopreciomaquinaria = TC.id_tipopreciomaquinaria
			WHERE		TA.id_obracivil = 5 AND TC.id_obracivil = 4 AND TB.id_tipopreciomaquinaria <> 1
			) tfactor
	WHERE	tmaquinariaobracivil.id_maquinaria = tfactor.id_maquinaria AND 
			tmaquinariaobracivil.id_obracivil = 4;

	--Acero
	UPDATE	snx.tmaquinariaobracivil
	SET		cantidadmoc = tfactor.cantidadmoc * tfactor.numfactor
	FROM	(
			SELECT		TA.id_maquinaria, TA.cantidadmoc, TC.numfactor
			FROM		snx.tmaquinariaobracivil TA
			INNER JOIN	snx.tmaquinaria TB ON TA.id_maquinaria = TB.id_maquinaria
			INNER JOIN	snx.tmaquinariafactor TC ON TB.id_tipopreciomaquinaria = TC.id_tipopreciomaquinaria
			WHERE		TA.id_obracivil = 5 AND TC.id_obracivil = 7 AND TB.id_tipopreciomaquinaria <> 1
			) tfactor
	WHERE	tmaquinariaobracivil.id_maquinaria = tfactor.id_maquinaria AND 
			tmaquinariaobracivil.id_obracivil = 7;

	--Relleno
	UPDATE	snx.tmaquinariaobracivil
	SET		cantidadmoc = @(tfactor1.cantidadmoc - tfactor2.cantidadmoc)
	FROM	(
			SELECT		TA.id_maquinaria, TA.cantidadmoc
			FROM		snx.tmaquinariaobracivil TA
			WHERE		TA.id_obracivil = 5 
			) tfactor1, 
			(
			SELECT		TA.id_maquinaria, TA.cantidadmoc
			FROM		snx.tmaquinariaobracivil TA
			WHERE		TA.id_obracivil = 4 
			) tfactor2
	WHERE	tmaquinariaobracivil.id_maquinaria = tfactor1.id_maquinaria AND 
			tmaquinariaobracivil.id_maquinaria = tfactor2.id_maquinaria AND 
			tmaquinariaobracivil.id_obracivil = 6;		

	RETURN;
END;

$BODY$;

ALTER FUNCTION snx.ft_maquinariaobracivil_updatecant()
    OWNER TO dbkerp_conexion;