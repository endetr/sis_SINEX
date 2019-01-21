-- FUNCTION: snx.ft_mcelecmallatierra_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_mcelecmallatierra_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_mcelecmallatierra_ime(
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
 FUNCION: 		snx.ft_mcelecmallatierra_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmcelecmallatierra'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:20
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:20								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmcelecmallatierra'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_mcelecmallatierra	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_mcelecmallatierra_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MCMT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:20
	***********************************/

	if(p_transaccion='SNX_MCMT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmcelecmallatierra(
			id_claseaislamiento,
			factortorre,
			cableporbahina,
			estado_reg,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_claseaislamiento,
			v_parametros.factortorre,
			v_parametros.cableporbahina,
			'activo',
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_mcelecmallatierra into v_id_mcelecmallatierra;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Malla Tierra almacenado(a) con exito (id_mcelecmallatierra'||v_id_mcelecmallatierra||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mcelecmallatierra',v_id_mcelecmallatierra::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCMT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:20
	***********************************/

	elsif(p_transaccion='SNX_MCMT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmcelecmallatierra set
			id_claseaislamiento = v_parametros.id_claseaislamiento,
			factortorre = v_parametros.factortorre,
			cableporbahina = v_parametros.cableporbahina,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_mcelecmallatierra=v_parametros.id_mcelecmallatierra;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Malla Tierra modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mcelecmallatierra',v_parametros.id_mcelecmallatierra::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCMT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:20
	***********************************/

	elsif(p_transaccion='SNX_MCMT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmcelecmallatierra
            where id_mcelecmallatierra=v_parametros.id_mcelecmallatierra;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Malla Tierra eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mcelecmallatierra',v_parametros.id_mcelecmallatierra::varchar);
              
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

ALTER FUNCTION snx.ft_mcelecmallatierra_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;