-- FUNCTION: snx.ft_unidadconstructivamcelec_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivamcelec_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivamcelec_sel(
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
 FUNCION: 		snx.ft_unidadconstructivamcelec_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivamcelec'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:28
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:28								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivamcelec'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivamcelec_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MCUC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:28
	***********************************/	
	--Obtener otros gastos		
	if(p_transaccion='SNX_OTG_SEL')then
		begin
			v_consulta:='SELECT 	mcog.id_item,mcog.id_otrauc,mcog.otrosgastos,mcog.cantidadog,mcog.valorunitario,mcog.valorog
						FROM 	(
								select    	mcuc.id_unidadconstructivamcelec,      
											mcuc.numerobahias,
											(select 		SUM(CAST(CASE
															WHEN tuci.id_ucmeitem = 1 THEN (((select cableporbahina from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)*mcuc.numerobahias) 
															+(mcuc.areasub * (select factortorre from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion))) * tuci.precio
															WHEN tuci.id_ucmeitem = 2 THEN ((mcuc.numerobahias * (select cableporbahia from snx.tmcelecapantallamiento where id_claseaislamiento = mcuc.id_claseaislacion))* tuci.precio)
															WHEN tuci.id_ucmeitem = 3 THEN (ceil(mcuc.longitudvia / 25))* tuci.precio
															WHEN tuci.id_ucmeitem = 4 THEN (mcuc.numerobahias * (select luminariaporpb from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
															WHEN tuci.id_ucmeitem = 5 THEN (mcuc.numerobahias * (select tubopvc from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
															WHEN tuci.id_ucmeitem = 6 THEN (mcuc.numerobahias * (select totalcable from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
															ELSE 0.0
															END AS numeric))
											from 		snx.tucmceitem tuci) AS totalitems
								from 		snx.tunidadconstructivamcelec mcuc
								left join 	snx.tclaseaislacion clas on clas.id_claseaislacion = mcuc.id_claseaislacion
								left join 	snx.ttensionservicio ten on ten.id_tensionservicio = mcuc.id_tensionservicio															
								) mcuc
						INNER JOIN snx.calcularotrosgastosotrasuc(mcuc.id_unidadconstructivamcelec, mcuc.numerobahias, mcuc.totalitems, 3) mcog ON mcuc.id_unidadconstructivamcelec = mcog.id_otrauc
						where ';
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;
		end;
		
	elsif(p_transaccion='SNX_OTG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivamcelec)
					    from snx.tunidadconstructivamcelec mcuc
					    inner join segu.tusuario usu1 on usu1.id_usuario = mcuc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mcuc.id_usuario_mod
						left join snx.tclaseaislacion clas on clas.id_claseaislacion = mcuc.id_claseaislacion
						left join snx.ttensionservicio ten on ten.id_tensionservicio = mcuc.id_tensionservicio';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	elseif(p_transaccion='SNX_MCUC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='SELECT		mcuc.*,
									(SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(mcuc.id_unidadconstructivamcelec,1,mcuc.totalitems,3)) AS totalog,
									mcuc.totalitems + (SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(mcuc.id_unidadconstructivamcelec,1,mcuc.totalitems,3)) AS totaluc
						FROM		(
									select	mcuc.id_unidadconstructivamcelec,
											mcuc.codigo,
											mcuc.areasub,
											mcuc.estado_reg,
											mcuc.numerobahias,
											mcuc.longitudvia,
											mcuc.id_claseaislacion,
											mcuc.descripcion,
											mcuc.id_tensionservicio,
											mcuc.usuario_ai,
											mcuc.fecha_reg,
											mcuc.id_usuario_reg,
											mcuc.id_usuario_ai,
											mcuc.fecha_mod,
											mcuc.id_usuario_mod,
											usu1.cuenta as usr_reg,
											usu2.cuenta as usr_mod,
											clas.claseaislacion as desc_claseaislacion,
											ten.tensionservicio as desc_tensionservicio,
											(select SUM(CAST(CASE
												WHEN tuci.id_ucmeitem = 1 THEN (((select cableporbahina from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion)*mcuc.numerobahias) 
												+(mcuc.areasub * (select factortorre from snx.tmcelecmallatierra where id_claseaislamiento = mcuc.id_claseaislacion))) * tuci.precio
												WHEN tuci.id_ucmeitem = 2 THEN ((mcuc.numerobahias * (select cableporbahia from snx.tmcelecapantallamiento where id_claseaislamiento = mcuc.id_claseaislacion))* tuci.precio)
												WHEN tuci.id_ucmeitem = 3 THEN (ceil(mcuc.longitudvia / 25))* tuci.precio
												WHEN tuci.id_ucmeitem = 4 THEN (mcuc.numerobahias * (select luminariaporpb from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
												WHEN tuci.id_ucmeitem = 5 THEN (mcuc.numerobahias * (select tubopvc from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
												WHEN tuci.id_ucmeitem = 6 THEN (mcuc.numerobahias * (select totalcable from snx.tmceleciluminacion where id_tensionservicio = mcuc.id_tensionservicio))* tuci.precio
												ELSE 0.0
												END AS numeric))
											from snx.tucmceitem tuci) as totalitems	
									from snx.tunidadconstructivamcelec mcuc
									inner join segu.tusuario usu1 on usu1.id_usuario = mcuc.id_usuario_reg
									left join segu.tusuario usu2 on usu2.id_usuario = mcuc.id_usuario_mod
									left join snx.tclaseaislacion clas on clas.id_claseaislacion = mcuc.id_claseaislacion
									left join snx.ttensionservicio ten on ten.id_tensionservicio = mcuc.id_tensionservicio
						) mcuc
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;		

	/*********************************    
 	#TRANSACCION:  'SNX_MCUC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:28
	***********************************/

	elsif(p_transaccion='SNX_MCUC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivamcelec)
					    from snx.tunidadconstructivamcelec mcuc
					    inner join segu.tusuario usu1 on usu1.id_usuario = mcuc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mcuc.id_usuario_mod
						left join snx.tclaseaislacion clas on clas.id_claseaislacion = mcuc.id_claseaislacion
						left join snx.ttensionservicio ten on ten.id_tensionservicio = mcuc.id_tensionservicio
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

ALTER FUNCTION snx.ft_unidadconstructivamcelec_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;