-- FUNCTION: snx.ft_tucsbvalorarouc_get(integer)

-- DROP FUNCTION snx.ft_tucsbvalorarouc_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvalorarouc_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucsbvalorarouc integer, id_ucsbvalorar integer, codigo character varying, descripcion character varying, cantidaditem numeric, valortotal numeric, tensionservicio character varying, claseaislamiento character varying, areasubestacion numeric, longitudvias numeric, norma character varying, porcrepuestos numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

BEGIN

	RETURN QUERY
	select		vucu.id_ucsbvalorarouc,
				vucu.id_ucsbvalorar,
				vucu.codigo,
				vucu.descripcion,
				vucu.cantidaditem,
				vucu.valortotal,
				vucu.tensionservicio,
				vucu.claseaislamiento,
				vucu.areasubestacion,
				vucu.longitudvias,
				vucu.norma,
				vucu.porcrepuestos
	from 		snx.tucsbvalorarouc vucu	
	where		vucu.id_ucsbvalorar = id_ucsbvalorarint;													   
END;


$BODY$;

ALTER FUNCTION snx.ft_tucsbvalorarouc_get(integer)
    OWNER TO postgres;
