-- FUNCTION: snx.ft_unidadconstructivaeep_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaeep_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaeep_sel(
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
 FUNCION: 		snx.ft_unidadconstructivaeep_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaeep'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:56:19
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:56:19								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaeep'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
	v_textayu			varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivaeep_sel';
    v_parametros = pxp.f_get_record(p_tabla);
	v_textayu = ' - ';
	/*********************************    
 	#TRANSACCION:  'SNX_UCEE_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:19
	***********************************/

	if(p_transaccion='SNX_UCEE_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucee.id_unidadconstructivaeep,
						ucee.codigo_unieepp,						
						ucee.norma,
						ucee.descripcion,
						ucee.id_tensionservicio,
						ucee.estado_reg,
						ucee.id_usuario_ai,
						ucee.fecha_reg,
						ucee.usuario_ai,
						ucee.id_usuario_reg,
						ucee.fecha_mod,
						ucee.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						ten.tensionservicio as desc_tensionservicio,
						CAST(CONCAT(ucee.codigo_unieepp,'' ('',ten.tensionservicio,'')'') as varchar) as codigo_unicod,
						cast(((select sum(valor) from snx.tuceepitem where id_unidadconstructivaeep = ucee.id_unidadconstructivaeep) * (1 + (select sum(valor/100) from snx.tueepotros where id_unidadconstructivaeep = ucee.id_unidadconstructivaeep))) as numeric(18,2)) as totalitems,
						cast(concat(''['',ten.tensionservicio,''] '', ucee.codigo_unieepp) as varchar) as desc_codigo_unieeppten
						from snx.tunidadconstructivaeep ucee
						inner join segu.tusuario usu1 on usu1.id_usuario = ucee.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucee.id_usuario_mod
				        left join snx.ttensionservicio ten on Ten.id_tensionservicio = ucee.id_tensionservicio
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCEE_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:19
	***********************************/

	elsif(p_transaccion='SNX_UCEE_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaeep)
					    from snx.tunidadconstructivaeep ucee
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucee.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucee.id_usuario_mod
						left join snx.ttensionservicio ten on ten.id_tensionservicio = ucee.id_tensionservicio
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

ALTER FUNCTION snx.ft_unidadconstructivaeep_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;