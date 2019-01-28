-- FUNCTION: snx.ft_unidadconstructivaencseraux_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaencseraux_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaencseraux_ime(
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
 FUNCION: 		snx.ft_unidadconstructivaencseraux_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaencseraux'
 AUTOR: 		 (admin)
 FECHA:	        14-11-2018 20:35:13
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				14-11-2018 20:35:13								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaencseraux'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_unidadconstructivaencseraux	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivaencseraux_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCSAENC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-11-2018 20:35:13
	***********************************/

	if(p_transaccion='SNX_UCSAENC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivaencseraux(
			estado_reg,
			numerobahias,
			descripcion,
			codigo,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.numerobahias,
			v_parametros.descripcion,
			v_parametros.codigo,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING unidadconstructivaencseraux into v_unidadconstructivaencseraux;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Servicios Auxiliares almacenado(a) con exito (unidadconstructivaencseraux'||v_unidadconstructivaencseraux||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'unidadconstructivaencseraux',v_unidadconstructivaencseraux::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSAENC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-11-2018 20:35:13
	***********************************/

	elsif(p_transaccion='SNX_UCSAENC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivaencseraux set
			numerobahias = v_parametros.numerobahias,
			descripcion = v_parametros.descripcion,
			codigo = v_parametros.codigo,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where unidadconstructivaencseraux=v_parametros.unidadconstructivaencseraux;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Servicios Auxiliares modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'unidadconstructivaencseraux',v_parametros.unidadconstructivaencseraux::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSAENC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-11-2018 20:35:13
	***********************************/

	elsif(p_transaccion='SNX_UCSAENC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivaseraux
            where unidadconstructivaencseraux=v_parametros.unidadconstructivaencseraux;
			
			delete from snx.tunidadconstructivaencseraux
            where unidadconstructivaencseraux=v_parametros.unidadconstructivaencseraux;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Servicios Auxiliares eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'unidadconstructivaencseraux',v_parametros.unidadconstructivaencseraux::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivaencseraux_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;