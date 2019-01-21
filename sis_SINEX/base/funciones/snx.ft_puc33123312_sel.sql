-- FUNCTION: snx.ft_puc33123312_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_puc33123312_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_puc33123312_sel(
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
 FUNCION: 		snx.ft_puc33123312_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tpuc33123312'
 AUTOR: 		 (admin)
 FECHA:	        31-07-2018 15:35:32
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				31-07-2018 15:35:32								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tpuc33123312'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_puc33123312_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_PCU3312_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:35:32
	***********************************/

	if(p_transaccion='SNX_PCU3312_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						pcu3312.id_pcu33123312,
						pcu3312.ano,
						pcu3312.valor,
						pcu3312.estado_reg,
						pcu3312.id_mes,
						pcu3312.id_usuario_reg,
						pcu3312.fecha_reg,
						pcu3312.usuario_ai,
						pcu3312.id_usuario_ai,
						pcu3312.fecha_mod,
						pcu3312.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						mes.nombre as desc_nombre
						from snx.tpuc33123312 pcu3312
						inner join segu.tusuario usu1 on usu1.id_usuario = pcu3312.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = pcu3312.id_usuario_mod
				        left join snx.tmes mes on mes.id_mes = pcu3312.id_mes
					   where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;
			v_consulta:=v_consulta||' order by pcu3312.ano desc,pcu3312.id_mes';
			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PCU3312_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:35:32
	***********************************/

	elsif(p_transaccion='SNX_PCU3312_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_pcu33123312)
					    from snx.tpuc33123312 pcu3312
					    inner join segu.tusuario usu1 on usu1.id_usuario = pcu3312.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = pcu3312.id_usuario_mod
					    left join snx.tmes mes on mes.id_mes = pcu3312.id_mes
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

ALTER FUNCTION snx.ft_puc33123312_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;