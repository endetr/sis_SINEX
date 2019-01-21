-- FUNCTION: snx.ft_tasacambio_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_tasacambio_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_tasacambio_sel(
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
 FUNCION: 		snx.ft_tasacambio_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.ttasacambio'
 AUTOR: 		 (admin)
 FECHA:	        02-04-2018 13:35:50
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				02-04-2018 13:35:50								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.ttasacambio'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_tasacambio_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TAS_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		02-04-2018 13:35:50
	***********************************/

	if(p_transaccion='SNX_TAS_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						tas.id_tasacambio,
						tas.id_mes,
						tas.ano,
						tas.id_monedadestino,
						tas.estado_reg,
						tas.valor,
						tas.id_monedaorigen,
						tas.id_usuario_ai,
						tas.fecha_reg,
						tas.usuario_ai,
						tas.id_usuario_reg,
						tas.id_usuario_mod,
						tas.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	,
                        mes.nombre as desc_nombre,
                        mon.moneda as desc_moneda,
						mon2.moneda as desc_monedaDest
						from snx.ttasacambio tas
						inner join segu.tusuario usu1 on usu1.id_usuario = tas.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tas.id_usuario_mod
                        left join snx.tmoneda mon on mon.id_moneda = tas.id_monedaorigen
						left join snx.tmoneda mon2 on mon2.id_moneda = tas.id_monedadestino
                        left join snx.tmes mes on mes.id_mes = tas.id_mes
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TAS_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		02-04-2018 13:35:50
	***********************************/

	elsif(p_transaccion='SNX_TAS_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_tasacambio)
					    from snx.ttasacambio tas
					    inner join segu.tusuario usu1 on usu1.id_usuario = tas.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tas.id_usuario_mod
                        left join snx.tmoneda mon on mon.id_moneda = tas.id_monedaorigen
						left join snx.tmoneda mon2 on mon2.id_moneda = tas.id_monedadestino
                        left join snx.tmes mes on mes.id_mes = tas.id_mes
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

ALTER FUNCTION snx.ft_tasacambio_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;