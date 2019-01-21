<?php
/**
*@package pXP
*@file gen-Manoobramoe.php
*@author  (admin)
*@date 29-08-2018 18:34:29
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Manoobramoe=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Manoobramoe.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_manoobramoe'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'manoobramoe',
				fieldLabel: 'Mano de Obra',
				allowBlank: false,
				anchor: '80%',
				gwidth: 300,
				maxLength:1000
			},
				type:'TextField',
				filters:{pfiltro:'mnmoe.manoobramoe',type:'string'},
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
				gwidth: 150,
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
				name: 'valorunitariorlp',
				fieldLabel: 'Valor Unitario Revista la Paz ($)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650,
				decimalPrecision: 5
			},
				type:'NumberField',
				filters:{pfiltro:'mnmoe.valorunitariorlp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valorunitariorcb',
				fieldLabel: 'Valor Unitario Revista Cochabamba ($)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650,
				decimalPrecision: 5
			},
				type:'NumberField',
				filters:{pfiltro:'mnmoe.valorunitariorcb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		
		{
			config:{
				name: 'valorunitariorsc',
				fieldLabel: 'Valor Unitario Revista Santa Cruz ($)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650,
				decimalPrecision: 5
			},
				type:'NumberField',
				filters:{pfiltro:'mnmoe.valorunitariorsc',type:'numeric'},
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
				filters:{pfiltro:'mnmoe.estado_reg',type:'string'},
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
				filters:{pfiltro:'mnmoe.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'mnmoe.usuario_ai',type:'string'},
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
				filters:{pfiltro:'mnmoe.fecha_reg',type:'date'},
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
				filters:{pfiltro:'mnmoe.fecha_mod',type:'date'},
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
	title:'Mano de Obra',
	ActSave:'../../sis_SINEX/control/Manoobramoe/insertarManoobramoe',
	ActDel:'../../sis_SINEX/control/Manoobramoe/eliminarManoobramoe',
	ActList:'../../sis_SINEX/control/Manoobramoe/listarManoobramoe',
	id_store:'id_manoobramoe',
	fields: [
		{name:'id_manoobramoe', type: 'numeric'},
		{name:'manoobramoe', type: 'string'},
		{name:'valorunitariorcb', type: 'numeric'},
		{name:'id_unidad', type: 'numeric'},
		{name:'valorunitariorlp', type: 'numeric'},
		{name:'valorunitariorsc', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_unidadabrev', type: 'string'},	
		
	],
	sortInfo:{
		field: 'id_manoobramoe',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true
	}
)
</script>
		
		