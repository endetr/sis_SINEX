-- FUNCTION: snx.calcularprecioucsbmaterial(integer)

-- DROP FUNCTION snx.calcularprecioucsbmaterial(integer);

CREATE OR REPLACE FUNCTION snx.calcularprecioucsbmaterial(
	id_unidadconstructivasbint integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

Declare
	valortotalucsbe NUMERIC := 0;
	valortotalucsbmate NUMERIC := 0;
	valoripphoy NUMERIC(18,4) := 0;
	mesactual INTEGER := 0;
	anoactual INTEGER := 0;
Begin
	-- Total Material Equipo
	valortotalucsbe := (SELECT	coalesce(SUM(valor),0)
						FROM	(
								SELECT		SUM(A.cantidadmateall) * snx.calcularpreciomaterial(A.id_material) AS valor
								FROM		(
											SELECT		equ.equipo,
														ucsbe.cantidadequ,
														mate.id_material,
														mate.material,
														SUM(emate.cantidadequimat) AS cantidadmate,
														ucsbe.cantidadequ * SUM(emate.cantidadequimat) AS cantidadmateall
											FROM		snx.tucsbequipo ucsbe
											INNER JOIN	snx.tequipo equ ON ucsbe.id_equipo = equ.id_equipo
											INNER JOIN	snx.tequipomaterial emate ON ucsbe.id_equipo = emate.id_equipo
											INNER JOIN	snx.tmaterial mate ON emate.id_material = mate.id_material
											WHERE 		ucsbe.id_unidadconstructivasb = id_unidadconstructivasbint AND ucsbe.cantidadequ > 0 AND emate.cantidadequimat > 0
											GROUP BY	equ.equipo,	ucsbe.cantidadequ, mate.id_material,mate.material
											ORDER BY	equ.equipo, mate.material
											) A
								GROUP BY	A.id_material
								) B);

	-- Total Material Maquinaria
	valortotalucsbmate := (SELECT	coalesce(SUM(valor),0)
							FROM	(
									SELECT		SUM(A.cantidadmateall) * snx.calcularpreciomaterial(A.id_material) AS valor
									FROM		(
												SELECT		maq.maquinaria,
															ucsbm.cantidadmaq,
															mate.id_material,
															mate.material,
															SUM(mmate.cantidadmate) AS cantidadmate,
															ucsbm.cantidadmaq * SUM(mmate.cantidadmate) AS cantidadmateall
												FROM		snx.tucsbmaquinaria ucsbm
												INNER JOIN	snx.tmaquinaria maq ON ucsbm.id_maquinaria = maq.id_maquinaria
												INNER JOIN	snx.tmaquinariamaterial mmate ON ucsbm.id_maquinaria = mmate.id_maquinaria
												INNER JOIN	snx.tmaterial mate ON mmate.id_material = mate.id_material
												WHERE 		ucsbm.id_unidadconstructivasb = id_unidadconstructivasbint AND ucsbm.cantidadmaq > 0 AND mmate.cantidadmate > 0
												GROUP BY	maq.maquinaria,	ucsbm.cantidadmaq, mate.id_material, mate.material
												ORDER BY	maq.maquinaria, mate.material
												) A
									GROUP BY	A.id_material
									) B);
	
	RETURN valortotalucsbe + valortotalucsbmate;
end;

$BODY$;

ALTER FUNCTION snx.calcularprecioucsbmaterial(integer)
    OWNER TO dbkerp_admin;