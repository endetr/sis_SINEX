-- FUNCTION: snx.ft_unidadconstructivaseraux_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaseraux_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaseraux_ime(
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
 FUNCION: 		snx.ft_unidadconstructivaseraux_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaseraux'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:42:10
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:42:10								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaseraux'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivaseraux	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivaseraux_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCSAUX_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:10
	***********************************/

	if(p_transaccion='SNX_UCSAUX_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivaseraux(
			unidadconstructivaencseraux,
			id_unidad,
			cantidadseraux,
			precio,
			estado_reg,
			unidadconstructivaseraux,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.unidadconstructivaencseraux,
			v_parametros.id_unidad,
			v_parametros.cantidadseraux,
			v_parametros.precio,
			'activo',
			v_parametros.unidadconstructivaseraux,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivaseraux into v_id_unidadconstructivaseraux;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Servicios Auxiliares almacenado(a) con exito (id_unidadconstructivaseraux'||v_id_unidadconstructivaseraux||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaseraux',v_id_unidadconstructivaseraux::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSAUX_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:10
	***********************************/

	elsif(p_transaccion='SNX_UCSAUX_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivaseraux set
			unidadconstructivaencseraux = v_parametros.unidadconstructivaencseraux,
			id_unidad = v_parametros.id_unidad,
			cantidadseraux = v_parametros.cantidadseraux,
			precio = v_parametros.precio,
			unidadconstructivaseraux = v_parametros.unidadconstructivaseraux,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivaseraux=v_parametros.id_unidadconstructivaseraux;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Servicios Auxiliares modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaseraux',v_parametros.id_unidadconstructivaseraux::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSAUX_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:10
	***********************************/

	elsif(p_transaccion='SNX_UCSAUX_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivaseraux
            where id_unidadconstructivaseraux=v_parametros.id_unidadconstructivaseraux;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Servicios Auxiliares eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaseraux',v_parametros.id_unidadconstructivaseraux::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivaseraux_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;