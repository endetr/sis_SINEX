-- FUNCTION: snx.ft_unidadconstructivaedif_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaedif_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaedif_ime(
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
 FUNCION: 		snx.ft_unidadconstructivaedif_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaedif'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 14:52:51
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 14:52:51								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaedif'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivaedif	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivaedif_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCE_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:51
	***********************************/

	if(p_transaccion='SNX_UCE_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivaedif(
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
							
			
			
			)RETURNING id_unidadconstructivaedif into v_id_unidadconstructivaedif;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Edificaciones almacenado(a) con exito (id_unidadconstructivaedif'||v_id_unidadconstructivaedif||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaedif',v_id_unidadconstructivaedif::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCE_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:51
	***********************************/

	elsif(p_transaccion='SNX_UCE_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivaedif set
			codigo = v_parametros.codigo,
			descripcion = v_parametros.descripcion,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivaedif=v_parametros.id_unidadconstructivaedif;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Edificaciones modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaedif',v_parametros.id_unidadconstructivaedif::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCE_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:51
	***********************************/
	--Reset cantidad
	elsif(p_transaccion='SNX_RESET_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucedifobracivil set cantidadobracivil = 0 from snx.tucedifobracivil obci
			inner join snx.tucedifsubgrupo sub on sub.id_ucedifsubgrupo = obci.id_ucedifsubgrupo
			inner join snx.tucedifgrupo grup on grup.id_ucedifgrupo = sub.id_ucedifgrupo
			inner join snx.tunidadconstructivaedif unid on unid.id_unidadconstructivaedif = grup.id_unidadconstructivaedif
			where unid.id_unidadconstructivaedif = v_parametros.id_unidadconstructivaedif;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Edificaciones modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaedif',v_parametros.id_unidadconstructivaedif::varchar);
               
            --Devuelve la respuesta
            return v_resp;

		end;

	elsif(p_transaccion='SNX_UCE_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucedifobracivil
            where id_ucedifsubgrupo  IN (select tucedifsubgrupo.id_ucedifsubgrupo 
										 from snx.tucedifgrupo 
										 inner join snx.tucedifsubgrupo on tucedifgrupo.id_ucedifgrupo = tucedifsubgrupo.id_ucedifgrupo
										 where tucedifgrupo.id_unidadconstructivaedif=v_parametros.id_unidadconstructivaedif);
			
			delete from snx.tucedifsubgrupo
            where id_ucedifgrupo IN (select id_ucedifgrupo from snx.tucedifgrupo where id_unidadconstructivaedif=v_parametros.id_unidadconstructivaedif);
			
			delete from snx.tucedifgrupo
            where id_unidadconstructivaedif=v_parametros.id_unidadconstructivaedif;
			
			delete from snx.tunidadconstructivaedif
            where id_unidadconstructivaedif=v_parametros.id_unidadconstructivaedif;
			
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Edificaciones eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaedif',v_parametros.id_unidadconstructivaedif::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivaedif_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;