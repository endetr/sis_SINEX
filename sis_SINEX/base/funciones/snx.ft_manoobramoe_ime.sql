-- FUNCTION: snx.ft_manoobramoe_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_manoobramoe_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_manoobramoe_ime(
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
 FUNCION: 		snx.ft_manoobramoe_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmanoobramoe'
 AUTOR: 		 (admin)
 FECHA:	        29-08-2018 18:34:29
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				29-08-2018 18:34:29								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmanoobramoe'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_manoobramoe	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_manoobramoe_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MNMOE_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:29
	***********************************/

	if(p_transaccion='SNX_MNMOE_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmanoobramoe(
			manoobramoe,
			valorunitariorcb,
			id_unidad,
			valorunitariorlp,
			valorunitariorsc,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.manoobramoe,
			v_parametros.valorunitariorcb,
			v_parametros.id_unidad,
			v_parametros.valorunitariorlp,
			v_parametros.valorunitariorsc,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_manoobramoe into v_id_manoobramoe;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mano de Obra almacenado(a) con exito (id_manoobramoe'||v_id_manoobramoe||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_manoobramoe',v_id_manoobramoe::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MNMOE_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:29
	***********************************/

	elsif(p_transaccion='SNX_MNMOE_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmanoobramoe set
			manoobramoe = v_parametros.manoobramoe,
			valorunitariorcb = v_parametros.valorunitariorcb,
			id_unidad = v_parametros.id_unidad,
			valorunitariorlp = v_parametros.valorunitariorlp,
			valorunitariorsc = v_parametros.valorunitariorsc,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_manoobramoe=v_parametros.id_manoobramoe;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mano de Obra modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_manoobramoe',v_parametros.id_manoobramoe::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MNMOE_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:29
	***********************************/

	elsif(p_transaccion='SNX_MNMOE_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmanoobramoe
            where id_manoobramoe=v_parametros.id_manoobramoe;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mano de Obra eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_manoobramoe',v_parametros.id_manoobramoe::varchar);
              
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

ALTER FUNCTION snx.ft_manoobramoe_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;