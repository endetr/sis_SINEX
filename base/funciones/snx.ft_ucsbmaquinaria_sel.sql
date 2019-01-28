-- FUNCTION: snx.ft_ucsbmaquinaria_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbmaquinaria_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbmaquinaria_sel(
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
 FUNCION: 		snx.ft_ucsbmaquinaria_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucsbmaquinaria'
 AUTOR: 		 (admin)
 FECHA:	        09-07-2018 15:17:47
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				09-07-2018 15:17:47								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucsbmaquinaria'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucsbmaquinaria_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBM_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 15:17:47
	***********************************/

	if(p_transaccion='SNX_UCSBM_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucsbm.id_ucsbmaquinaria,
						ucsbm.estado_reg,
						ucsbm.id_maquinaria,
						ucsbm.cantidadmaq,
						ucsbm.id_unidadconstructivasb,
						ucsbm.id_usuario_reg,
						ucsbm.usuario_ai,
						ucsbm.fecha_reg,
						ucsbm.id_usuario_ai,
						ucsbm.id_usuario_mod,
						ucsbm.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						maq.maquinaria,
						ucsb.codigo,
						ucsb.descripcion,
						cast(snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) as numeric(18,2)) AS valorunitario,
						cast(ucsbm.cantidadmaq * snx.calcularpreciomaquinaria(ucsbm.id_maquinaria) as numeric(18,2)) AS valortotal
						from snx.tucsbmaquinaria ucsbm
						inner join snx.tmaquinaria maq on ucsbm.id_maquinaria = maq.id_maquinaria
						inner join snx.tunidadconstructivasb ucsb on ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
						inner join segu.tusuario usu1 on usu1.id_usuario = ucsbm.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucsbm.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBM_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 15:17:47
	***********************************/

	elsif(p_transaccion='SNX_UCSBM_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ucsbmaquinaria)
					    from snx.tucsbmaquinaria ucsbm
						inner join snx.tmaquinaria maq on ucsbm.id_maquinaria = maq.id_maquinaria
						inner join snx.tunidadconstructivasb ucsb on ucsbm.id_unidadconstructivasb = ucsb.id_unidadconstructivasb
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucsbm.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucsbm.id_usuario_mod
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

ALTER FUNCTION snx.ft_ucsbmaquinaria_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;