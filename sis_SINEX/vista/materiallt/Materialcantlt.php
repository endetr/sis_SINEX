<?php
/**
*@package pXP
*@file gen-Materialcantlt.php
*@author  (admin)
*@date 19-07-2018 14:36:34
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Materialcantlt=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Materialcantlt.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivalt'
			},
			type:'Field',
			form:true 
		},
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_item'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'grupo',
				fieldLabel: 'Grupo',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'Field',
				filters:{pfiltro:'mtlt.grupo',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'item',
				fieldLabel: 'Item',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'Field',
				filters:{pfiltro:'mtlt.item',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'unidadabrev',
				fieldLabel: 'Unidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'Field',
				filters:{pfiltro:'mtlt.unidadabrev',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config: {
				name: 'id_puestatierra',
				fieldLabel: 'Sistema Puesta a Tierra',
				allowBlank: false,
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
				gdisplayField: 'puestatierra',
				hiddenName: 'id_puestatierra',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 16,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['puestatierra']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: false,
			form: true
		},
		{
			config: {
				name: 'id_aislador',
				fieldLabel: 'Aislador',
				allowBlank: false,
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
				gdisplayField: 'aislador',
				hiddenName: 'id_aislador',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 16,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['aislador']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: false,
			form: true
		},	
		{
			config:{
				name: 'cantidaditem',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'mtlt.cantidaditem',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'costounitarioext',
				fieldLabel: 'Costo Unitario Extr (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'costounitarioext',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costounitarinac',
				fieldLabel: 'Costo Unitario Nac (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'costounitarinac',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costototalext',
				fieldLabel: 'Costo Total Ext (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'costototalext',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costototalnac',
				fieldLabel: 'Costo Total Nac (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'costototalnac',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'costototalsumi',
				fieldLabel: 'Costo Total Sumi (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'costototalsumi',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'pesounitarioext',
				fieldLabel: 'Peso Unitario Ext (Ton)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'pesounitarioext',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'pesototalext',
				fieldLabel: 'Peso Total Ext (Ton)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'pesototalext',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'pesounitarionac',
				fieldLabel: 'Peso Unitario Nac (Ton)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'pesounitarionac',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'pesototalnac',
				fieldLabel: 'Peso Total Nac (Ton)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'pesototalnac',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Material LT',
	ActSave:'../../sis_SINEX/control/Materiallt/modificarMaterialcantlt',
	ActList:'../../sis_SINEX/control/Materiallt/listarMaterialcantlt',
	id_store:'id_materiallt',
	fields: [
		{name:'id_unidadconstructivalt', type: 'numeric'},
		{name:'id_grupo', type: 'numeric'},
		{name:'grupo', type: 'string'},
		{name:'id_item', type: 'numeric'},
		{name:'item', type: 'string'},
		{name:'id_unidad', type: 'numeric'},
		{name:'unidadabrev', type: 'string'},
		{name:'cantidaditem', type: 'numeric'},
		{name:'costounitarioext', type: 'numeric'},		
		{name:'costounitarinac', type: 'numeric'},
		{name:'costototalext', type: 'numeric'},
		{name:'costototalnac', type: 'numeric'},	
		{name:'costototalsumi', type: 'numeric'},
		{name:'pesounitarioext', type: 'numeric'},
		{name:'pesototalext', type: 'numeric'},
		{name:'pesounitarionac', type: 'numeric'},
		{name:'pesototalnac', type: 'numeric'},
		{name:'id_puestatierra', type: 'numeric'},
		{name:'puestatierra', type: 'string'},
		{name:'id_aislador', type: 'numeric'},
		{name:'aislador', type: 'string'},
	],
	sortInfo:{
		field: 'id_materiallt',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,		
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivalt:this.maestro.id_unidadconstructivalt};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Materialcantlt.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivalt').setValue(this.maestro.id_unidadconstructivalt);
	},
	}
)
</script>
		
		