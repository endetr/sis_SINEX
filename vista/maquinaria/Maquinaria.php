<?php
/**
*@package pXP
*@file gen-Maquinaria.php
*@author  (admin)
*@date 22-03-2018 19:06:44
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Maquinaria=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Maquinaria.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_maquinaria'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'maquinaria',
				fieldLabel: ' Maquinaria',
				allowBlank: false,
				anchor: '80%',
				gwidth: 300,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'maq.maquinaria',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config:{
				name: 'potencia',
				fieldLabel: ' Potencia',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'maq.potencia',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'peso',
				fieldLabel: ' Peso (kg)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'maq.peso',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valor',
				fieldLabel: ' Valor Maquinaria',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'valor',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valormat',
				fieldLabel: ' Valor Material',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'valormat',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
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
				name: 'id_tipopreciomaquinaria',
				fieldLabel: 'Tipo Precio',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipopreciomaquinaria/listarTipopreciomaquinaria',
					id: 'id_tipopreciomaquinaria',
					root: 'datos',
					sortInfo: {
						field: 'tipopreciomaquinaria',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipopreciomaquinaria', 'tipopreciomaquinaria'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipopreciomaquinaria',
				displayField: 'tipopreciomaquinaria',
				gdisplayField: 'tipopreciomaquinaria',
				hiddenName: 'id_tipopreciomaquinaria',
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
					return String.format('{0}', record.data['tipopreciomaquinaria']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'tpmaq.tipopreciomaquinaria',type: 'string'},
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
				filters:{pfiltro:'maq.estado_reg',type:'string'},
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
				filters:{pfiltro:'maq.usuario_ai',type:'string'},
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
				filters:{pfiltro:'maq.fecha_reg',type:'date'},
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
				filters:{pfiltro:'maq.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'maq.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Maquinaria',
	ActSave:'../../sis_SINEX/control/Maquinaria/insertarMaquinaria',
	ActDel:'../../sis_SINEX/control/Maquinaria/eliminarMaquinaria',
	ActList:'../../sis_SINEX/control/Maquinaria/listarMaquinaria',
	id_store:'id_maquinaria',
	fields: [
		{name:'id_maquinaria', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'potencia', type: 'numeric'},
		{name:'peso', type: 'numeric'},
		{name:'valor', type: 'numeric'},
		{name:'maquinaria', type: 'string'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'valormat', type: 'numeric'},
		{name:'id_factorindexacion', type: 'numeric'},
		{name:'desc_factorindexacion', type: 'string'},
		{name:'id_tipopreciomaquinaria', type: 'numeric'},
		{name:'tipopreciomaquinaria', type: 'string'},
		{name:'id_ambitoprecio', type: 'numeric'},
		{name:'ambitoprecio', type: 'string'},
	],
	sortInfo:{
		field: 'maquinaria',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[
	{
			url:'../../../sis_SINEX/vista/maquinariaprecio/Maquinariaprecio.php',
			title:'Precios',
			height:'50%',
			cls:'Maquinariaprecio'
	},
		{
		  	url:'../../../sis_SINEX/vista/maquinariamaterial/Maquinariamaterial.php',
			title:'Material',
			height:'50%',
			//width:400,
			cls:'Maquinariamaterial'
		 },
         {
         	url:'../../../sis_SINEX/vista/maquinariaobracivil/Maquinariaobracivil.php',
			title:'Obra Civil y Montaje Electromecánico',
			height:'50%',
			cls:'Maquinariaobracivil'
         }         
        ]
	}
)
</script>
		
		