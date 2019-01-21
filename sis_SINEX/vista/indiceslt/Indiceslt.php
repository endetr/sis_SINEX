<?php
/**
*@package pXP
*@file gen-Indiceslt.php
*@author  (admin)
*@date 23-07-2018 15:53:45
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Indiceslt=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Indiceslt.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_indicelt'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'indicelt',
				fieldLabel: 'Índice',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'indlt.indicelt',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_unidad',
				fieldLabel: 'Unidad',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Unidad/listarUnidad',
					id: 'id_unidad',
					root: 'datos',
					sortInfo: {
						field: 'unidad',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_unidad', 'unidadabrev'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_unidad',
				displayField: 'unidadabrev',
				gdisplayField: 'unidadabrev',
				hiddenName: 'id_unidad',
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
					return String.format('{0}', record.data['unidadabrev']);
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
				name: 'id_indicetipo',
				fieldLabel: 'Tipo',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Indicetipo/listarIndicetipo',
					id: 'id_indicetipo',
					root: 'datos',
					sortInfo: {
						field: 'indicetipo',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_indicetipo', 'indicetipo'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_indicetipo',
				displayField: 'indicetipo',
				gdisplayField: 'indicetipo',
				hiddenName: 'id_indicetipo',
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
					return String.format('{0}', record.data['indicetipo']);
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
				name: 'id_ambitoprecio',
				fieldLabel: 'Ámbito',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Ambitoprecio/listarAmbitoprecio',
					id: 'id_ambitoprecio',
					root: 'datos',
					sortInfo: {
						field: 'ambitoprecio',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_ambitoprecio', 'ambitoprecio'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_ambitoprecio',
				displayField: 'ambitoprecio',
				gdisplayField: 'ambitoprecio',
				hiddenName: 'id_ambitoprecio',
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
					return String.format('{0}', record.data['ambitoprecio']);
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
				name: 'valorindice',
				fieldLabel: 'Valor Índice',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650,
				decimalPrecision: 5,
				renderer:  Ext.util.Format.numberRenderer('0,000.00000')
			},
				type:'NumberField',
				filters:{pfiltro:'indlt.valorindice',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
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
				filters:{pfiltro:'indlt.estado_reg',type:'string'},
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
				filters:{pfiltro:'indlt.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				filters:{pfiltro:'indlt.usuario_ai',type:'string'},
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
				filters:{pfiltro:'indlt.fecha_reg',type:'date'},
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
				filters:{pfiltro:'indlt.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Índices Lineas',
	ActSave:'../../sis_SINEX/control/Indiceslt/insertarIndiceslt',
	ActDel:'../../sis_SINEX/control/Indiceslt/eliminarIndiceslt',
	ActList:'../../sis_SINEX/control/Indiceslt/listarIndiceslt',
	id_store:'id_indicelt',
	fields: [
		{name:'id_indicelt', type: 'numeric'},
		{name:'id_indicetipo', type: 'numeric'},
		{name:'id_ambitoprecio', type: 'numeric'},
		{name:'id_unidad', type: 'numeric'},
		{name:'valorindice', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'indicelt', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'ambitoprecio', type: 'string'},
		{name:'indicetipo', type: 'string'},
		{name:'unidadabrev', type: 'string'},
		
	],
	sortInfo:{
		field: 'id_indicelt',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true
	}
)
</script>
		
		