CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivamo_ime(p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$

/**************************************************************************
 SISTEMA:		SINEX
 FUNCION: 		snx.ft_unidadconstructivamo_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivamo'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 15:39:11
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 15:39:11								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivamo'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivamo	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivamo_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UNCONMO_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 15:39:11
	***********************************/

	if(p_transaccion='SNX_UNCONMO_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivamo(
			codigo,
			descripcion,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.codigo,
			v_parametros.descripcion,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivamo into v_id_unidadconstructivamo;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Módulo Común almacenado(a) con exito (id_unidadconstructivamo'||v_id_unidadconstructivamo||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivamo',v_id_unidadconstructivamo::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UNCONMO_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 15:39:11
	***********************************/

	elsif(p_transaccion='SNX_UNCONMO_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivamo set
			codigo = v_parametros.codigo,
			descripcion = v_parametros.descripcion,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivamo=v_parametros.id_unidadconstructivamo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Módulo Común modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivamo',v_parametros.id_unidadconstructivamo::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;
		
		--Reset cantidad
	elsif(p_transaccion='SNX_RESET_MOD')then

		begin
			--Sentencia de la modificacion
			update 		snx.tucmoobracivil 
			set 		cantidadobra = 0
			from 		snx.tucmogrupo grup
			inner join 	snx.tunidadconstructivamo unid on unid.id_unidadconstructivamo = grup.id_unidadconstructivamo
			where 		tucmoobracivil.id_ucmogrupo = grup.id_ucmogrupo and 
						unid.id_unidadconstructivamo = v_parametros.id_unidadconstructivamo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Edificaciones modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivamo',v_parametros.id_unidadconstructivamo::varchar);
               
            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UNCONMO_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 15:39:11
	***********************************/

	elsif(p_transaccion='SNX_UNCONMO_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucmoobracivil
            where id_ucmogrupo IN (SELECT id_ucmogrupo from snx.tucmogrupo where id_unidadconstructivamo=v_parametros.id_unidadconstructivamo);
			
			delete from snx.tucmogrupo
            where id_unidadconstructivamo=v_parametros.id_unidadconstructivamo;
			
			delete from snx.tunidadconstructivamo
            where id_unidadconstructivamo=v_parametros.id_unidadconstructivamo;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Módulo Común eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivamo',v_parametros.id_unidadconstructivamo::varchar);
              
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

$function$
;
