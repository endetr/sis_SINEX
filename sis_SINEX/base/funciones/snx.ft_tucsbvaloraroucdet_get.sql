-- FUNCTION: snx.ft_tucsbvaloraroucdet_get(integer)

-- DROP FUNCTION snx.ft_tucsbvaloraroucdet_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvaloraroucdet_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsbvaloraroucdet integer, id_ucsbvalorarouc integer, nivel integer, descripcion character varying, unidadabrev character varying, cantidaditem numeric, valorunitario numeric, valortotal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	RETURN QUERY
	select		det.id_ucsbvaloraroucdet,
				det.id_ucsbvalorarouc,
				det.nivel,
				det.descripcion,
				det.unidadabrev,
				det.cantidaditem,
				det.valorunitario,
				det.valortotal
	from 		snx.tucsbvaloraroucdet det
	inner join	snx.tucsbvalorarouc vucu ON det.id_ucsbvalorarouc = vucu.id_ucsbvalorarouc
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;													   
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvaloraroucdet_get(integer)
    OWNER TO postgres;