-- FUNCTION: snx.ft_unidadconstructivacomp_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivacomp_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivacomp_sel(
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
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_unidadconstructivacomp_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivacomp'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:56:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:56:16								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivacomp'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivacomp_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:16
	***********************************/

	if(p_transaccion='SNX_UCC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucc.id_unidadconstructivacomp,
						ucc.unidadconstructivacomp,
						ucc.valor,
						ucc.capacidad,
						ucc.estado_reg,
						ucc.codigo_unicomp,
						ucc.id_usuario_ai,
						ucc.usuario_ai,
						ucc.fecha_reg,
						ucc.id_usuario_reg,
						ucc.id_usuario_mod,
						ucc.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						(ucc.capacidad * ucc.valor) as valortotal	
						from snx.tunidadconstructivacomp ucc
						inner join segu.tusuario usu1 on usu1.id_usuario = ucc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucc.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:16
	***********************************/

	elsif(p_transaccion='SNX_UCC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivacomp)
					    from snx.tunidadconstructivacomp ucc
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucc.id_usuario_mod
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

ALTER FUNCTION snx.ft_unidadconstructivacomp_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;