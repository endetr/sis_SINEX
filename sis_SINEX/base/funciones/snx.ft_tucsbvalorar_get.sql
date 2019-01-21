-- FUNCTION: snx.ft_tucsbvalorar_get(integer)

-- DROP FUNCTION snx.ft_tucsbvalorar_get(integer);

CREATE OR REPLACE FUNCTION snx.ft_tucsbvalorar_get(
	id_ucsbvalorarint integer)
    RETURNS TABLE(id_ucltvalorar integer, codigoproy character varying, nombreproy character varying, altura numeric, distanciatransext numeric, distanciatransnac numeric, numerobahias integer, desc_terrenosb character varying, desc_revista character varying, valorproyecto numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$

			    
BEGIN
	
	RETURN QUERY
	select	vpuclt.id_ucsbvalorar,
			vpuclt.codigoproy,			
			vpuclt.nombreproy,
			vpuclt.altura,
			vpuclt.distanciatransext,
			vpuclt.distanciatransnac,
			vpuclt.numerobahias,
			coalesce(terr.terrenosb,'') as desc_terrenosb,
			revi.revista as desc_revista,
			(SELECT coalesce(SUM(cuc.cantidaditem * cuc.valorucsbtotal),0) FROM snx.tucsbvalorarcuc cuc WHERE cuc.id_ucsbvalorar = vpuclt.id_ucsbvalorar) +
			(SELECT coalesce(SUM(ouc.cantidaditem * ouc.valortotal),0) FROM snx.tucsbvalorarouc ouc WHERE ouc.id_ucsbvalorar = vpuclt.id_ucsbvalorar) as valorproyecto	
	from 	snx.tucsbvalorar vpuclt
	left join snx.tterrenosb terr on terr.id_terrenosb = vpuclt.id_terrenosb
	left join snx.trevista revi on revi.id_revista = vpuclt.id_revista
	where	vpuclt.id_ucsbvalorar = id_ucsbvalorarint;
						 
END;

$BODY$;

ALTER FUNCTION snx.ft_tucsbvalorar_get(integer)
    OWNER TO dbkerp_admin;