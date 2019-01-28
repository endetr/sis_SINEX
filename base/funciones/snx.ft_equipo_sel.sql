-- FUNCTION: snx.ft_equipo_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_equipo_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_equipo_sel(
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
 FUNCION: 		snx.ft_equipo_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tequipo'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 12:58:05
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 12:58:05								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tequipo'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;	
			    
BEGIN

	v_nombre_funcion = 'snx.ft_equipo_sel';
    v_parametros = pxp.f_get_record(p_tabla);
	
	/*********************************    
 	#TRANSACCION:  'SNX_EQU_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:58:05
	***********************************/

	if(p_transaccion='SNX_EQU_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						equ.id_equipo,
						equ.equipo,
						equ.id_claseaislacion,
						equ.estado_reg,
						equ.id_usuario_ai,
						equ.id_usuario_reg,
						equ.usuario_ai,
						equ.fecha_reg,
						equ.fecha_mod,
						equ.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
                        cla.claseaislacion as desc_claseaislacion,
						cast(snx.calcularprecioequipo(equ.id_equipo) as numeric(18,2)) as valor,
						cast(snx.calcularprecioequipomate(equ.id_equipo) as numeric(18,2)) as valormat,
						equ.id_factorindexacion,
						lifacin.factorindexacion as desc_factorindexacion,
						equ.id_ambitoprecio,
						apre.ambitoprecio
						from snx.tequipo equ
						inner join segu.tusuario usu1 on usu1.id_usuario = equ.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = equ.id_usuario_mod
                        left join snx.tclaseaislacion cla on equ.id_claseaislacion = cla.id_claseaislacion
				        left join snx.tlistafactoresindexacion lifacin on equ.id_factorindexacion = lifacin.id_factorindexacion
						left join snx.tambitoprecio apre on equ.id_ambitoprecio = apre.id_ambitoprecio
					   where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_EQU_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:58:05
	***********************************/

	elsif(p_transaccion='SNX_EQU_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_equipo)
					   from snx.tequipo equ
						inner join segu.tusuario usu1 on usu1.id_usuario = equ.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = equ.id_usuario_mod
                        left join snx.tclaseaislacion cla on equ.id_claseaislacion = cla.id_claseaislacion
				        left join snx.tlistafactoresindexacion lifacin on equ.id_factorindexacion = lifacin.id_factorindexacion					  where ';
			
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

ALTER FUNCTION snx.ft_equipo_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;