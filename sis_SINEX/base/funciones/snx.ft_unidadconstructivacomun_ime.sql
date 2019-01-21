-- FUNCTION: snx.ft_unidadconstructivacomun_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivacomun_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivacomun_ime(
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
 FUNCION: 		snx.ft_unidadconstructivacomun_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivacomun'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:42:28
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:42:28								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivacomun'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivacomun	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivacomun_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCCOM_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:28
	***********************************/

	if(p_transaccion='SNX_UCCOM_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivacomun(
			id_unidadconstructivaenccomun,
			id_unidad,
			precio,
			cantidadcomun,
			estado_reg,
			unidadconstructivacomun,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_unidadconstructivaenccomun,
			v_parametros.id_unidad,
			v_parametros.precio,
			v_parametros.cantidadcomun,
			'activo',
			v_parametros.unidadconstructivacomun,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivacomun into v_id_unidadconstructivacomun;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Comunicaciones almacenado(a) con exito (id_unidadconstructivacomun'||v_id_unidadconstructivacomun||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivacomun',v_id_unidadconstructivacomun::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCCOM_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:28
	***********************************/

	elsif(p_transaccion='SNX_UCCOM_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivacomun set
			id_unidadconstructivaenccomun = v_parametros.id_unidadconstructivaenccomun,
			id_unidad = v_parametros.id_unidad,
			precio = v_parametros.precio,
			cantidadcomun = v_parametros.cantidadcomun,
			unidadconstructivacomun = v_parametros.unidadconstructivacomun,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivacomun=v_parametros.id_unidadconstructivacomun;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Comunicaciones modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivacomun',v_parametros.id_unidadconstructivacomun::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCCOM_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:28
	***********************************/

	elsif(p_transaccion='SNX_UCCOM_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivacomun
            where id_unidadconstructivacomun=v_parametros.id_unidadconstructivacomun;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Comunicaciones eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivacomun',v_parametros.id_unidadconstructivacomun::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivacomun_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;