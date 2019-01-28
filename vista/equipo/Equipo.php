<?php
/**
*@package pXP
*@file gen-Equipo.php
*@author  (admin)
*@date 22-03-2018 12:58:05
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Equipo=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Equipo.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_equipo'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'equipo',
				fieldLabel: ' Equipo',
				allowBlank: false,
				anchor: '80%',
				gwidth: 300,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'equ.equipo',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_claseaislacion',
				fieldLabel: ' Clase de Aislación',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Claseaislacion/listarClaseaislacion',
					id: 'id_claseaislacion',
					root: 'datos',
					sortInfo: {
						field: 'claseaislacion',
						direction: 'DESC'
					},
					totalProperty: 'total',
					fields: ['id_claseaislacion', 'claseaislacion'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_claseaislacion',
				displayField: 'claseaislacion',
				gdisplayField: 'desc_claseaislacion',
				hiddenName: 'id_claseaislacion',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '80%',
				gwidth: 100,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_claseaislacion']);
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
				fieldLabel: 'Valor Equipo',
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
			config:{
				name: 'valormat',
				fieldLabel: 'Valor Material',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'valormat',type:'numeric'},
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
				name: 'estado_reg',
				fieldLabel: 'Estado Reg.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:10
			},
				type:'TextField',
				filters:{pfiltro:'equ.estado_reg',type:'string'},
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
				filters:{pfiltro:'equ.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				name: 'usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'TextField',
				filters:{pfiltro:'equ.usuario_ai',type:'string'},
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
				filters:{pfiltro:'equ.fecha_reg',type:'date'},
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
				filters:{pfiltro:'equ.fecha_mod',type:'date'},
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
	title:'Equipo',
	ActSave:'../../sis_SINEX/control/Equipo/insertarEquipo',
	ActDel:'../../sis_SINEX/control/Equipo/eliminarEquipo',
	ActList:'../../sis_SINEX/control/Equipo/listarEquipo',
	id_store:'id_equipo',
	fields: [
		{name:'id_equipo', type: 'numeric'},
		{name:'equipo', type: 'string'},
		{name:'id_claseaislacion', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_claseaislacion', type: 'string'},
		{name:'valor', type: 'numeric'},
		{name:'valormat', type: 'numeric'},
		{name:'id_factorindexacion', type: 'numeric'},
		{name:'desc_factorindexacion', type: 'string'},
		{name:'id_ambitoprecio', type: 'numeric'},
		{name:'ambitoprecio', type: 'string'},
		
	],
	sortInfo:{
		field: 'equipo',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[
	{
			url:'../../../sis_SINEX/vista/equipoprecio/Equipoprecio.php',
			title:'Precios',
			height:'35%',
			cls:'Equipoprecio'
	},
		{
		  	url:'../../../sis_SINEX/vista/equipomaterial/Equipomaterial.php',
			title:'Material',
			//width:400,
			height:'50%',
			cls:'Equipomaterial'
		 },
         {
          	url:'../../../sis_SINEX/vista/equipoobracivil/Equipoobracivil.php',
			title:'Obra Civil y Montaje Electromecánico',
			//width:400,
			height:'50%',
			cls:'Equipoobracivil'
         }          
        ]
	}
)
</script>
		
		