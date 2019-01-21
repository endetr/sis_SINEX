-- FUNCTION: snx.ft_maquinariaprecio_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinariaprecio_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinariaprecio_sel(
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
 FUNCION: 		snx.ft_maquinariaprecio_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaquinariaprecio'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 19:06:49
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 19:06:49								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaquinariaprecio'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_maquinariaprecio_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MPR_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:49
	***********************************/

	if(p_transaccion='SNX_MPR_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						mpr.id_maquinariaprecio,
						mpr.fechaprecio,
						mpr.proyecto,
						mpr.id_moneda,
						mpr.valormaquinaria,
						mpr.estado_reg,
						mpr.id_maquinaria,
						mpr.id_usuario_ai,
						mpr.fecha_reg,
						mpr.usuario_ai,
						mpr.id_usuario_reg,
						mpr.id_usuario_mod,
						mpr.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
                        mon.moneda as desc_moneda	
						from snx.tmaquinariaprecio mpr
						inner join segu.tusuario usu1 on usu1.id_usuario = mpr.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mpr.id_usuario_mod
				        left join snx.tmoneda mon on mpr.id_moneda = mon.id_moneda
                        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MPR_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:49
	***********************************/

	elsif(p_transaccion='SNX_MPR_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_maquinariaprecio)
					    from snx.tmaquinariaprecio mpr
					    inner join segu.tusuario usu1 on usu1.id_usuario = mpr.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mpr.id_usuario_mod
					    left join snx.tmoneda mon on mpr.id_moneda = mon.id_moneda
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

ALTER FUNCTION snx.ft_maquinariaprecio_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;