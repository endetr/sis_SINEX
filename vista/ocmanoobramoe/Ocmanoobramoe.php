<?php
/**
*@package pXP
*@file gen-Ocmanoobramoe.php
*@author  (admin)
*@date 30-08-2018 15:37:36
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ocmanoobramoe=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ocmanoobramoe.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ocmanoobramoe'
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
				name: 'id_manoobramoe',
				fieldLabel: ' Mano de Obra',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Manoobramoe/listarManoobramoe',
					id: 'id_manoobramoe',
					root: 'datos',
					sortInfo: {
						field: 'manoobramoe',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_manoobramoe', 'manoobramoe'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_manoobramoe',
				displayField: 'manoobramoe',
				gdisplayField: 'desc_manoobramoe',
				hiddenName: 'id_manoobramoe',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 50,
				queryDelay: 1000,
				anchor: '80%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_manoobramoe']);
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
				name: 'cantidadmanoobramoe',
				fieldLabel: ' Cantidad',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653,
				decimalPrecision: 5
			},
				type:'NumberField',
				filters:{pfiltro:'ocmo.cantidadmanoobramoe',type:'numeric'},
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
				filters:{pfiltro:'ocmo.estado_reg',type:'string'},
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
				name: 'usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'TextField',
				filters:{pfiltro:'ocmo.usuario_ai',type:'string'},
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
				filters:{pfiltro:'ocmo.fecha_reg',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'id_usuario_ai',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'ocmo.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'ocmo.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Mano de Obra',
	ActSave:'../../sis_SINEX/control/Ocmanoobramoe/insertarOcmanoobramoe',
	ActDel:'../../sis_SINEX/control/Ocmanoobramoe/eliminarOcmanoobramoe',
	ActList:'../../sis_SINEX/control/Ocmanoobramoe/listarOcmanoobramoe',
	id_store:'id_ocmanoobramoe',
	fields: [
		{name:'id_ocmanoobramoe', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_manoobramoe', type: 'numeric'},
		{name:'cantidadmanoobramoe', type: 'numeric'},
		{name:'id_obracivilmoe', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_manoobramoe', type: 'string'},		
		{name:'valorunitariorlpusd', type: 'numeric'},
		{name:'valorunitariorcbusd', type: 'numeric'},
		{name:'valorunitariorscusd', type: 'numeric'},
		{name:'costototalrlp', type: 'numeric'},
		{name:'costototalrcb', type: 'numeric'},
		{name:'costototalrsc', type: 'numeric'},
	],
	sortInfo:{
		field: 'id_obracivilmoe',
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
		Phx.vista.Ocmanoobramoe.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_obracivilmoe').setValue(this.maestro.id_obracivilmoe);
	},
}
)
</script>
		
		