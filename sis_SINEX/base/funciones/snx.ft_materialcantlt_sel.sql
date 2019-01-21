-- FUNCTION: snx.ft_materialcantlt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materialcantlt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materialcantlt_sel(
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
 FUNCION: 		snx.ft_materialcantlt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmateriallt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:36:34
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:36:34								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmateriallt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_materialcantlt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MTLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:34
	***********************************/

	if(p_transaccion='SNX_MTLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select 
								uclteqmate.id_unidadconstructivalt,
								uclteqmate.id_grupo,
								uclteqmate.grupo,
								uclteqmate.id_item,	
								uclteqmate.item,
								uclteqmate.id_unidad,
								uclteqmate.unidadabrev,
								uclteqmate.cantidaditem,
								cast(uclteqmate.costounitarioext as numeric(18,2)) as costounitarioext,
								cast(uclteqmate.costounitarinac as numeric(18,2)) as costounitarinac,	
								cast(uclteqmate.costototalext as numeric(18,2)) as costototalext,
								cast(uclteqmate.costototalnac as numeric(18,2)) as costototalnac,
								cast(uclteqmate.costototalsumi as numeric(18,2)) as costototalsumi,
								cast(uclteqmate.pesounitarioext as numeric(18,2)) as pesounitarioext,
								cast(uclteqmate.pesototalext as numeric(18,2)) as pesototalext,
								cast(uclteqmate.pesounitarionac as numeric(18,2)) as pesounitarionac,
								cast(uclteqmate.pesototalnac as numeric(18,2)) as pesototalnac,
								templ.id_puestatierra,
								ptie.puestatierra,
								templ.id_aislador,
								ais.aislador
						from snx.tunidadconstructivalt uclt
						inner join snx.obteneruclteqmate(uclt.id_unidadconstructivalt) uclteqmate ON uclt.id_unidadconstructivalt = uclteqmate.id_unidadconstructivalt	
						inner join snx.tunidadconstructivalteqmate templ ON uclteqmate.id_unidadconstructivalt = templ.id_unidadconstructivalt AND
																			 uclteqmate.id_item = templ.id_item	
						inner join snx.tspuestatierra ptie ON templ.id_puestatierra = ptie.id_puestatierra
						inner join snx.taislador ais ON templ.id_aislador = ais.id_aislador
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;			
			
			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:34
	***********************************/

	elsif(p_transaccion='SNX_MTLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(uclt.id_unidadconstructivalt)
						from snx.tunidadconstructivalt uclt
						inner join snx.obteneruclteqmate(uclt.id_unidadconstructivalt) uclteqmate ON uclt.id_unidadconstructivalt = uclteqmate.id_unidadconstructivalt
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

ALTER FUNCTION snx.ft_materialcantlt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;