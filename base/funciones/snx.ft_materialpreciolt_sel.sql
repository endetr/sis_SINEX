-- FUNCTION: snx.ft_materialpreciolt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materialpreciolt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materialpreciolt_sel(
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
 FUNCION: 		snx.ft_materialpreciolt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaterialpreciolt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:36:40
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:36:40								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaterialpreciolt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_materialpreciolt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MTPLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:40
	***********************************/

	if(p_transaccion='SNX_MTPLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						mtplt.id_materialpreciolt,
						mtplt.id_materiallt,
						mtplt.estado_reg,
						mtplt.valormateriallt,
						mtplt.proyecto,
						mtplt.id_moneda,
						mtplt.fechaprecio,
						mtplt.id_usuario_reg,
						mtplt.usuario_ai,
						mtplt.fecha_reg,
						mtplt.id_usuario_ai,
						mtplt.fecha_mod,
						mtplt.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						mon.moneda as desc_moneda	
						from snx.tmaterialpreciolt mtplt
						inner join segu.tusuario usu1 on usu1.id_usuario = mtplt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mtplt.id_usuario_mod
						left join snx.tmoneda mon on mon.id_moneda = mtplt.id_moneda
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTPLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:40
	***********************************/

	elsif(p_transaccion='SNX_MTPLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_materialpreciolt)
					    from snx.tmaterialpreciolt mtplt
					    inner join segu.tusuario usu1 on usu1.id_usuario = mtplt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mtplt.id_usuario_mod
						left join snx.tmoneda mon on mon.id_moneda = mtplt.id_moneda
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

ALTER FUNCTION snx.ft_materialpreciolt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;