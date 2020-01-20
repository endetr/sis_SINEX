-- FUNCTION: snx.ft_ucltvalorarumon_get(integer)

-- DROP FUNCTION snx.ft_ucltvalorarumon_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_ucltvalorarumon_get(
	id_ucltvalorarint integer)
    RETURNS TABLE(id_ucltvalorarucmon integer, id_ucltvaloraruc integer, id_grupo integer, grupo character varying, id_item integer, item character varying, unidadabrev character varying, cantidaditem numeric, costounitario numeric, costototal numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN

	DROP TABLE if exists ttempmontaje;
	
	CREATE TEMP table ttempmontaje AS 
	select		vucltmon.id_ucltvalorarucmon,
				vuclt.id_unidadconstructivalt,
				vucltmon.id_ucltvaloraruc,
				vucltmon.id_grupo,
				vucltmon.grupo,
				vucltmon.id_item,
				vucltmon.item,
				vucltmon.unidadabrev,
				vucltmon.cantidaditem,
				vucltmon.costounitario,
				0.0 AS costototal
	from 		snx.tucltvalorarucmon vucltmon
	inner join	snx.tucltvaloraruc vuclt ON vucltmon.id_ucltvaloraruc = vuclt.id_ucltvaloraruc
	where		vuclt.id_ucltvalorar = id_ucltvalorarint;
	
	UPDATE	ttempmontaje 
	SET		costototal = ttempmontaje.cantidaditem * ttempmontaje.costounitario;
	
	UPDATE	ttempmontaje 
	SET		costototal =  ttempmontaje.cantidaditem * ttempmontaje.costounitario * tempb.cantidaditem	
	FROM	(
			SELECT tempa.id_unidadconstructivalt, SUM(tempa.cantidaditem) AS cantidaditem FROM ttempmontaje tempa 
			WHERE (tempa.id_item = 10 OR tempa.id_item = 13 OR tempa.id_item = 19 OR tempa.id_item = 20 OR tempa.id_item = 25 OR tempa.id_item = 27) AND tempa.costounitario > 0 
			GROUP BY tempa.id_unidadconstructivalt	
			) tempb
	WHERE	ttempmontaje.id_unidadconstructivalt = tempb.id_unidadconstructivalt AND (ttempmontaje.id_item = 7 OR ttempmontaje.id_item = 16 OR ttempmontaje.id_item = 23);
	
	RETURN QUERY
	select		vucltmon.id_ucltvalorarucmon,
				vucltmon.id_ucltvaloraruc,
				vucltmon.id_grupo,
				vucltmon.grupo,
				vucltmon.id_item,
				vucltmon.item,
				vucltmon.unidadabrev,
				vucltmon.cantidaditem,
				vucltmon.costounitario,
				vucltmon.costototal
	from 		ttempmontaje vucltmon	
	ORDER BY id_item;	
													   
END;

$BODY$;

ALTER FUNCTION snx.ft_ucltvalorarumon_get(integer)
    OWNER TO postgres;