<?php
/**
*@package pXP
*@file gen-Unidadconstructivacomun.php
*@author  (admin)
*@date 11-10-2018 19:42:28
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivacomun=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivacomun.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivacomun'
			},
			type:'Field',
			form:true 
		},
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivaenccomun'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'unidadconstructivacomun',
				fieldLabel: ' Descripción',
				allowBlank: false,
				anchor: '80%',
				gwidth: 400,
				maxLength:500
			},
				type:'TextField',
				filters:{pfiltro:'uccom.unidadconstructivacomun',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_unidad',
				fieldLabel: ' Unidad',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Unidad/listarUnidad',
					id: 'id_unidad',
					root: 'datos',
					sortInfo: {
						field: 'unidadabrev',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_unidad', 'unidadabrev'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_unidad',
				displayField: 'unidadabrev',
				gdisplayField: 'desc_unidadabrev',
				hiddenName: 'id_unidad',
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
					return String.format('{0}', record.data['desc_unidadabrev']);
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
				name: 'cantidadcomun',
				fieldLabel: ' Cantidad',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653,
				decimalPrecision: 5
			},
				type:'NumberField',
				filters:{pfiltro:'uccom.cantidadcomun',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'precio',
				fieldLabel: ' Valor Unitario',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uccom.precio',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config:{
				name: 'valortotalcomun',
				fieldLabel: 'Total',				
			},
				type:'Field',
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
				filters:{pfiltro:'uccom.estado_reg',type:'string'},
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
				filters:{pfiltro:'uccom.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'uccom.usuario_ai',type:'string'},
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
				filters:{pfiltro:'uccom.fecha_reg',type:'date'},
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
				filters:{pfiltro:'uccom.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Comunicaciones',
	ActSave:'../../sis_SINEX/control/Unidadconstructivacomun/insertarUnidadconstructivacomun',
	ActDel:'../../sis_SINEX/control/Unidadconstructivacomun/eliminarUnidadconstructivacomun',
	ActList:'../../sis_SINEX/control/Unidadconstructivacomun/listarUnidadconstructivacomun',
	id_store:'id_unidadconstructivacomun',
	fields: [
		{name:'id_unidadconstructivacomun', type: 'numeric'},
		{name:'id_unidadconstructivaenccomun', type: 'numeric'},
		{name:'id_unidad', type: 'numeric'},
		{name:'precio', type: 'numeric'},
		{name:'cantidadcomun', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'unidadconstructivacomun', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_unidadabrev', type: 'string'},		
		{name:'valortotalcomun', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_unidadconstructivacomun',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivaenccomun:this.maestro.id_unidadconstructivaenccomun};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Unidadconstructivacomun.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivaenccomun').setValue(this.maestro.id_unidadconstructivaenccomun);
	},
	
	}
)
</script>
		
		