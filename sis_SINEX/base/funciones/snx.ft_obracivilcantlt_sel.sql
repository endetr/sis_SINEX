-- FUNCTION: snx.ft_obracivilcantlt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_obracivilcantlt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_obracivilcantlt_sel(
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
 FUNCION: 		snx.ft_obracivilcantlt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tobracivillt'
 AUTOR: 		 (admin)
 FECHA:	        25-07-2018 14:56:53
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-07-2018 14:56:53								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tobracivillt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_obracivilcantlt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 14:56:53
	***********************************/

	if(p_transaccion='SNX_OCLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucltoccant.id_unidadconstructivalt,
						ucltoccant.terrenolt,
						ucltoccant.funcionestructura,
						ucltoccant.tipocimentacion,
						cast(ucltoccant.cantidaditem as numeric(18,2)) as cantidaditem,
						cast(ucltoccant.cosotunitariooc as numeric(18,2)) as cosotunitariooc,
						cast(ucltoccant.costototaloc as numeric(18,2)) as costototaloc,
						cast(ucltoccant.pesounitariooc as numeric(18,2)) as pesounitariooc,
						cast(ucltoccant.pesototaloc	as numeric(18,2)) as pesototaloc
						from snx.tunidadconstructivalt uclt
						inner join snx.obtenerucltobracivil(uclt.id_unidadconstructivalt, uclt.id_revista) ucltoccant ON uclt.id_unidadconstructivalt = ucltoccant.id_unidadconstructivalt
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;			

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 14:56:53
	***********************************/

	elsif(p_transaccion='SNX_OCLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(uclt.id_unidadconstructivalt)
					    from snx.tunidadconstructivalt uclt
						inner join snx.obtenerucltobracivil(uclt.id_unidadconstructivalt, uclt.id_revista) ucltoccant ON uclt.id_unidadconstructivalt = ucltoccant.id_unidadconstructivalt
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

ALTER FUNCTION snx.ft_obracivilcantlt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;