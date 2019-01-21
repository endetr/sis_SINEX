<?php
/**
*@package pXP
*@file gen-Ucsbequipo.php
*@author  (admin)
*@date 09-07-2018 17:58:19
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ucsbequipo=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ucsbequipo.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ucsbequipo'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType: 'hidden',
				name: 'id_unidadconstructivasb',
				fieldLabel: 'id_unidadconstructivasb',
				},
			type: 'Field',
			id_grupo: 0,
			form: true
		},		
		{
			config: {
				name: 'id_equipo',
				fieldLabel: 'Equipo',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Equipo/listarEquipo',
					id: 'id_equipo',
					root: 'datos',
					sortInfo: {
						field: 'equipo',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_equipo', 'equipo'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_equipo',
				displayField: 'equipo',
				gdisplayField: 'desc_equipo',
				hiddenName: 'id_equipo',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 350,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_equipo']);
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
				name: 'cantidadequ',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucsbe.cantidadequ',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valorunitario',
				fieldLabel: 'Valor Unitario',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valortotal',
				fieldLabel: 'Valor Total',				
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
				filters:{pfiltro:'ucsbe.estado_reg',type:'string'},
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
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'ucsbe.fecha_reg',type:'date'},
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
				filters:{pfiltro:'ucsbe.usuario_ai',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'id_usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'ucsbe.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'ucsbe.fecha_mod',type:'date'},
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
	title:'UCSB Equipo',
	ActSave:'../../sis_SINEX/control/Ucsbequipo/insertarUcsbequipo',
	ActDel:'../../sis_SINEX/control/Ucsbequipo/eliminarUcsbequipo',
	ActList:'../../sis_SINEX/control/Ucsbequipo/listarUcsbequipo',
	id_store:'id_ucsbequipo',
	fields: [
		{name:'id_ucsbequipo', type: 'numeric'},
		{name:'id_unidadconstructivasb', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'cantidadequ', type: 'numeric'},
		{name:'id_equipo', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_equipo', type: 'string'},
		{name:'codigo', type: 'string'},
		{name:'descripcion', type: 'string'},
		{name:'valorunitario', type: 'numeric'},
		{name:'valortotal', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_ucsbequipo',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivasb:this.maestro.id_unidadconstructivasb};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Ucsbequipo.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivasb').setValue(this.maestro.id_unidadconstructivasb);
	},
	}
)
</script>
		
		