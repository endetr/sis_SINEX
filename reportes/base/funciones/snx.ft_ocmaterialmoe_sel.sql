-- FUNCTION: snx.ft_ocmaterialmoe_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ocmaterialmoe_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ocmaterialmoe_sel(
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
 FUNCION: 		snx.ft_ocmaterialmoe_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tocmaterialmoe'
 AUTOR: 		 (admin)
 FECHA:	        30-08-2018 15:37:04
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				30-08-2018 15:37:04								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tocmaterialmoe'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ocmaterialmoe_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCM_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:04
	***********************************/

	if(p_transaccion='SNX_OCM_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ocm.id_ocmaterialmoe,
						ocm.estado_reg,
						ocm.cantidadmaterialmoe,
						ocm.id_materialmoe,
						ocm.id_obracivilmoe,
						ocm.fecha_reg,
						ocm.usuario_ai,
						ocm.id_usuario_reg,
						ocm.id_usuario_ai,
						ocm.id_usuario_mod,
						ocm.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						mat.materialmoe as desc_materialmoe,
						valmmoe.valorunitariorlpusd,
						valmmoe.valorunitariorcbusd,
						valmmoe.valorunitariorscusd,
						valmmoe.costototalrlp,
						valmmoe.costototalrcb,
						valmmoe.costototalrsc
						from snx.tocmaterialmoe ocm
						inner join segu.tusuario usu1 on usu1.id_usuario = ocm.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ocm.id_usuario_mod
				        left join snx.tmaterialmoe mat on ocm.id_materialmoe = mat.id_materialmoe
					    left join snx.obtenermaterialesmoe(ocm.id_obracivilmoe) valmmoe on ocm.id_obracivilmoe = valmmoe.id_obracivilmoe AND ocm.id_materialmoe = valmmoe.id_materialmoe
					   where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCM_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:04
	***********************************/

	elsif(p_transaccion='SNX_OCM_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ocmaterialmoe)
					    from snx.tocmaterialmoe ocm
					    inner join segu.tusuario usu1 on usu1.id_usuario = ocm.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ocm.id_usuario_mod
					    left join snx.tmaterialmoe mat on ocm.id_materialmoe = mat.id_materialmoe
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

ALTER FUNCTION snx.ft_ocmaterialmoe_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;