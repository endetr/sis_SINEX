CREATE OR REPLACE FUNCTION "snx"."ft_cajaempalme_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_cajaempalme_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tcajaempalme'
 AUTOR: 		 (admin)
 FECHA:	        14-02-2019 17:57:59
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				14-02-2019 17:57:59								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tcajaempalme'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_cajaempalme	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_cajaempalme_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_CEP_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:59
	***********************************/

	if(p_transaccion='SNX_CEP_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tcajaempalme(
			cajaempalme,
			estado_reg,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.cajaempalme,
			'activo',
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_cajaempalme into v_id_cajaempalme;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cajas de Empalme almacenado(a) con exito (id_cajaempalme'||v_id_cajaempalme||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cajaempalme',v_id_cajaempalme::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CEP_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:59
	***********************************/

	elsif(p_transaccion='SNX_CEP_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tcajaempalme set
			cajaempalme = v_parametros.cajaempalme,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_cajaempalme=v_parametros.id_cajaempalme;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cajas de Empalme modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cajaempalme',v_parametros.id_cajaempalme::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CEP_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:59
	***********************************/

	elsif(p_transaccion='SNX_CEP_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tcajaempalme
            where id_cajaempalme=v_parametros.id_cajaempalme;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cajas de Empalme eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cajaempalme',v_parametros.id_cajaempalme::varchar);
              
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
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "snx"."ft_cajaempalme_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
