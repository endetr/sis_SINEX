-- FUNCTION: snx.ft_material_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_material_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_material_sel(
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
 FUNCION: 		snx.ft_material_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaterial'
 AUTOR: 		 (admin)
 FECHA:	        05-07-2018 13:08:59
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-07-2018 13:08:59								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaterial'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_material_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MAT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 13:08:59
	***********************************/

	if(p_transaccion='SNX_MAT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						mat.id_material,
						mat.estado_reg,
						mat.peso,
						mat.id_unidad,
						mat.material,
						mat.fecha_reg,
						mat.usuario_ai,
						mat.id_usuario_reg,
						mat.id_usuario_ai,
						mat.id_usuario_mod,
						mat.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						uni.unidad as desc_unidad,
						cast(snx.calcularpreciomaterial(mat.id_material) as numeric(18,2)) as valor,
						mat.id_factorindexacion,
						lifacin.factorindexacion as desc_factorindexacion,
						mat.id_ambitoprecio,
						apre.ambitoprecio
						from snx.tmaterial mat
						inner join segu.tusuario usu1 on usu1.id_usuario = mat.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mat.id_usuario_mod
				        left join snx.tunidad uni on mat.id_unidad = uni.id_unidad
						left join snx.tambitoprecio apre on mat.id_ambitoprecio = apre.id_ambitoprecio
						left join snx.tlistafactoresindexacion lifacin on mat.id_factorindexacion = lifacin.id_factorindexacion
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 13:08:59
	***********************************/

	elsif(p_transaccion='SNX_MAT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_material)
					    from snx.tmaterial mat
					    inner join segu.tusuario usu1 on usu1.id_usuario = mat.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mat.id_usuario_mod
					    left join snx.tunidad uni on mat.id_unidad = uni.id_unidad
						left join snx.tlistafactoresindexacion lifacin on mat.id_factorindexacion = lifacin.id_factorindexacion
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

ALTER FUNCTION snx.ft_material_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;