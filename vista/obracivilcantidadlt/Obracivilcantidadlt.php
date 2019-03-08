<?php
/**
*@package pXP
*@file gen-Obracivilcantidadlt.php
*@author  (admin)
*@date 25-07-2018 18:42:06
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Obracivilcantidadlt=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Obracivilcantidadlt.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_obracivilcantidadlt'
			},
			type:'Field',
			form:true 
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
				name: 'id_tipocimentacion',
				fieldLabel: 'Tipo Cimentación',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipocimentacion/listarTipocimentacion',
					id: 'id_tipocimentacion',
					root: 'datos',
					sortInfo: {
						field: 'tipocimentacion',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipocimentacion', 'tipocimentacion'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipocimentacion',
				displayField: 'tipocimentacion',
				gdisplayField: 'tipocimentacion',
				hiddenName: 'id_tipocimentacion',
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
					return String.format('{0}', record.data['tipocimentacion']);
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
				name: 'id_funcionestructura',
				fieldLabel: 'Función Estructura',
				allowBlank: true,
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
				gdisplayField: 'funcionestructura',
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
					return String.format('{0}', record.data['funcionestructura']);
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
				name: 'id_terreno',
				fieldLabel: 'Terreno',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Terrenolt/listarTerrenolt',
					id: 'id_terrenolt',
					root: 'datos',
					sortInfo: {
						field: 'terrenolt',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_terrenolt', 'terrenolt'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_terrenolt',
				displayField: 'terrenolt',
				gdisplayField: 'terrenolt',
				hiddenName: 'id_terrenolt',
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
					return String.format('{0}', record.data['terrenolt']);
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
				name: 'id_tipocanalizacion',
				fieldLabel: 'Tipo Canalización',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipocanalizacion/listarTipocanalizacion',
					id: 'id_tipocanalizacion',
					root: 'datos',
					sortInfo: {
						field: 'tipocanalizacion',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipocanalizacion', 'tipocanalizacion', 'codigo'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipocanalizacion',
				displayField: 'tipocanalizacion',
				gdisplayField: 'tipocanalizacion',
				hiddenName: 'id_tipocanalizacion',
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
					return String.format('{0}', record.data['tipocanalizacion']);
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
				name: 'id_bancoductos',
				fieldLabel: 'Banco de Ductos',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Bancoductos/listarBancoductos',
					id: 'id_bancoductos',
					root: 'datos',
					sortInfo: {
						field: 'bancoductos',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_bancoductos', 'bancoductos'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_bancoductos',
				displayField: 'bancoductos',
				gdisplayField: 'bancoductos',
				hiddenName: 'id_bancoductos',
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
					return String.format('{0}', record.data['bancoductos']);
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
				name: 'id_cajaempalme',
				fieldLabel: 'Caja de Empalme',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Cajaempalme/listarCajaempalme',
					id: 'id_cajaempalme',
					root: 'datos',
					sortInfo: {
						field: 'cajaempalme',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_cajaempalme', 'cajaempalme'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_cajaempalme',
				displayField: 'cajaempalme',
				gdisplayField: 'cajaempalme',
				hiddenName: 'id_cajaempalme',
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
					return String.format('{0}', record.data['cajaempalme']);
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
				name: 'cantidadobracivillt',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652,
				decimalPrecision: 5,
			},
				type:'NumberField',
				filters:{pfiltro:'occlt.cantidadobracivillt',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_obracivillt',
				fieldLabel: 'id_obracivillt',				
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
				filters:{pfiltro:'occlt.estado_reg',type:'string'},
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
				filters:{pfiltro:'occlt.usuario_ai',type:'string'},
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
				filters:{pfiltro:'occlt.fecha_reg',type:'date'},
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
				filters:{pfiltro:'occlt.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'occlt.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Cantidades Obra Civil LT',
	ActSave:'../../sis_SINEX/control/Obracivilcantidadlt/insertarObracivilcantidadlt',
	ActDel:'../../sis_SINEX/control/Obracivilcantidadlt/eliminarObracivilcantidadlt',
	ActList:'../../sis_SINEX/control/Obracivilcantidadlt/listarObracivilcantidadlt',
	id_store:'id_obracivilcantidadlt',
	fields: [
		{name:'id_obracivilcantidadlt', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_configuracionlt', type: 'numeric'},
		{name:'id_terreno', type: 'numeric'},
		{name:'cantidadobracivillt', type: 'numeric'},
		{name:'id_tipolinea', type: 'numeric'},
		{name:'id_tipoestructura', type: 'numeric'},
		{name:'id_tipocanalizacion', type: 'numeric'},
		{name:'id_tensionservicio', type: 'numeric'},
		{name:'id_obracivillt', type: 'numeric'},
		{name:'id_funcionestructura', type: 'numeric'},
		{name:'id_tipocimentacion', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},		
		{name:'tipolinea', type: 'string'},
		{name:'tensionservicio', type: 'string'},
		{name:'tipoestructura', type: 'string'},
		{name:'configuracionlt', type: 'string'},
		{name:'funcionestructura', type: 'string'},
		{name:'desc_terreno', type: 'string'},
		{name:'tipocimentacion', type: 'string'},
		{name:'tipocanalizacion', type: 'string'},
		{name:'id_bancoductos', type: 'numeric'},
		{name:'bancoductos', type: 'string'},
		{name:'id_cajaempalme', type: 'numeric'},
		{name:'cajaempalme', type: 'string'},
	],
	sortInfo:{
		field: 'id_obracivilcantidadlt',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_obracivillt:this.maestro.id_obracivillt};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Obracivilcantidadlt.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_obracivillt').setValue(this.maestro.id_obracivillt);
	},
	
	}
)
</script>
		
		