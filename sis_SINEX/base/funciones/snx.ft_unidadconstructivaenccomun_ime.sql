-- FUNCTION: snx.ft_unidadconstructivaenccomun_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaenccomun_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaenccomun_ime(
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
 FUNCION: 		snx.ft_unidadconstructivaenccomun_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaenccomun'
 AUTOR: 		 (admin)
 FECHA:	        15-11-2018 12:59:55
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				15-11-2018 12:59:55								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaenccomun'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivaenccomun	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivaenccomun_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCCMENC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 12:59:55
	***********************************/

	if(p_transaccion='SNX_UCCMENC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivaenccomun(
			codigo,
			estado_reg,
			numerobahias,
			descripcion,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.codigo,
			'activo',
			v_parametros.numerobahias,
			v_parametros.descripcion,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivaenccomun into v_id_unidadconstructivaenccomun;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Comunicaciones almacenado(a) con exito (id_unidadconstructivaenccomun'||v_id_unidadconstructivaenccomun||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaenccomun',v_id_unidadconstructivaenccomun::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCCMENC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 12:59:55
	***********************************/

	elsif(p_transaccion='SNX_UCCMENC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivaenccomun set
			codigo = v_parametros.codigo,
			numerobahias = v_parametros.numerobahias,
			descripcion = v_parametros.descripcion,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivaenccomun=v_parametros.id_unidadconstructivaenccomun;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Comunicaciones modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaenccomun',v_parametros.id_unidadconstructivaenccomun::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCCMENC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 12:59:55
	***********************************/

	elsif(p_transaccion='SNX_UCCMENC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivacomun
            where id_unidadconstructivaenccomun=v_parametros.id_unidadconstructivaenccomun;
			
			delete from snx.tunidadconstructivaenccomun
            where id_unidadconstructivaenccomun=v_parametros.id_unidadconstructivaenccomun;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Comunicaciones eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaenccomun',v_parametros.id_unidadconstructivaenccomun::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivaenccomun_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;