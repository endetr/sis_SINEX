-- FUNCTION: snx.ft_mceleciluminacion_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_mceleciluminacion_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_mceleciluminacion_ime(
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
 FUNCION: 		snx.ft_mceleciluminacion_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmceleciluminacion'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:25
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:25								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmceleciluminacion'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_meleciluminacion	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_mceleciluminacion_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MCIL_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:25
	***********************************/

	if(p_transaccion='SNX_MCIL_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmceleciluminacion(
			tubopvc,
			totalcable,
			luminariaporpb,
			estado_reg,
			id_tensionservicio,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.tubopvc,
			v_parametros.totalcable,
			v_parametros.luminariaporpb,
			'activo',
			v_parametros.id_tensionservicio,
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_meleciluminacion into v_id_meleciluminacion;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Iluminación almacenado(a) con exito (id_meleciluminacion'||v_id_meleciluminacion||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_meleciluminacion',v_id_meleciluminacion::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCIL_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:25
	***********************************/

	elsif(p_transaccion='SNX_MCIL_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmceleciluminacion set
			tubopvc = v_parametros.tubopvc,
			totalcable = v_parametros.totalcable,
			luminariaporpb = v_parametros.luminariaporpb,
			id_tensionservicio = v_parametros.id_tensionservicio,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_meleciluminacion=v_parametros.id_meleciluminacion;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Iluminación modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_meleciluminacion',v_parametros.id_meleciluminacion::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCIL_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:25
	***********************************/

	elsif(p_transaccion='SNX_MCIL_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmceleciluminacion
            where id_meleciluminacion=v_parametros.id_meleciluminacion;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Iluminación eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_meleciluminacion',v_parametros.id_meleciluminacion::varchar);
              
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

ALTER FUNCTION snx.ft_mceleciluminacion_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;