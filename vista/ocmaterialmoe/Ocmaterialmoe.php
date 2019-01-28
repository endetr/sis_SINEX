<?php
/**
*@package pXP
*@file gen-Ocmaterialmoe.php
*@author  (admin)
*@date 30-08-2018 15:37:04
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ocmaterialmoe=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ocmaterialmoe.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ocmaterialmoe'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_obracivilmoe',
				fieldLabel: 'id_obracivilmoe',				
					},					
			type: 'Field',
			id_obracivilmoe: 0,			
			form: true
		},	
		{
			config: {
				name: 'id_materialmoe',
				fieldLabel: ' Material',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Materialmoe/listarMaterialmoe',
					id: 'id_materialmoe',
					root: 'datos',
					sortInfo: {
						field: 'materialmoe',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_materialmoe', 'materialmoe'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_materialmoe',
				displayField: 'materialmoe',
				gdisplayField: 'desc_materialmoe',
				hiddenName: 'id_materialmoe',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 50,
				queryDelay: 1000,
				anchor: '80%',
				gwidth: 400,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_materialmoe']);
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
				name: 'cantidadmaterialmoe',
				fieldLabel: ' Cantidad',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653,
				decimalPrecision: 5,
				renderer:  Ext.util.Format.numberRenderer('0,000.00000')
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.cantidadmaterialmoe',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config:{
				name: 'valorunitariorlpusd',
				fieldLabel: 'Valor Unitario Revista la Paz (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.valorunitariorlpusd',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'valorunitariorcbusd',
				fieldLabel: 'Valor Unitario Revista Cochabamba (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.valorunitariorcbusd',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'valorunitariorscusd',
				fieldLabel: 'Valor Unitario Revista Santa Cruz (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.valorunitariorscusd',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costototalrlp',
				fieldLabel: 'Costo Total Revista la Paz (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.costototalrlp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costototalrcb',
				fieldLabel: 'Costo Total Revista Cochabamba (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.costototalrcb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costototalrsc',
				fieldLabel: 'Costo Total Revista Santa Cruz (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.costototalrsc',type:'numeric'},
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
				filters:{pfiltro:'ocm.estado_reg',type:'string'},
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
				filters:{pfiltro:'ocm.fecha_reg',type:'date'},
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
				filters:{pfiltro:'ocm.usuario_ai',type:'string'},
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
				filters:{pfiltro:'ocm.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'ocm.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Materiales',
	ActSave:'../../sis_SINEX/control/Ocmaterialmoe/insertarOcmaterialmoe',
	ActDel:'../../sis_SINEX/control/Ocmaterialmoe/eliminarOcmaterialmoe',
	ActList:'../../sis_SINEX/control/Ocmaterialmoe/listarOcmaterialmoe',
	id_store:'id_ocmaterialmoe',
	fields: [
		{name:'id_ocmaterialmoe', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'cantidadmaterialmoe', type: 'numeric'},
		{name:'id_materialmoe', type: 'numeric'},
		{name:'id_obracivilmoe', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_materialmoe', type: 'string'},		
		{name:'valorunitariorlpusd', type: 'numeric'},
		{name:'valorunitariorcbusd', type: 'numeric'},
		{name:'valorunitariorscusd', type: 'numeric'},		
		{name:'costototalrlp', type: 'numeric'},
		{name:'costototalrcb', type: 'numeric'},
		{name:'costototalrsc', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_ocmaterialmoe',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_obracivilmoe:this.maestro.id_obracivilmoe};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Ocmaterialmoe.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_obracivilmoe').setValue(this.maestro.id_obracivilmoe);
	},
	
	}
)
</script>
		
		