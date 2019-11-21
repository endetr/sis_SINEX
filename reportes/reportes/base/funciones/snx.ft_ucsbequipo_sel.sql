-- FUNCTION: snx.ft_ucsbequipo_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbequipo_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbequipo_sel(
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
 FUNCION: 		snx.ft_ucsbequipo_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucsbequipo'
 AUTOR: 		 (admin)
 FECHA:	        09-07-2018 17:58:19
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				09-07-2018 17:58:19								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucsbequipo'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucsbequipo_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBE_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 17:58:19
	***********************************/

	if(p_transaccion='SNX_UCSBE_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucsbe.id_ucsbequipo,
						ucsbe.id_unidadconstructivasb,
						ucsbe.estado_reg,
						ucsbe.cantidadequ,
						ucsbe.id_equipo,
						ucsbe.id_usuario_reg,
						ucsbe.fecha_reg,
						ucsbe.usuario_ai,
						ucsbe.id_usuario_ai,
						ucsbe.fecha_mod,
						ucsbe.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						equ.equipo desc_equipo,						
						ucsb.codigo,
						ucsb.descripcion,
						cast(snx.calcularprecioequipo(ucsbe.id_equipo) as numeric(18,2)) AS valorunitario,
						cast(ucsbe.cantidadequ * snx.calcularprecioequipo(ucsbe.id_equipo) as numeric(18,2)) AS valortotal
						from snx.tucsbequipo ucsbe						
						inner join snx.tunidadconstructivasb ucsb on ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
						inner join segu.tusuario usu1 on usu1.id_usuario = ucsbe.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucsbe.id_usuario_mod
						inner join snx.tequipo equ on ucsbe.id_equipo = equ.id_equipo
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBE_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 17:58:19
	***********************************/

	elsif(p_transaccion='SNX_UCSBE_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ucsbequipo)
					    from snx.tucsbequipo ucsbe
						inner join snx.tequipo equ on ucsbe.id_equipo = equ.id_equipo
						inner join snx.tunidadconstructivasb ucsb on ucsbe.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucsbe.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucsbe.id_usuario_mod
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

ALTER FUNCTION snx.ft_ucsbequipo_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;