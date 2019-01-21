-- FUNCTION: snx.ft_unidadconstructivalt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivalt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivalt_sel(
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
 FUNCION: 		snx.ft_unidadconstructivalt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivalt'
 AUTOR: 		 (admin)
 FECHA:	        03-08-2018 15:44:56
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				03-08-2018 15:44:56								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivalt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivalt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 15:44:56
	***********************************/

	if(p_transaccion='SNX_UCLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						uclt.id_unidadconstructivalt,
						uclt.estructurapasocantidad,
						uclt.id_clasificacionaltura,
						uclt.porcmterrenosumer,						
						uclt.id_tensionservicio,
						uclt.descripcion,
						uclt.id_tipolinea,
						uclt.porcterrenoplano,
						uclt.porcmterrenofirme,
						uclt.id_hilosguarda,						
						uclt.porcmterrenoterrenoblando,
						uclt.id_tipoestructura,
						uclt.estado_reg,
						uclt.porcterrenoondulado,
						uclt.conductorfase,
						uclt.distanciatransporte,
						uclt.distanciatransporteext,
						uclt.porcmterrenointerme,
						uclt.porcvegetabosque,
						uclt.porcvegetaforestacion,
						uclt.estructurapasopeso,
						uclt.estructuraamarrepeso,
						uclt.estructuraamarrecantidad,
						uclt.porcterrenocerros,
						uclt.id_pararrayolinea,
						uclt.id_configuracionlt,
						uclt.porcvegetamatorral,
						uclt.codigo,
						uclt.porcvegetamaleza,
						uclt.id_tipoconductor,
						uclt.id_usuario_ai,
						uclt.id_usuario_reg,
						uclt.usuario_ai,
						uclt.fecha_reg,
						uclt.id_usuario_mod,
						uclt.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						par.pararrayolinea as desc_pararrayolinea,
						tipl.tipolinea as desc_tipolinea,
						tens.tensionservicio as desc_tensionservicio,
						tipes.tipoestructura as desc_tipoestructura,
						CAST(CONCAT(tipcon.tipoconductor,'' ('',tens.tensionservicio,'')'') as varchar) as desc_tipoconductor,
						conflt.configuracionlt as desc_configuracionlt,
						clasal.valoraltura as desc_valoraltura,
						uclt.longitud,
						uclt.id_nivelcontaminacionlt,
						nic.nivelcontaminacionlt as desc_nivelcontaminacionlt,
						uclt.id_areaprotegida,
						arp.areaprotegida as desc_areaprotegida,
						valores.numddp, 
						valores.nummontaje, 
						valores.numoc, 
						valores.numingenieria, 						
						valores.numadmeje, 
						valores.numsupero, 
						valores.numcfinan, 
						valores.numcaamb, 
						valores.numcapred, 
						valores.numcostototaluc,
						uclt.id_revista,
						rev.revista as desc_revista,
						hil.hilosguarda as desc_hilosguarda,
						CAST(uclt.codigo || '' - '' || uclt.descripcion as varchar) AS descripcionfull
						from snx.tunidadconstructivalt uclt
						inner join segu.tusuario usu1 on usu1.id_usuario = uclt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uclt.id_usuario_mod
						left join snx.tpararrayatolinea par on par.id_pararrayolinea = uclt.id_pararrayolinea
						left join snx.ttipolinea tipl on tipl.id_tipolinea = uclt.id_tipolinea
						left join snx.ttensionservicio tens on tens.id_tensionservicio = uclt.id_tensionservicio
				        left join snx.ttipoestructura tipes on tipes.id_tipoestructura = uclt.id_tipoestructura
					    left join snx.ttipoconductor tipcon on tipcon.id_tipoconductor = uclt.id_tipoconductor
						left join snx.tconfiguracionlt conflt on conflt.id_configuracionlt = uclt.id_configuracionlt
						left join snx.tclasificacionaltura clasal on clasal.id_clasificacionaltura = uclt.id_clasificacionaltura
				        left join snx.tnivelcontaminacionlt nic on uclt.id_nivelcontaminacionlt = nic.id_nivelcontaminacionlt
					    left join snx.tareaprotegida arp on uclt.id_areaprotegida = arp.id_areaprotegida
						left join snx.calcularvaloresuclt(uclt.id_unidadconstructivalt) valores ON uclt.id_unidadconstructivalt = valores.id_unidadconstructivalt
					    left join snx.trevista rev on uclt.id_revista = rev.id_revista
						left join snx.thilosguarda hil on uclt.id_hilosguarda = hil.id_hilosguarda
					   where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 15:44:56
	***********************************/
	
	elseif(p_transaccion='SNX_UCLT_SELDDL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						uclt.id_unidadconstructivalt,
						uclt.estructurapasocantidad,
						uclt.id_clasificacionaltura,
						uclt.porcmterrenosumer,						
						uclt.id_tensionservicio,
						uclt.descripcion,
						uclt.id_tipolinea,
						uclt.porcterrenoplano,
						uclt.porcmterrenofirme,
						uclt.id_hilosguarda,						
						uclt.porcmterrenoterrenoblando,
						uclt.id_tipoestructura,
						uclt.estado_reg,
						uclt.porcterrenoondulado,
						uclt.conductorfase,
						uclt.distanciatransporte,
						uclt.distanciatransporteext,
						uclt.porcmterrenointerme,
						uclt.porcvegetabosque,
						uclt.porcvegetaforestacion,
						uclt.estructurapasopeso,
						uclt.estructuraamarrepeso,
						uclt.estructuraamarrecantidad,
						uclt.porcterrenocerros,
						uclt.id_pararrayolinea,
						uclt.id_configuracionlt,
						uclt.porcvegetamatorral,
						uclt.codigo,
						uclt.porcvegetamaleza,
						uclt.id_tipoconductor,
						uclt.id_usuario_ai,
						uclt.id_usuario_reg,
						uclt.usuario_ai,
						uclt.fecha_reg,
						uclt.id_usuario_mod,
						uclt.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						par.pararrayolinea as desc_pararrayolinea,
						tipl.tipolinea as desc_tipolinea,
						tens.tensionservicio as desc_tensionservicio,
						tipes.tipoestructura as desc_tipoestructura,
						CAST(CONCAT(tipcon.tipoconductor,'' ('',tens.tensionservicio,'')'') as varchar) as desc_tipoconductor,
						conflt.configuracionlt as desc_configuracionlt,
						clasal.valoraltura as desc_valoraltura,
						uclt.longitud,
						uclt.id_nivelcontaminacionlt,
						nic.nivelcontaminacionlt as desc_nivelcontaminacionlt,
						uclt.id_areaprotegida,
						arp.areaprotegida as desc_areaprotegida,
						0.0 AS numddp, 
						0.0 AS nummontaje, 
						0.0 AS numoc, 
						0.0 AS numingenieria, 						
						0.0 AS numadmeje, 
						0.0 AS numsupero, 
						0.0 AS numcfinan, 
						0.0 AS numcaamb, 
						0.0 AS numcapred, 
						0.0 AS numcostototaluc,
						uclt.id_revista,
						rev.revista as desc_revista,
						hil.hilosguarda as desc_hilosguarda,
						CAST(uclt.codigo || '' - '' || uclt.descripcion as varchar) AS descripcionfull
						from snx.tunidadconstructivalt uclt
						inner join segu.tusuario usu1 on usu1.id_usuario = uclt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uclt.id_usuario_mod
						left join snx.tpararrayatolinea par on par.id_pararrayolinea = uclt.id_pararrayolinea
						left join snx.ttipolinea tipl on tipl.id_tipolinea = uclt.id_tipolinea
						left join snx.ttensionservicio tens on tens.id_tensionservicio = uclt.id_tensionservicio
				        left join snx.ttipoestructura tipes on tipes.id_tipoestructura = uclt.id_tipoestructura
					    left join snx.ttipoconductor tipcon on tipcon.id_tipoconductor = uclt.id_tipoconductor
						left join snx.tconfiguracionlt conflt on conflt.id_configuracionlt = uclt.id_configuracionlt
						left join snx.tclasificacionaltura clasal on clasal.id_clasificacionaltura = uclt.id_clasificacionaltura
				        left join snx.tnivelcontaminacionlt nic on uclt.id_nivelcontaminacionlt = nic.id_nivelcontaminacionlt
					    left join snx.tareaprotegida arp on uclt.id_areaprotegida = arp.id_areaprotegida						
					    left join snx.trevista rev on uclt.id_revista = rev.id_revista
						left join snx.thilosguarda hil on uclt.id_hilosguarda = hil.id_hilosguarda
					   where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	elsif(p_transaccion='SNX_UCLT_CONT' OR p_transaccion='SNX_UCLT_CONTDDL')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(uclt.id_unidadconstructivalt)
					    from snx.tunidadconstructivalt uclt
					    inner join segu.tusuario usu1 on usu1.id_usuario = uclt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uclt.id_usuario_mod		
						left join snx.tpararrayatolinea par on par.id_pararrayolinea = uclt.id_pararrayolinea
						left join snx.ttipolinea tipl on tipl.id_tipolinea = uclt.id_tipolinea
						left join snx.ttensionservicio tens on tens.id_tensionservicio = uclt.id_tensionservicio
				        left join snx.ttipoestructura tipes on tipes.id_tipoestructura = uclt.id_tipoestructura
					    left join snx.ttipoconductor tipcon on tipcon.id_tipoconductor = uclt.id_tipoconductor
						left join snx.tconfiguracionlt conflt on conflt.id_configuracionlt = uclt.id_configuracionlt
						left join snx.tclasificacionaltura clasal on clasal.id_clasificacionaltura = uclt.id_clasificacionaltura
					    left join snx.trevista rev on uclt.id_revista = rev.id_revista
						left join snx.thilosguarda hil on uclt.id_hilosguarda = hil.id_hilosguarda
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

ALTER FUNCTION snx.ft_unidadconstructivalt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;