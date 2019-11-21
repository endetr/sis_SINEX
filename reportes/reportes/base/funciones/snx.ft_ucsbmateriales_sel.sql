-- FUNCTION: snx.ft_ucsbmateriales_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbmateriales_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbmateriales_sel(
	p_administrador integer,
	p_id_usuario integer,
	p_tabla character varying,
	p_transaccion character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

/**************************************************************************
 SISTEMA:		SINEX
 FUNCION: 		snx.ft_materiales_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmateriales'
 AUTOR: 		 (admin)
 FECHA:	        16-07-2018 14:29:09
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-07-2018 14:29:09								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmateriales'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_materiales_sel';
    v_parametros = pxp.f_get_record(p_tabla);
	
	/*********************************    
 	#TRANSACCION:  'SNX_UCSBM_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		16-07-2018 14:29:09
	***********************************/

	if(p_transaccion='SNX_UCSBM_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='
			SELECT  id_unidadconstructivasb,
        			codigo,
					descripcion,                                      
        			id_material,
        			material,
        			cast(SUM(cantidadmate) as numeric(18,2)) AS cantidadmate,
        			cast(snx.calcularpreciomaterial(id_material) as numeric(18,2)) AS valorunitario,
        			cast(SUM(cantidadmate) * snx.calcularpreciomaterial(id_material) as numeric(18,2)) AS valortotal
					FROM (SELECT ucsb.id_unidadconstructivasb,
       						ucsb.codigo,
       						ucsb.descripcion,                                           
       						mate.id_material,
       						mate.material,
       						emate.cantidadequimat * ucsbe.cantidadequ AS cantidadmate
						FROM snx.tucsbequipo ucsbe
						INNER JOIN snx.tunidadconstructivasb ucsb ON ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
						INNER JOIN snx.tequipomaterial emate ON ucsbe.id_equipo = emate.id_equipo
						INNER JOIN snx.tmaterial mate ON emate.id_material = mate.id_material
						WHERE ucsbe.cantidadequ > 0 AND emate.cantidadequimat > 0
UNION ALL
						SELECT ucsb.id_unidadconstructivasb,
       					ucsb.codigo,
       					ucsb.descripcion,                                           
       					mate.id_material,
       					mate.material,
       					mmate.cantidadmate * ucsbm.cantidadmaq AS cantidadmate
						FROM snx.tucsbmaquinaria ucsbm
						INNER JOIN snx.tunidadconstructivasb ucsb ON ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
						INNER JOIN snx.tmaquinariamaterial mmate ON ucsbm.id_maquinaria = mmate.id_maquinaria
						INNER JOIN snx.tmaterial mate ON mmate.id_material = mate.id_material
						WHERE ucsbm.cantidadmaq > 0 AND mmate.cantidadmate > 0) as tmateri where ';
			
			--Definicion de la respuesta
			--v_consulta:=v_consulta||' id_unidadconstructivasb = '||v_parametros.id_unidadconstructivasb;
			
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' GROUP BY id_unidadconstructivasb, codigo, descripcion, id_material, Material; ';
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBM_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		16-07-2018 14:29:09
	***********************************/

	elsif(p_transaccion='SNX_UCSBM_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_materiales)
					    from snx.tmateriales ucsbm
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucsbm.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucsbm.id_usuario_mod
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else
					     
		raise exception 'Transaccion inexistente';
					         
	end if;
					
EXCEPTION
					
	WHEN OTHERS THEN
			v_resp='';
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
			v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
			v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
			raise exception '%',v_resp;
END;

$BODY$;

ALTER FUNCTION snx.ft_ucsbmateriales_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;