-- FUNCTION: snx.ft_pararrayatolinea_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_pararrayatolinea_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_pararrayatolinea_ime(
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
 FUNCION: 		snx.ft_pararrayatolinea_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tpararrayatolinea'
 AUTOR: 		 (admin)
 FECHA:	        07-05-2018 19:37:48
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				07-05-2018 19:37:48								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tpararrayatolinea'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_pararrayolinea	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_pararrayatolinea_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_PRL_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:48
	***********************************/

	if(p_transaccion='SNX_PRL_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tpararrayatolinea(
			estado_reg,
			pararrayolinea,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.pararrayolinea,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_pararrayolinea into v_id_pararrayolinea;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Pararrayo linea almacenado(a) con exito (id_pararrayolinea'||v_id_pararrayolinea||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pararrayolinea',v_id_pararrayolinea::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PRL_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:48
	***********************************/

	elsif(p_transaccion='SNX_PRL_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tpararrayatolinea set
			pararrayolinea = v_parametros.pararrayolinea,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_pararrayolinea=v_parametros.id_pararrayolinea;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Pararrayo linea modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pararrayolinea',v_parametros.id_pararrayolinea::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PRL_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:48
	***********************************/

	elsif(p_transaccion='SNX_PRL_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tpararrayatolinea
            where id_pararrayolinea=v_parametros.id_pararrayolinea;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Pararrayo linea eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pararrayolinea',v_parametros.id_pararrayolinea::varchar);
              
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

ALTER FUNCTION snx.ft_pararrayatolinea_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;