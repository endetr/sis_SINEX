-- FUNCTION: snx.ft_ucltvaloraruc_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucltvaloraruc_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucltvaloraruc_ime(
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
 FUNCION: 		snx.ft_ucltvaloraruc_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucltvaloraruc'
 AUTOR: 		 (admin)
 FECHA:	        01-11-2018 15:13:41
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				01-11-2018 15:13:41								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucltvaloraruc'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucltvaloraruc	integer;
	id_tipolineaint integer;
	id_tensionservicioint integer;
BEGIN

    v_nombre_funcion = 'snx.ft_ucltvaloraruc_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_VUCLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		01-11-2018 15:13:41
	***********************************/

	if(p_transaccion='SNX_VUCLT_INS')then					
        begin			
			
			
        	insert into snx.tucltvaloraruc(
				id_ucltvalorar,
				id_tipolinea,
				id_tensionservicio,
				descripcion,
				numoc,
				numingenieria,
				codigo,
				numadmeje,
				numcostototaluc,
				id_unidadconstructivalt,
				numcapred,
				numddp,
				estado_reg,
				numsupero,
				longitud,
				nummontaje,
				numcaamb,
				numcfinan,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod,
				desc_tipoconductor,
				distanciatransporte,
				distanciatransporteext,
				conductorfase,
				desc_configuracionlt,
				desc_hilosguarda,
				desc_valoraltura,
				desc_revista,
				desc_pararrayolinea,			
				estructurapasocantidad,
				estructurapasopeso,
				estructuraamarrecantidad,
				estructuraamarrepeso,
				porcmterrenofirme,	
				porcmterrenointerme,
				porcmterrenoterrenoblando,	
				porcmterrenosumer,									
				porcvegetamaleza,
				porcvegetamatorral,
				porcvegetaforestacion,
				porcvegetabosque,			
				porcterrenoplano,
				porcterrenoondulado,
				porcterrenocerros,			
				desc_areaprotegida,
				desc_tipoestructura,
				desc_nivelcontaminacionlt
          	) 
			SELECT		v_parametros.id_ucltvalorar,
						uclt.id_tipolinea, 
						uclt.id_tensionservicio,
						uclt.descripcion,
						valores.numoc,
						valores.numingenieria,
						uclt.codigo,
						valores.numadmeje,
						valores.numcostototaluc,
						v_parametros.id_unidadconstructivalt,
						valores.numcapred,
						valores.numddp,
						'activo',
						valores.numsupero,
						v_parametros.longitud,
						valores.nummontaje,
						valores.numcaamb,
						valores.numcfinan,
						v_parametros._id_usuario_ai,
						now(),
						v_parametros._nombre_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						null AS id_usuario_mod,
						null AS fecha_mod,
						CAST(CONCAT(tipcon.tipoconductor,' (',tens.tensionservicio,')') as varchar) as desc_tipoconductor,
						uclt.distanciatransporte,
						uclt.distanciatransporteext,
						uclt.conductorfase,
						conflt.configuracionlt as desc_configuracionlt,
						hil.hilosguarda as desc_hilosguarda,
						clasal.valoraltura as desc_valoraltura,
						rev.revista as desc_revista,
						par.pararrayolinea as desc_pararrayolinea,			
						uclt.estructurapasocantidad,
						uclt.estructurapasopeso,
						uclt.estructuraamarrecantidad,
						uclt.estructuraamarrepeso,
						uclt.porcmterrenofirme,	
						uclt.porcmterrenointerme,
						uclt.porcmterrenoterrenoblando,	
						uclt.porcmterrenosumer,									
						uclt.porcvegetamaleza,
						uclt.porcvegetamatorral,
						uclt.porcvegetaforestacion,
						uclt.porcvegetabosque,			
						uclt.porcterrenoplano,
						uclt.porcterrenoondulado,
						uclt.porcterrenocerros,			
						arp.areaprotegida as desc_areaprotegida,						
						tipes.tipoestructura as desc_tipoestructura,
						nic.nivelcontaminacionlt as desc_nivelcontaminacionlt
			FROM		snx.tunidadconstructivalt uclt
			left join 	snx.tpararrayatolinea par on par.id_pararrayolinea = uclt.id_pararrayolinea
			left join 	snx.ttipolinea tipl on tipl.id_tipolinea = uclt.id_tipolinea
			left join 	snx.ttensionservicio tens on tens.id_tensionservicio = uclt.id_tensionservicio
			left join 	snx.ttipoestructura tipes on tipes.id_tipoestructura = uclt.id_tipoestructura
			left join 	snx.ttipoconductor tipcon on tipcon.id_tipoconductor = uclt.id_tipoconductor
			left join 	snx.tconfiguracionlt conflt on conflt.id_configuracionlt = uclt.id_configuracionlt
			left join 	snx.tclasificacionaltura clasal on clasal.id_clasificacionaltura = uclt.id_clasificacionaltura
			left join 	snx.tnivelcontaminacionlt nic on uclt.id_nivelcontaminacionlt = nic.id_nivelcontaminacionlt
			left join 	snx.tareaprotegida arp on uclt.id_areaprotegida = arp.id_areaprotegida
			left join 	snx.trevista rev on uclt.id_revista = rev.id_revista
			left join 	snx.thilosguarda hil on uclt.id_hilosguarda = hil.id_hilosguarda
			left join 	snx.calcularvaloresuclt(v_parametros.id_unidadconstructivalt) valores ON uclt.id_unidadconstructivalt = valores.id_unidadconstructivalt
			WHERE		uclt.id_unidadconstructivalt = v_parametros.id_unidadconstructivalt
			RETURNING id_ucltvaloraruc into v_id_ucltvaloraruc;
			
			--Llenar Equipo y Maquinaria
			INSERT INTO snx.tucltvalorarucem
			(
				id_ucltvaloraruc,
				id_grupo,
				grupo,
				id_item,
				item,
				unidadabrev,
				cantidaditem,
				costounitarioext,
				costounitarionac,
				pesounitarioext,
				pesounitarionac,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT	v_id_ucltvaloraruc AS id_ucltvaloraruc,
					ucem.id_grupo,
					ucem.grupo,
					ucem.id_item,
					ucem.item,
					ucem.unidadabrev,
					ucem.cantidaditem,
					ucem.costounitarioext,
					ucem.costounitarinac AS costounitarionac,
					ucem.pesounitarioext,
					ucem.pesounitarionac,
					'activo' AS estado_reg,
					v_parametros._id_usuario_ai,
					now(),
					v_parametros._nombre_usuario_ai,
					p_id_usuario AS id_usuario_reg,
					null AS id_usuario_mod,
					null AS fecha_mod
			FROM	snx.obteneruclteqmate(v_parametros.id_unidadconstructivalt) AS ucem;
			
			--Llenar Obra Civil
			INSERT INTO snx.tucltvalorarucoc
			(
				id_ucltvaloraruc,
				terrenolt,
				funcionestructura,
				tipocimentacion,
				cantidaditem,
				costounitariooc,
				pesounitariooc,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT		v_id_ucltvaloraruc AS id_ucltvaloraruc,
						ucoc.terrenolt,
						ucoc.funcionestructura,
						ucoc.tipocimentacion,
						ucoc.cantidaditem,
						ucoc.cosotunitariooc AS costounitariooc,
						ucoc.pesounitariooc,
						'activo' AS estado_reg,
						v_parametros._id_usuario_ai,
						now(),
						v_parametros._nombre_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						null AS id_usuario_mod,
						null AS fecha_mod
			FROM		snx.tunidadconstructivalt uclt
			INNER JOIN	snx.obtenerucltobracivil(v_parametros.id_unidadconstructivalt, uclt.id_revista) AS ucoc ON uclt.id_unidadconstructivalt = ucoc.id_unidadconstructivalt
			WHERE		uclt.id_unidadconstructivalt = v_parametros.id_unidadconstructivalt;
			
			--Llenar montaje
			INSERT INTO	snx.tucltvalorarucmon
			(
				id_ucltvaloraruc,
				id_grupo,
				grupo,
				id_item,
				item,
				unidadabrev,
				cantidaditem,
				costounitario,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT	v_id_ucltvaloraruc AS id_ucltvaloraruc,
					ucmon.id_grupo,
					ucmon.grupo,
					ucmon.id_item,
					ucmon.item,
					ucmon.unidadabrev,
					ucmon.cantidaditem,
					ucmon.costounitari AS costounitario,
					'activo' AS estado_reg,
					v_parametros._id_usuario_ai,
					now(),
					v_parametros._nombre_usuario_ai,
					p_id_usuario AS id_usuario_reg,
					null AS id_usuario_mod,
					null AS fecha_mod
			FROM	snx.obtenerucltmontaje(v_parametros.id_unidadconstructivalt) AS ucmon;
			
			--Llenar Gastos Contratista
			INSERT INTO snx.tucltvalorarucgc
			(
				id_ucltvaloraruc,
				id_descripcion,
				descripcion,
				unidad,
				costobase,
				cantidaditem,
				costototal,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT	v_id_ucltvaloraruc AS id_ucltvaloraruc,
					ucgc.id_descripcion,
					ucgc.descripcion,
					ucgc.unidad,
					ucgc.costobase,
					ucgc.cantidaditem,
					ucgc.costototal,
					'activo' AS estado_reg,
					v_parametros._id_usuario_ai,
					now(),
					v_parametros._nombre_usuario_ai,
					p_id_usuario AS id_usuario_reg,
					null AS id_usuario_mod,
					null AS fecha_mod
			FROM	snx.obtenerucltgcontra(v_parametros.id_unidadconstructivalt) AS ucgc;
			
			--Llenar Otros Gastos y Resumen General
			INSERT INTO snx.tucltvalorarucogrg
			(
				id_ucltvaloraruc,
				id_descripcion,
				descripcion,
				unidad,
				costobase,
				cantidaditem,
				costototal,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT	v_id_ucltvaloraruc AS id_ucltvaloraruc,
					ucogrg.id_descripcion,
					ucogrg.descripcion,
					ucogrg.unidad,
					ucogrg.costobase,
					ucogrg.cantidaditem,
					ucogrg.costototal,
					'activo' AS estado_reg,
					v_parametros._id_usuario_ai,
					now(),
					v_parametros._nombre_usuario_ai,
					p_id_usuario AS id_usuario_reg,
					null AS id_usuario_mod,
					null AS fecha_mod
			FROM	snx.obtenerucltotrosgastos(v_parametros.id_unidadconstructivalt) AS ucogrg;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidades Constructivas almacenado(a) con exito (id_ucltvaloraruc'||v_id_ucltvaloraruc||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucltvaloraruc',v_id_ucltvaloraruc::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_VUCLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		01-11-2018 15:13:41
	***********************************/

	elsif(p_transaccion='SNX_VUCLT_MOD')then

		begin
			--Se limpia
			DELETE FROM snx.tucltvalorarucem WHERE id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			DELETE FROM snx.tucltvalorarucoc WHERE id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			DELETE FROM snx.tucltvalorarucmon WHERE id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			DELETE FROM snx.tucltvalorarucgc WHERE id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			DELETE FROM snx.tucltvalorarucogrg WHERE id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			
			--Sentencia de la modificacion
			update 	snx.tucltvaloraruc 
			set		id_ucltvalorar = v_parametros.id_ucltvalorar,
					id_tipolinea = uclt.id_tipolinea,
					id_tensionservicio = uclt.id_tensionservicio,
					descripcion = uclt.descripcion,
					numoc = uclt.numoc,
					numingenieria = uclt.numingenieria,
					codigo = uclt.codigo,
					numadmeje = uclt.numadmeje,
					numcostototaluc = uclt.numcostototaluc,
					numcapred = uclt.numcapred,
					numddp = uclt.numddp,
					numsupero = uclt.numsupero,
					longitud = v_parametros.longitud,
					nummontaje = uclt.nummontaje,
					numcaamb = uclt.numcaamb,
					numcfinan = uclt.numcfinan,
					id_usuario_mod = p_id_usuario,
					fecha_mod = now(),
					id_usuario_ai = v_parametros._id_usuario_ai,
					usuario_ai = v_parametros._nombre_usuario_ai,
					desc_tipoconductor = uclt.desc_tipoconductor,
					distanciatransporte = uclt.distanciatransporte,
					distanciatransporteext = uclt.distanciatransporteext,
					conductorfase = uclt.conductorfase,
					desc_configuracionlt = uclt.desc_configuracionlt,
					desc_hilosguarda = uclt.desc_hilosguarda,
					desc_valoraltura = uclt.desc_valoraltura,
					desc_revista = uclt.desc_revista,
					desc_pararrayolinea = uclt.desc_pararrayolinea,
					estructurapasocantidad = uclt.estructurapasocantidad,
					estructurapasopeso = uclt.estructurapasopeso,
					estructuraamarrecantidad = uclt.estructuraamarrecantidad,
					estructuraamarrepeso = uclt.estructuraamarrepeso,
					porcmterrenofirme = uclt.porcmterrenofirme,
					porcmterrenointerme = uclt.porcmterrenointerme,
					porcmterrenoterrenoblando = uclt.porcmterrenoterrenoblando,
					porcmterrenosumer = uclt.porcmterrenosumer,
					porcvegetamaleza = uclt.porcvegetamaleza,
					porcvegetamatorral = uclt.porcvegetamatorral,
					porcvegetaforestacion = uclt.porcvegetaforestacion,
					porcvegetabosque = uclt.porcvegetabosque,
					porcterrenoplano = uclt.porcterrenoplano,
					porcterrenoondulado = uclt.porcterrenoondulado,
					porcterrenocerros = uclt.porcterrenocerros,
					desc_areaprotegida = uclt.desc_areaprotegida,
					desc_tipoestructura = uclt.desc_tipoestructura,
					desc_nivelcontaminacionlt = uclt.desc_nivelcontaminacionlt
			FROM	(
					select 		uclt.id_unidadconstructivalt,
								uclt.codigo,
								uclt.descripcion,
								uclt.id_tipolinea,
								tipl.tipolinea as desc_tipolinea,
								uclt.id_tensionservicio,
								tens.tensionservicio as desc_tensionservicio,
								CAST(CONCAT(tipcon.tipoconductor,' (',tens.tensionservicio,')') as varchar) as desc_tipoconductor,
								uclt.distanciatransporte,
								uclt.distanciatransporteext,
								uclt.conductorfase,
								conflt.configuracionlt as desc_configuracionlt,
								hil.hilosguarda as desc_hilosguarda,
								clasal.valoraltura as desc_valoraltura,
								rev.revista as desc_revista,
								par.pararrayolinea as desc_pararrayolinea,			
								uclt.estructurapasocantidad,
								uclt.estructurapasopeso,
								uclt.estructuraamarrecantidad,
								uclt.estructuraamarrepeso,
								uclt.porcmterrenofirme,	
								uclt.porcmterrenointerme,
								uclt.porcmterrenoterrenoblando,	
								uclt.porcmterrenosumer,									
								uclt.porcvegetamaleza,
								uclt.porcvegetamatorral,
								uclt.porcvegetaforestacion,
								uclt.porcvegetabosque,			
								uclt.porcterrenoplano,
								uclt.porcterrenoondulado,
								uclt.porcterrenocerros,			
								arp.areaprotegida as desc_areaprotegida,
								uclt.longitud,
								tipes.tipoestructura as desc_tipoestructura,
								nic.nivelcontaminacionlt as desc_nivelcontaminacionlt,
								valores.numddp, 
								valores.nummontaje, 
								valores.numoc, 
								valores.numingenieria, 								
								valores.numadmeje, 
								valores.numsupero, 
								valores.numcfinan, 
								valores.numcaamb, 
								valores.numcapred, 
								valores.numcostototaluc
					from 		snx.tunidadconstructivalt uclt
					left join 	snx.tpararrayatolinea par on par.id_pararrayolinea = uclt.id_pararrayolinea
					left join 	snx.ttipolinea tipl on tipl.id_tipolinea = uclt.id_tipolinea
					left join 	snx.ttensionservicio tens on tens.id_tensionservicio = uclt.id_tensionservicio
					left join 	snx.ttipoestructura tipes on tipes.id_tipoestructura = uclt.id_tipoestructura
					left join 	snx.ttipoconductor tipcon on tipcon.id_tipoconductor = uclt.id_tipoconductor
					left join 	snx.tconfiguracionlt conflt on conflt.id_configuracionlt = uclt.id_configuracionlt
					left join 	snx.tclasificacionaltura clasal on clasal.id_clasificacionaltura = uclt.id_clasificacionaltura
					left join 	snx.tnivelcontaminacionlt nic on uclt.id_nivelcontaminacionlt = nic.id_nivelcontaminacionlt
					left join 	snx.tareaprotegida arp on uclt.id_areaprotegida = arp.id_areaprotegida
					left join 	snx.calcularvaloresuclt(uclt.id_unidadconstructivalt) valores ON uclt.id_unidadconstructivalt = valores.id_unidadconstructivalt
					left join 	snx.trevista rev on uclt.id_revista = rev.id_revista
					left join 	snx.thilosguarda hil on uclt.id_hilosguarda = hil.id_hilosguarda
					WHERE		uclt.id_unidadconstructivalt = v_parametros.id_unidadconstructivalt
					) uclt			
			where 	tucltvaloraruc.id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			
			--Llenar Equipo y Maquinaria
			INSERT INTO snx.tucltvalorarucem
			(
				id_ucltvaloraruc,
				id_grupo,
				grupo,
				id_item,
				item,
				unidadabrev,
				cantidaditem,
				costounitarioext,
				costounitarionac,
				pesounitarioext,
				pesounitarionac,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT	v_parametros.id_ucltvaloraruc AS id_ucltvaloraruc,
					ucem.id_grupo,
					ucem.grupo,
					ucem.id_item,
					ucem.item,
					ucem.unidadabrev,
					ucem.cantidaditem,
					ucem.costounitarioext,
					ucem.costounitarinac AS costounitarionac,
					ucem.pesounitarioext,
					ucem.pesounitarionac,
					'activo' AS estado_reg,
					v_parametros._id_usuario_ai,
					now(),
					v_parametros._nombre_usuario_ai,
					p_id_usuario AS id_usuario_reg,
					null AS id_usuario_mod,
					null AS fecha_mod
			FROM	snx.obteneruclteqmate(v_parametros.id_unidadconstructivalt) AS ucem;
			
			--Llenar Obra Civil
			INSERT INTO snx.tucltvalorarucoc
			(
				id_ucltvaloraruc,
				terrenolt,
				funcionestructura,
				tipocimentacion,
				cantidaditem,
				costounitariooc,
				pesounitariooc,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT		v_parametros.id_ucltvaloraruc AS id_ucltvaloraruc,
						ucoc.terrenolt,
						ucoc.funcionestructura,
						ucoc.tipocimentacion,
						ucoc.cantidaditem,
						ucoc.cosotunitariooc AS costounitariooc,
						ucoc.pesounitariooc,
						'activo' AS estado_reg,
						v_parametros._id_usuario_ai,
						now(),
						v_parametros._nombre_usuario_ai,
						p_id_usuario AS id_usuario_reg,
						null AS id_usuario_mod,
						null AS fecha_mod
			FROM		snx.tunidadconstructivalt uclt
			INNER JOIN	snx.obtenerucltobracivil(v_parametros.id_unidadconstructivalt, uclt.id_revista) AS ucoc ON uclt.id_unidadconstructivalt = ucoc.id_unidadconstructivalt
			WHERE		uclt.id_unidadconstructivalt = v_parametros.id_unidadconstructivalt;
			
			--Llenar montaje
			INSERT INTO	snx.tucltvalorarucmon
			(
				id_ucltvaloraruc,
				id_grupo,
				grupo,
				id_item,
				item,
				unidadabrev,
				cantidaditem,
				costounitario,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT	v_parametros.id_ucltvaloraruc AS id_ucltvaloraruc,
					ucmon.id_grupo,
					ucmon.grupo,
					ucmon.id_item,
					ucmon.item,
					ucmon.unidadabrev,
					ucmon.cantidaditem,
					ucmon.costounitari AS costounitario,
					'activo' AS estado_reg,
					v_parametros._id_usuario_ai,
					now(),
					v_parametros._nombre_usuario_ai,
					p_id_usuario AS id_usuario_reg,
					null AS id_usuario_mod,
					null AS fecha_mod
			FROM	snx.obtenerucltmontaje(v_parametros.id_unidadconstructivalt) AS ucmon;
			
			--Llenar Gastos Contratista
			INSERT INTO snx.tucltvalorarucgc
			(
				id_ucltvaloraruc,
				id_descripcion,
				descripcion,
				unidad,
				costobase,
				cantidaditem,
				costototal,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT	v_parametros.id_ucltvaloraruc AS id_ucltvaloraruc,
					ucgc.id_descripcion,
					ucgc.descripcion,
					ucgc.unidad,
					ucgc.costobase,
					ucgc.cantidaditem,
					ucgc.costototal,
					'activo' AS estado_reg,
					v_parametros._id_usuario_ai,
					now(),
					v_parametros._nombre_usuario_ai,
					p_id_usuario AS id_usuario_reg,
					null AS id_usuario_mod,
					null AS fecha_mod
			FROM	snx.obtenerucltgcontra(v_parametros.id_unidadconstructivalt) AS ucgc;
			
			--Llenar Otros Gastos y Resumen General
			INSERT INTO snx.tucltvalorarucogrg
			(
				id_ucltvaloraruc,
				id_descripcion,
				descripcion,
				unidad,
				costobase,
				cantidaditem,
				costototal,
				estado_reg,
				id_usuario_ai,
				fecha_reg,
				usuario_ai,
				id_usuario_reg,
				id_usuario_mod,
				fecha_mod
			)
			SELECT	v_parametros.id_ucltvaloraruc AS id_ucltvaloraruc,
					ucogrg.id_descripcion,
					ucogrg.descripcion,
					ucogrg.unidad,
					ucogrg.costobase,
					ucogrg.cantidaditem,
					ucogrg.costototal,
					'activo' AS estado_reg,
					v_parametros._id_usuario_ai,
					now(),
					v_parametros._nombre_usuario_ai,
					p_id_usuario AS id_usuario_reg,
					null AS id_usuario_mod,
					null AS fecha_mod
			FROM	snx.obtenerucltotrosgastos(v_parametros.id_unidadconstructivalt) AS ucogrg;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidades Constructivas modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucltvaloraruc',v_parametros.id_ucltvaloraruc::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_VUCLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		01-11-2018 15:13:41
	***********************************/

	elsif(p_transaccion='SNX_VUCLT_ELI')then

		begin
			--Eliminar Equipo y maquinaria
			delete from snx.tucltvalorarucem
            where id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			
			--Eliminar obra civil
			delete from snx.tucltvalorarucoc
            where id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			
			--Eliminar montaje
			delete from snx.tucltvalorarucmon
            where id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			
			--Eliminar gasto contratista
			delete from snx.tucltvalorarucgc
            where id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			
			--Eliminar otros gastos y resumne
			delete from snx.tucltvalorarucogrg
            where id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;
			
			--Sentencia de la eliminacion
			delete from snx.tucltvaloraruc
            where id_ucltvaloraruc=v_parametros.id_ucltvaloraruc;		
			
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidades Constructivas eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucltvaloraruc',v_parametros.id_ucltvaloraruc::varchar);
              
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

ALTER FUNCTION snx.ft_ucltvaloraruc_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;