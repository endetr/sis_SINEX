<?php
/**
*@package pXP
*@file gen-Materialcantidadlt.php
*@author  (admin)
*@date 19-07-2018 14:36:49
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Materialcantidadlt=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Materialcantidadlt.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_materialcantidadlt'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				name: 'id_tipoconductor',
				fieldLabel: 'Tipo Conductor',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipoconductor/listarTipoconductor',
					id: 'id_tipoconductor',
					root: 'datos',
					sortInfo: {
						field: 'tipoconductor',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipoconductor', 'tipoconductor'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipoconductor',
				displayField: 'tipoconductor',
				gdisplayField: 'desc_tipoconductor',
				hiddenName: 'id_tipoconductor',
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
					return String.format('{0}', record.data['desc_tipoconductor']);
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
				fieldLabel: 'Configuracion',
				allowBlank: false,
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
				gdisplayField: 'desc_configuracionlt',
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
					return String.format('{0}', record.data['desc_configuracionlt']);
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
				name: 'id_tipoestructura',
				fieldLabel: 'Tipo Estructura',
				allowBlank: false,
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
				gdisplayField: 'desc_tipoestructura',
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
					return String.format('{0}', record.data['desc_tipoestructura']);
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
				fieldLabel: 'Tension Servicio',
				allowBlank: false,
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
				gdisplayField: 'desc_tensionservicio',
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
					return String.format('{0}', record.data['desc_tensionservicio']);
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
				name: 'id_funcionestructura',
				fieldLabel: 'Funcion de la Estructura',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Funcionestructura/listarFuncionestructura',
					id: 'id_funcionestructura',
					root: 'datos',
					sortInfo: {
						field: 'funcionestructura',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_funcionestructura', 'funcionestructura'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_funcionestructura',
				displayField: 'funcionestructura',
				gdisplayField: 'desc_funcionestructura',
				hiddenName: 'id_funcionestructura',
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
					return String.format('{0}', record.data['desc_funcionestructura']);
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
				name: 'id_puestatierra',
				fieldLabel: 'Sistema de puesta a tierra',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Spuestatierra/listarSpuestatierra',
					id: 'id_puestatierra',
					root: 'datos',
					sortInfo: {
						field: 'puestatierra',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_puestatierra', 'puestatierra'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_puestatierra',
				displayField: 'puestatierra',
				gdisplayField: 'desc_puestatierra',
				hiddenName: 'id_puestatierra',
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
					return String.format('{0}', record.data['desc_puestatierra']);
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
				name: 'id_aislador',
				fieldLabel: 'Tipo aislador',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Aislador/listarAislador',
					id: 'id_aislador',
					root: 'datos',
					sortInfo: {
						field: 'aislador',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_aislador', 'aislador'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_aislador',
				displayField: 'aislador',
				gdisplayField: 'desc_tipoaislador',
				hiddenName: 'id_aislador',
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
					return String.format('{0}', record.data['desc_tipoaislador']);
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
				fieldLabel: 'Cantidad Montaje',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650,
				decimalPrecision: 5,
			},
				type:'NumberField',
				filters:{pfiltro:'mtclt.cantidadmontajelt',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_hilosguarda',
				fieldLabel: 'Hilos Guarda(un)',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Hilosguarda/listarHilosguarda',
					id: 'id_hilosguarda',
					root: 'datos',
					sortInfo: {
						field: 'id_hilosguarda',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_hilosguarda', 'hilosguarda'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_hilosguarda',
				displayField: 'hilosguarda',
				gdisplayField: 'desc_hilosguarda',
				hiddenName: 'id_hilosguarda',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '80%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_hilosguarda']);
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
				inputType:'hidden',
				name: 'id_materiallt',
				fieldLabel: 'id_materiallt',
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
				filters:{pfiltro:'mtclt.estado_reg',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'id_usuario_ai',
				fieldLabel: '',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'mtclt.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				filters:{pfiltro:'mtclt.fecha_reg',type:'date'},
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
				filters:{pfiltro:'mtclt.usuario_ai',type:'string'},
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
				name: 'fecha_mod',
				fieldLabel: 'Fecha Modif.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'mtclt.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
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
		}
	],
	tam_pag:50,	
	title:'Material Cantidad LT',
	ActSave:'../../sis_SINEX/control/Materialcantidadlt/insertarMaterialcantidadlt',
	ActDel:'../../sis_SINEX/control/Materialcantidadlt/eliminarMaterialcantidadlt',
	ActList:'../../sis_SINEX/control/Materialcantidadlt/listarMaterialcantidadlt',
	id_store:'id_materialcantidadlt',
	fields: [
		{name:'id_materialcantidadlt', type: 'numeric'},
		{name:'cantidadmontajelt', type: 'numeric'},
		{name:'id_materiallt', type: 'numeric'},
		{name:'id_hilosguarda', type: 'numeric'},
		{name:'id_tipoconductor', type: 'numeric'},
		{name:'id_configuracionlt', type: 'numeric'},
		{name:'id_tipoestructura', type: 'numeric'},
		{name:'id_tensionservicio', type: 'numeric'},
		{name:'id_funcionestructura', type: 'numeric'},
		{name:'id_aislador', type: 'numeric'},
		{name:'id_puestatierra', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_tipoconductor', type: 'string'},
		{name:'desc_configuracionlt', type: 'string'},
		{name:'desc_tipoestructura', type: 'string'},		
		{name:'desc_tensionservicio', type: 'string'},		
		{name:'desc_funcionestructura', type: 'string'},
		{name:'desc_puestatierra', type: 'string'},		
		{name:'desc_tipoaislador', type: 'string'},
		{name:'desc_hilosguarda', type: 'string'},
		
	],
	sortInfo:{
		field: 'id_materialcantidadlt',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_materiallt:this.maestro.id_materiallt
			};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Materialcantidadlt.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_materiallt').setValue(this.maestro.id_materiallt);
	},
	}
)
</script>
		
		