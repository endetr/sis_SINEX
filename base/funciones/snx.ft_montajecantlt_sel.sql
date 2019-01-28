-- FUNCTION: snx.ft_montajecantlt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_montajecantlt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_montajecantlt_sel(
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
 FUNCION: 		snx.ft_montajecantlt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmontajelt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 12:33:51
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 12:33:51								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmontajelt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_montajecantlt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MONLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 12:33:51
	***********************************/

	if(p_transaccion='SNX_MONLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						monlt.id_unidadconstructivalt,
						monlt.id_grupo,
						monlt.grupo,
						monlt.id_item,
						monlt.item,
						monlt.id_unidad,
						monlt.unidadabrev,
						cast(monlt.cantidaditem as numeric(18,2)) as cantidaditem,
						cast(monlt.costounitari as numeric(18,2)) as costounitari,
						cast(monlt.costototal as numeric(18,2)) as costototal	
						from snx.tunidadconstructivalt uclt
						inner join snx.obtenerucltmontaje(uclt.id_unidadconstructivalt) monlt ON uclt.id_unidadconstructivalt = monlt.id_unidadconstructivalt
						where ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;			
			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MONLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 12:33:51
	***********************************/

	elsif(p_transaccion='SNX_MONLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:=' SELECT COUNT(uclt.id_unidadconstructivalt)
						from snx.tunidadconstructivalt uclt
						inner join snx.obtenerucltmontaje(uclt.id_unidadconstructivalt) monlt ON uclt.id_unidadconstructivalt = monlt.id_unidadconstructivalt
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

ALTER FUNCTION snx.ft_montajecantlt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;