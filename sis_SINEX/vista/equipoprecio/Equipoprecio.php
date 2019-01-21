<?php
/**
*@package pXP
*@file gen-Equipoprecio.php
*@author  (admin)
*@date 22-03-2018 12:58:10
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Equipoprecio=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Equipoprecio.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_equipoprecio'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_equipo',
				fieldLabel: 'id_equipo',				
					},					
			type: 'Field',
			id_grupo: 0,			
			form: true
		},		
		{
			config:{
				name: 'proyecto',
				fieldLabel: ' Proyecto',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'epr.proyecto',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config: {
				name: 'id_moneda',
				fieldLabel: ' Moneda',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Moneda/listarMoneda',
					id: 'id_moneda',
					root: 'datos',
					sortInfo: {
						field: 'moneda',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_moneda', 'moneda'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_moneda',
				displayField: 'moneda',
				gdisplayField: 'desc_moneda',
				hiddenName: 'id_moneda',
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
					return String.format('{0}', record.data['desc_moneda']);
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
				name: 'valorequipo',
				fieldLabel: 'Valor Equipo',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'epr.valorequipo',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'fechaprecio',
				fieldLabel: ' Fecha Precio',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y'):''}							
			},
				type:'DateField',
				filters:{pfiltro:'epr.fechaprecio',type:'date'},
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
				filters:{pfiltro:'epr.estado_reg',type:'string'},
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
				filters:{pfiltro:'epr.usuario_ai',type:'string'},
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
				filters:{pfiltro:'epr.fecha_reg',type:'date'},
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
				filters:{pfiltro:'epr.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'epr.fecha_mod',type:'date'},
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
	title:'Equipo Precio ',
	ActSave:'../../sis_SINEX/control/Equipoprecio/insertarEquipoprecio',
	ActDel:'../../sis_SINEX/control/Equipoprecio/eliminarEquipoprecio',
	ActList:'../../sis_SINEX/control/Equipoprecio/listarEquipoprecio',
	id_store:'id_equipoprecio',
	fields: [
		{name:'id_equipoprecio', type: 'numeric'},
		{name:'id_equipo', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'valorequipo', type: 'numeric'},
		{name:'id_moneda', type: 'numeric'},
		{name:'proyecto', type: 'string'},
		{name:'fechaprecio', type: 'date',dateFormat:'Y-m-d'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_moneda', type: 'string'},		
		
	],
	sortInfo:{
		field: 'proyecto',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_equipo:this.maestro.id_equipo};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Equipoprecio.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_equipo').setValue(this.maestro.id_equipo);
	},
}
)
</script>
		
		