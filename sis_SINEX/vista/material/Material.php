<?php
/**
*@package pXP
*@file gen-Material.php
*@author  (admin)
*@date 05-07-2018 13:08:59
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Material=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Material.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_material'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'material',
				fieldLabel: 'Material',
				allowBlank: false,
				anchor: '80%',
				gwidth: 300,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'mat.material',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config:{
				name: 'peso',
				fieldLabel: 'Peso',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'mat.peso',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_unidad',
				fieldLabel: 'Unidad',
				allowBlank: false,
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
					fields: ['id_unidad', 'unidad'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_unidad',
				displayField: 'unidad',
				gdisplayField: 'desc_unidad',
				hiddenName: 'id_unidad',
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
					return String.format('{0}', record.data['desc_unidad']);
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
				name: 'valor',
				fieldLabel: 'Valor',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'equ.valor',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_factorindexacion',
				fieldLabel: 'Factor Indexación',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Listafactoresindexacion/listarListafactoresindexacion',
					id: 'id_factorindexacion',
					root: 'datos',
					sortInfo: {
						field: 'factorindexacion',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_factorindexacion', 'factorindexacion'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_factorindexacion',
				displayField: 'factorindexacion',
				gdisplayField: 'desc_factorindexacion',
				hiddenName: 'id_factorindexacion',
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
					return String.format('{0}', record.data['desc_factorindexacion']);
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
				fieldLabel: 'Ambito',
				allowBlank: false,
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
				anchor: '80%',
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
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'mat.fecha_reg',type:'date'},
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
				filters:{pfiltro:'mat.usuario_ai',type:'string'},
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
				name: 'estado_reg',
				fieldLabel: 'Estado Reg.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:10
			},
				type:'TextField',
				filters:{pfiltro:'mat.estado_reg',type:'string'},
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
				name: 'id_usuario_ai',
				fieldLabel: 'Creado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'mat.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				filters:{pfiltro:'mat.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Material',
	ActSave:'../../sis_SINEX/control/Material/insertarMaterial',
	ActDel:'../../sis_SINEX/control/Material/eliminarMaterial',
	ActList:'../../sis_SINEX/control/Material/listarMaterial',
	id_store:'id_material',
	fields: [
		{name:'id_material', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'peso', type: 'numeric'},
		{name:'id_unidad', type: 'numeric'},
		{name:'material', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_unidad', type: 'string'},
		{name:'valor', type: 'numeric'},	
		{name:'id_factorindexacion', type: 'numeric'},	
		{name:'desc_factorindexacion', type: 'string'},
		{name:'id_ambitoprecio', type: 'numeric'},
		{name:'ambitoprecio', type: 'string'},
	],
	sortInfo:{
		field: 'id_material',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	south:{
			url:'../../../sis_SINEX/vista/materialprecio/Materialprecio.php',
			title:'Material Precio',
			height:'50%',
			cls:'Materialprecio'
		}
	}
)
</script>
		
		