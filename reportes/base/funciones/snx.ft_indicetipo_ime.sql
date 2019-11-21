-- FUNCTION: snx.ft_indicetipo_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_indicetipo_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_indicetipo_ime(
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
 FUNCION: 		snx.ft_indicetipo_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tindicetipo'
 AUTOR: 		 (admin)
 FECHA:	        23-07-2018 15:53:42
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-07-2018 15:53:42								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tindicetipo'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_Id_indicetipo	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_indicetipo_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_INDT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:42
	***********************************/

	if(p_transaccion='SNX_INDT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tindicetipo(
			indicetipo,
			estado_reg,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.indicetipo,
			'activo',
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_indicetipo into v_id_indicetipo;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipos de Índices almacenado(a) con exito (id_indicetipo'||v_id_indicetipo||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_indicetipo',v_Id_indicetipo::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_INDT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:42
	***********************************/

	elsif(p_transaccion='SNX_INDT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tindicetipo set
			indicetipo = v_parametros.indicetipo,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_indicetipo=v_parametros.id_indicetipo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipos de Índices modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_indicetipo',v_parametros.id_indicetipo::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_INDT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:42
	***********************************/

	elsif(p_transaccion='SNX_INDT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tindicetipo
            where id_indicetipo=v_parametros.id_indicetipo;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipos de Índices eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_indicetipo',v_parametros.id_indicetipo::varchar);
              
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

ALTER FUNCTION snx.ft_indicetipo_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;