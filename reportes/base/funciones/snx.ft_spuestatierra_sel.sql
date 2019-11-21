-- FUNCTION: snx.ft_spuestatierra_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_spuestatierra_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_spuestatierra_sel(
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
 FUNCION: 		snx.ft_spuestatierra_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tspuestatierra'
 AUTOR: 		 (admin)
 FECHA:	        25-07-2018 13:46:20
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-07-2018 13:46:20								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tspuestatierra'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_spuestatierra_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_SPT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 13:46:20
	***********************************/

	if(p_transaccion='SNX_SPT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						spt.id_puestatierra,
						spt.puestatierra,
						spt.estado_reg,
						spt.id_usuario_ai,
						spt.id_usuario_reg,
						spt.fecha_reg,
						spt.usuario_ai,
						spt.fecha_mod,
						spt.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tspuestatierra spt
						inner join segu.tusuario usu1 on usu1.id_usuario = spt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = spt.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SPT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 13:46:20
	***********************************/

	elsif(p_transaccion='SNX_SPT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_puestatierra)
					    from snx.tspuestatierra spt
					    inner join segu.tusuario usu1 on usu1.id_usuario = spt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = spt.id_usuario_mod
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

ALTER FUNCTION snx.ft_spuestatierra_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;