-- FUNCTION: snx.ft_materialprecio_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materialprecio_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materialprecio_ime(
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
 FUNCION: 		snx.ft_materialprecio_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterialprecio'
 AUTOR: 		 (admin)
 FECHA:	        05-07-2018 13:09:03
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-07-2018 13:09:03								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterialprecio'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_materialprecio	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_materialprecio_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MATPRE_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 13:09:03
	***********************************/

	if(p_transaccion='SNX_MATPRE_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaterialprecio(
			fechaprecio,
			proyecto,
			id_moneda,
			estado_reg,
			valormaterial,
			id_material,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.fechaprecio,
			v_parametros.proyecto,
			v_parametros.id_moneda,
			'activo',
			v_parametros.valormaterial,
			v_parametros.id_material,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_materialprecio into v_id_materialprecio;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Precio almacenado(a) con exito (id_materialprecio'||v_id_materialprecio||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialprecio',v_id_materialprecio::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MATPRE_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 13:09:03
	***********************************/

	elsif(p_transaccion='SNX_MATPRE_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaterialprecio set
			fechaprecio = v_parametros.fechaprecio,
			proyecto = v_parametros.proyecto,
			id_moneda = v_parametros.id_moneda,
			valormaterial = v_parametros.valormaterial,
			id_material = v_parametros.id_material,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_materialprecio=v_parametros.id_materialprecio;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Precio modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialprecio',v_parametros.id_materialprecio::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MATPRE_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 13:09:03
	***********************************/

	elsif(p_transaccion='SNX_MATPRE_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmaterialprecio
            where id_materialprecio=v_parametros.id_materialprecio;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Precio eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialprecio',v_parametros.id_materialprecio::varchar);
              
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

ALTER FUNCTION snx.ft_materialprecio_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;