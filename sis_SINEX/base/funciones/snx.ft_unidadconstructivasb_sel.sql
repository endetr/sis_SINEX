-- FUNCTION: snx.ft_unidadconstructivasb_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivasb_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivasb_sel(
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
 FUNCION: 		snx.ft_unidadconstructivasb_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivasb'
 AUTOR: 		 (admin)
 FECHA:	        23-07-2018 13:53:45
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-07-2018 13:53:45								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivasb'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivasb_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCS_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 13:53:45
	***********************************/

	if(p_transaccion='SNX_UCS_SEL')then
     				
    	begin
			--PERFORM snx.calcularprecioucsb();
			
    		--Sentencia de la consulta
			v_consulta:='select
						ucs.id_unidadconstructivasb,
						ucs.descripcion,
						ucs.id_tensionservicio,
						ucs.superficie,
						ucs.codigo,
						cast(concat(ucs.codigo,'' - '', ucs.descripcion) as varchar) as desc_coddescrip,
						ucs.alturainstalacion,
						ucs.id_ubicacion,
						ucs.estado_reg,
						ucs.id_claseaislacion,
						ucs.distanciatransporte,
						ucs.distanciatransportemate,
						ucs.numerobahias,
						ucs.varloringenieria,
						ucs.id_usuario_ai,
						ucs.usuario_ai,
						ucs.fecha_reg,
						ucs.id_usuario_reg,
						ucs.fecha_mod,
						ucs.id_usuario_mod,						
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						tens.tensionservicio as desc_tensionservicio,
						ubi.ubicacion as desc_ubicacion,
						clasa.claseaislacion as desc_claseaislacion,
						ucs.valorucsbe,
						ucs.valorucsbm,
						ucs.valorucsbmate,						
						ucs.valorucsdcont,
						ucs.valorucsog,						
						ucs.valorucstotal	
						from snx.tunidadconstructivasb ucs
						inner join segu.tusuario usu1 on usu1.id_usuario = ucs.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucs.id_usuario_mod
						left join snx.ttensionservicio tens on tens.id_tensionservicio=ucs.id_tensionservicio
						left join snx.tubicacion ubi on ubi.id_ubicacion = ucs.id_ubicacion
						left join snx.tclaseaislacion clasa on clasa.id_claseaislacion = ucs.id_claseaislacion
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCS_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 13:53:45
	***********************************/

	elsif(p_transaccion='SNX_UCS_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivasb)
					    from snx.tunidadconstructivasb ucs
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucs.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucs.id_usuario_mod
						left join snx.ttensionservicio tens on tens.id_tensionservicio=ucs.id_tensionservicio
						left join snx.tubicacion ubi on ubi.id_ubicacion = ucs.id_ubicacion
						left join snx.tclaseaislacion clasa on clasa.id_claseaislacion = ucs.id_claseaislacion
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

ALTER FUNCTION snx.ft_unidadconstructivasb_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;