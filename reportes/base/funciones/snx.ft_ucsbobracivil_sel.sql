-- FUNCTION: snx.ft_ucsbobracivil_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbobracivil_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbobracivil_sel(
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
 FUNCION: 		snx.ft_ucsbobracivil_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tobraciviles'
 AUTOR: 		 (admin)
 FECHA:	        18-07-2018 15:01:57
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				18-07-2018 15:01:57								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tobraciviles'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucsbobracivil_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBEO_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		18-07-2018 15:01:57
	***********************************/

	if(p_transaccion='SNX_UCSBEO_SEL')then
	--  select snx.calcularprecioobracivil(2,1,'MANO DE OBRA MONTAJE')
    	begin
    		--Sentencia de la consulta
			v_consulta:='
			select  calc.id_unidadconstructivasb,
					calc.codigo,
					calc.id_obracivil,
					calc.descripcion,
					calc.obracivil,
					calc.unidadabrev,
					cast(calc.cantidadpeso as numeric(18,2)) as cantidadpeso,
					cast(calc.valorobracivil as numeric(18,2)) as valorobracivil,
					cast(calc.valorunitario as numeric(18,2)) as valorunitario					
			from snx.tunidadconstructivasb ucs
			INNER JOIN snx.calcularobracivilucsb(ucs.id_unidadconstructivasb, 1) calc on calc.id_unidadconstructivasb = ucs.id_unidadconstructivasb
			WHERE ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBEO_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		18-07-2018 15:01:57
	***********************************/

	elsif(p_transaccion='SNX_UCSBEO_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(calc.*)
			from snx.tunidadconstructivasb ucs
			INNER JOIN snx.calcularobracivilucsb(ucs.id_unidadconstructivasb, 1) calc on calc.id_unidadconstructivasb = ucs.id_unidadconstructivasb
			WHERE ';
			
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

ALTER FUNCTION snx.ft_ucsbobracivil_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;