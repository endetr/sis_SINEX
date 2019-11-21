-- FUNCTION: snx.ft_ucmceitem_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucmceitem_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucmceitem_sel(
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
 FUNCION: 		snx.ft_ucmceitem_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucmceitem'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:31
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:31								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucmceitem'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucmceitem_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TUCI_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:31
	***********************************/

	if(p_transaccion='SNX_TUCI_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						tuci.id_ucmeitem,
						tuci.estado_reg,
						tuci.precio,
						tuci.grupo,
						tuci.descripcion,
						tuci.id_unidadconstructivamcelec,
						tuci.usuario_ai,
						tuci.fecha_reg,
						tuci.id_usuario_reg,
						tuci.id_usuario_ai,
						tuci.id_usuario_mod,
						tuci.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						CAST(CASE
								WHEN tuci.descripcion = ''Cantidad de cable de tierra 4/0 AWG (m)'' THEN (((select cableporbahina from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)*mcuc.numerobahias) 
								+(mcuc.areasub * (select factortorre from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion))) * tuci.precio
								WHEN tuci.descripcion = ''Cantidad de cable de guarda Alumoweld (m)'' THEN ((mcuc.numerobahias * (select cableporbahia from snx.tmcelecapantallamiento where id_claseaislamiento = mcuc.id_claseaislacion))* tuci.precio)
								WHEN tuci.descripcion = ''Total de luminarias viales'' THEN (ceil(mcuc.longitudvia / 25))* tuci.precio
								WHEN tuci.descripcion = ''Total de Luminarias en pórticos'' THEN (mcuc.numerobahias * (select luminariaporpb from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
								WHEN tuci.descripcion = ''Total tubo PVC 2.5 enterrado'' THEN (mcuc.numerobahias * (select tubopvc from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
								WHEN tuci.descripcion = ''Total cable 4x12 AWG'' THEN (mcuc.numerobahias * (select totalcable from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
								ELSE 0.0
							END AS numeric
						) as totalitem,
						CAST(CASE
								WHEN tuci.descripcion = ''Cantidad de cable de tierra 4/0 AWG (m)'' THEN (((select cableporbahina from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)*mcuc.numerobahias) 
								+(mcuc.areasub * (select factortorre from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)))
								WHEN tuci.descripcion = ''Cantidad de cable de guarda Alumoweld (m)'' THEN ((mcuc.numerobahias * (select cableporbahia from snx.tmcelecapantallamiento where id_claseaislamiento = mcuc.id_claseaislacion)))
								WHEN tuci.descripcion = ''Total de luminarias viales'' THEN (ceil(mcuc.longitudvia / 25))
								WHEN tuci.descripcion = ''Total de Luminarias en pórticos'' THEN (mcuc.numerobahias * (select luminariaporpb from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))
								WHEN tuci.descripcion = ''Total tubo PVC 2.5 enterrado'' THEN (mcuc.numerobahias * (select tubopvc from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))
								WHEN tuci.descripcion = ''Total cable 4x12 AWG'' THEN (mcuc.numerobahias * (select totalcable from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))
								ELSE 0.0
							END AS numeric
						) as matitem
						from snx.tucmceitem tuci
						inner join segu.tusuario usu1 on usu1.id_usuario = tuci.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tuci.id_usuario_mod
						inner join snx.tunidadconstructivamcelec mcuc on mcuc.id_unidadconstructivamcelec = tuci.id_unidadconstructivamcelec
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TUCI_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:31
	***********************************/

	elsif(p_transaccion='SNX_TUCI_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ucmeitem)
					    from snx.tucmceitem tuci
					    inner join segu.tusuario usu1 on usu1.id_usuario = tuci.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tuci.id_usuario_mod
						inner join snx.tunidadconstructivamcelec mcuc on mcuc.id_unidadconstructivamcelec = tuci.id_unidadconstructivamcelec
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

ALTER FUNCTION snx.ft_ucmceitem_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;