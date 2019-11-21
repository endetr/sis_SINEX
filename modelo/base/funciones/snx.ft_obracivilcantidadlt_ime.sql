-- FUNCTION: snx.ft_obracivilcantidadlt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_obracivilcantidadlt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_obracivilcantidadlt_ime(
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
 FUNCION: 		snx.ft_obracivilcantidadlt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tobracivilcantidadlt'
 AUTOR: 		 (admin)
 FECHA:	        25-07-2018 18:42:06
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-07-2018 18:42:06								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tobracivilcantidadlt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_obracivilcantidadlt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_obracivilcantidadlt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCCLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 18:42:06
	***********************************/

	if(p_transaccion='SNX_OCCLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tobracivilcantidadlt(
			estado_reg,
			id_configuracionlt,
			id_terreno,
			cantidadobracivillt,
			id_tipolinea,
			id_tipoestructura,
			id_tipocanalizacion,
			id_tensionservicio,
			id_obracivillt,
			id_funcionestructura,
			id_tipocimentacion,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod,
			id_bancoductos,
			id_cajaempalme
          	) values(
			'activo',
			v_parametros.id_configuracionlt,
			v_parametros.id_terreno,
			v_parametros.cantidadobracivillt,
			v_parametros.id_tipolinea,
			v_parametros.id_tipoestructura,
			v_parametros.id_tipocanalizacion,
			v_parametros.id_tensionservicio,
			v_parametros.id_obracivillt,
			v_parametros.id_funcionestructura,
			v_parametros.id_tipocimentacion,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null,
			v_parametros.id_bancoductos,
			v_parametros.id_cajaempalme				
			
			
			)RETURNING id_obracivilcantidadlt into v_id_obracivilcantidadlt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cantidades Obra Civil LT almacenado(a) con exito (id_obracivilcantidadlt'||v_id_obracivilcantidadlt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilcantidadlt',v_id_obracivilcantidadlt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCCLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 18:42:06
	***********************************/

	elsif(p_transaccion='SNX_OCCLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tobracivilcantidadlt set
			id_configuracionlt = v_parametros.id_configuracionlt,
			id_terreno = v_parametros.id_terreno,
			cantidadobracivillt = v_parametros.cantidadobracivillt,
			id_tipolinea = v_parametros.id_tipolinea,
			id_tipoestructura = v_parametros.id_tipoestructura,
			id_tipocanalizacion = v_parametros.id_tipocanalizacion,
			id_tensionservicio = v_parametros.id_tensionservicio,
			id_obracivillt = v_parametros.id_obracivillt,
			id_funcionestructura = v_parametros.id_funcionestructura,
			id_tipocimentacion = v_parametros.id_tipocimentacion,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai,
			id_bancoductos = v_parametros.id_bancoductos,
			id_cajaempalme = v_parametros.id_cajaempalme
			where id_obracivilcantidadlt=v_parametros.id_obracivilcantidadlt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cantidades Obra Civil LT modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilcantidadlt',v_parametros.id_obracivilcantidadlt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCCLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 18:42:06
	***********************************/

	elsif(p_transaccion='SNX_OCCLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tobracivilcantidadlt
            where id_obracivilcantidadlt=v_parametros.id_obracivilcantidadlt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cantidades Obra Civil LT eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilcantidadlt',v_parametros.id_obracivilcantidadlt::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

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

ALTER FUNCTION snx.ft_obracivilcantidadlt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;
