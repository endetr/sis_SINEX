CREATE OR REPLACE FUNCTION "snx"."ft_bancoductos_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_bancoductos_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tbancoductos'
 AUTOR: 		 (admin)
 FECHA:	        14-02-2019 17:57:56
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				14-02-2019 17:57:56								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tbancoductos'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_bancoductos	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_bancoductos_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_BDT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:56
	***********************************/

	if(p_transaccion='SNX_BDT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tbancoductos(
			bancoductos,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.bancoductos,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_bancoductos into v_id_bancoductos;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Banco de Ductos almacenado(a) con exito (id_bancoductos'||v_id_bancoductos||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_bancoductos',v_id_bancoductos::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_BDT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:56
	***********************************/

	elsif(p_transaccion='SNX_BDT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tbancoductos set
			bancoductos = v_parametros.bancoductos,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_bancoductos=v_parametros.id_bancoductos;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Banco de Ductos modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_bancoductos',v_parametros.id_bancoductos::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_BDT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:56
	***********************************/

	elsif(p_transaccion='SNX_BDT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tbancoductos
            where id_bancoductos=v_parametros.id_bancoductos;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Banco de Ductos eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_bancoductos',v_parametros.id_bancoductos::varchar);
              
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
ALTER FUNCTION "snx"."ft_bancoductos_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
