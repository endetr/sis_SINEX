-- FUNCTION: snx.ft_maquinariamaterial_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinariamaterial_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinariamaterial_sel(
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
 FUNCION: 		snx.ft_maquinariamaterial_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaquinariamaterial'
 AUTOR: 		 (admin)
 FECHA:	        05-07-2018 18:55:02
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-07-2018 18:55:02								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaquinariamaterial'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_maquinariamaterial_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMA_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 18:55:02
	***********************************/

	if(p_transaccion='SNX_MAQMA_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						maqma.id_maquinariamaterial,
						maqma.id_material,
						maqma.id_maquinaria,
						maqma.estado_reg,
						maqma.cantidadmate,
						cast(snx.calcularpreciomaterial(maqma.id_material) as numeric(18,2)) as valorunitario,
						cast(maqma.cantidadmate * snx.calcularpreciomaterial(maqma.id_material) as numeric(18,2)) as valortotal,
						maqma.fecha_reg,
						maqma.usuario_ai,
						maqma.id_usuario_reg,
						maqma.id_usuario_ai,
						maqma.fecha_mod,
						maqma.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						mat.material as desc_material,
						maq.maquinaria as desc_maquinaria	
						from snx.tmaquinariamaterial maqma
						inner join segu.tusuario usu1 on usu1.id_usuario = maqma.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = maqma.id_usuario_mod
						left join snx.tmaterial mat on mat.id_material = maqma.id_material
						left join snx.tmaquinaria maq on maq.id_maquinaria = maqma.id_maquinaria
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMA_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 18:55:02
	***********************************/

	elsif(p_transaccion='SNX_MAQMA_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_maquinariamaterial)
					    from snx.tmaquinariamaterial maqma
					    inner join segu.tusuario usu1 on usu1.id_usuario = maqma.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = maqma.id_usuario_mod
						left join snx.tmaterial mat on mat.id_material = maqma.id_material
						left join snx.tmaquinaria maq on maq.id_maquinaria = maqma.id_maquinaria
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

ALTER FUNCTION snx.ft_maquinariamaterial_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;