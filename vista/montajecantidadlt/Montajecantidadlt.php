<?php
/**
*@package pXP
*@file gen-Montajecantidadlt.php
*@author  (admin)
*@date 19-07-2018 14:51:24
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Montajecantidadlt=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Montajecantidadlt.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_montajecantidadlt'
			},
			type:'Field',
			form:true 
		},		
		{
			config: {
				name: 'id_tipoestructura',
				fieldLabel: 'Tipo Estructura',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipoestructura/listarTipoestructura',
					id: 'id_tipoestructura',
					root: 'datos',
					sortInfo: {
						field: 'tipoestructura',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipoestructura', 'tipoestructura'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipoestructura',
				displayField: 'tipoestructura',
				gdisplayField: 'tipoestructura',
				hiddenName: 'id_tipoestructura',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['tipoestructura']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: true,
			form: true
		},
		{
			config: {
				name: 'id_tensionservicio',
				fieldLabel: 'Tensión Servicio',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tensionservicio/listarTensionservicio',
					id: 'id_tensionservicio',
					root: 'datos',
					sortInfo: {
						field: 'tensionservicio',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tensionservicio', 'tensionservicio'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tensionservicio',
				displayField: 'tensionservicio',
				gdisplayField: 'tensionservicio',
				hiddenName: 'id_tensionservicio',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['tensionservicio']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: true,
			form: true
		},
		{
			config: {
				name: 'id_configuracionlt',
				fieldLabel: 'Configuración',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Configuracionlt/listarConfiguracionlt',
					id: 'id_configuracionlt',
					root: 'datos',
					sortInfo: {
						field: 'configuracionlt',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_configuracionlt', 'configuracionlt'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_configuracionlt',
				displayField: 'configuracionlt',
				gdisplayField: 'configuracionlt',
				hiddenName: 'id_configuracionlt',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['configuracionlt']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: true,
			form: true
		},
		{
			config: {
				name: 'id_tipolinea',
				fieldLabel: 'Tipo Línea',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipolinea/listarTipolinea',
					id: 'id_tipolinea',
					root: 'datos',
					sortInfo: {
						field: 'tipolinea',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipolinea', 'tipolinea'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipolinea',
				displayField: 'tipolinea',
				gdisplayField: 'tipolinea',
				hiddenName: 'id_tipolinea',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['tipolinea']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: true,
			form: true
		},
		{
			config:{
				name: 'cantidadmontajelt',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'montc.cantidadmontajelt',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_montajelt',
				fieldLabel: 'id_montajelt',				
			},
			type: 'Field',
			id_grupo: 0,
			form: true
		},
		{
			config:{
				name: 'estado_reg',
				fieldLabel: 'Estado Reg.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:10
			},
				type:'TextField',
				filters:{pfiltro:'montc.estado_reg',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'montc.fecha_reg',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'TextField',
				filters:{pfiltro:'montc.usuario_ai',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'usr_reg',
				fieldLabel: 'Creado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'usu1.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'id_usuario_ai',
				fieldLabel: 'Creado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'montc.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:false
		},
		{
			config:{
				name: 'usr_mod',
				fieldLabel: 'Modificado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'usu2.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'fecha_mod',
				fieldLabel: 'Fecha Modif.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'montc.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Montaje Cantidades',
	ActSave:'../../sis_SINEX/control/Montajecantidadlt/insertarMontajecantidadlt',
	ActDel:'../../sis_SINEX/control/Montajecantidadlt/eliminarMontajecantidadlt',
	ActList:'../../sis_SINEX/control/Montajecantidadlt/listarMontajecantidadlt',
	id_store:'id_montajecantidadlt',
	fields: [
		{name:'id_montajecantidadlt', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'cantidadmontajelt', type: 'numeric'},
		{name:'id_tipoestructura', type: 'numeric'},
		{name:'id_tensionservicio', type: 'numeric'},
		{name:'id_configuracionlt', type: 'numeric'},
		{name:'id_tipolinea', type: 'numeric'},
		{name:'id_montajelt', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},		
		{name:'tipoestructura', type: 'string'},
		{name:'tensionservicio', type: 'string'},
		{name:'configuracionlt', type: 'string'},
		{name:'tipolinea', type: 'string'},
		
	],
	sortInfo:{
		field: 'id_montajecantidadlt',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_montajelt:this.maestro.id_montajelt};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Montajecantidadlt.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_montajelt').setValue(this.maestro.id_montajelt);
	},
	
	}
)
</script>
		
		