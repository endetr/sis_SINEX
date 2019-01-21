-- FUNCTION: snx.ft_mes_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_mes_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_mes_ime(
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
 FUNCION: 		snx.ft_mes_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmes'
 AUTOR: 		 (admin)
 FECHA:	        23-03-2018 14:43:22
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-03-2018 14:43:22								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmes'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_mes	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_mes_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_Mes_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-03-2018 14:43:22
	***********************************/

	if(p_transaccion='SNX_Mes_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmes(
			nombre,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.nombre,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_mes into v_id_mes;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mes almacenado(a) con exito (id_mes'||v_id_mes||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mes',v_id_mes::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_Mes_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-03-2018 14:43:22
	***********************************/

	elsif(p_transaccion='SNX_Mes_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmes set
			nombre = v_parametros.nombre,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_mes=v_parametros.id_mes;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mes modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mes',v_parametros.id_mes::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_Mes_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-03-2018 14:43:22
	***********************************/

	elsif(p_transaccion='SNX_Mes_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmes
            where id_mes=v_parametros.id_mes;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mes eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mes',v_parametros.id_mes::varchar);
              
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

ALTER FUNCTION snx.ft_mes_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;