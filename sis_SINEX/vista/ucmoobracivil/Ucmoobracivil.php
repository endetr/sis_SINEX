<?php
/**
*@package pXP
*@file gen-Ucmoobracivil.php
*@author  (admin)
*@date 27-07-2018 16:54:44
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ucmoobracivil=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ucmoobracivil.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ucmoobracivil'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_ucmogrupo',
				fieldLabel: 'id_ucmogrupo',				
			},
			type: 'Field',
			id_grupo: 0,
			form: true
		},	
		{
			config: {
				name: 'id_obracivilmoe',
				fieldLabel: 'Obra Civil',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
				url: '../../sis_SINEX/control/Obracivilmoe/listarObracivilmoe',
					id: 'id_obracivilmoe',
					root: 'datos',
					sortInfo: {
						field: 'obracivilmoe',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_obracivilmoe', 'obracivilmoe'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_obracivilmoe',
				displayField: 'obracivilmoe',
				gdisplayField: 'desc_obracivilmoe',
				hiddenName: 'id_obracivilmoe',
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
					return String.format('{0}', record.data['desc_obracivilmoe']);
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
				name: 'unidad',
				fieldLabel: 'Unidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:10
			},
				type:'TextField',
				filters:{pfiltro:'unidad',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'cantidadobra',
				fieldLabel: 'Cantidad',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucmoobci.cantidadobra',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'preciounitariorlp',
				fieldLabel: 'Valor Unitario (RLP)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'preciounitariorlp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'preciounitariorcb',
				fieldLabel: 'Valor Unitario (RCB)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'preciounitariorcb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'preciounitariorsc',
				fieldLabel: 'Valor Unitario (RSC)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'preciounitariorsc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valortotalrlp',
				fieldLabel: 'Valor Total (RLP)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'TextField',
				filters:{pfiltro:'valortotalrlp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valortotalrcb',
				fieldLabel: 'Valor Total (RCB)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'TextField',
				filters:{pfiltro:'valortotalrcb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valortotalrsc',
				fieldLabel: 'Valor Total (RSC)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'TextField',
				filters:{pfiltro:'valortotalrsc',type:'numeric'},
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
				filters:{pfiltro:'ucmoobci.estado_reg',type:'string'},
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
				filters:{pfiltro:'ucmoobci.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'ucmoobci.usuario_ai',type:'string'},
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
				filters:{pfiltro:'ucmoobci.fecha_reg',type:'date'},
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
				filters:{pfiltro:'ucmoobci.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Obra Civil',
	ActSave:'../../sis_SINEX/control/Ucmoobracivil/insertarUcmoobracivil',
	ActDel:'../../sis_SINEX/control/Ucmoobracivil/eliminarUcmoobracivil',
	ActList:'../../sis_SINEX/control/Ucmoobracivil/listarUcmoobracivil',
	id_store:'id_ucmoobracivil',
	fields: [
		{name:'id_ucmoobracivil', type: 'numeric'},
		{name:'id_obracivilmoe', type: 'numeric'},
		{name:'cantidadobra', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_ucmogrupo', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_obracivilmoe', type: 'string'},
		{name:'unidad', type: 'string'},
		{name:'valortotalrlp', type: 'numeric'},	
		{name:'valortotalrcb', type: 'numeric'},
		{name:'valortotalrsc', type: 'numeric'},
		{name:'preciounitariorlp', type: 'numeric'},		
		{name:'preciounitariorcb', type: 'numeric'},
		{name:'preciounitariorsc', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_ucmoobracivil',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_ucmogrupo:this.maestro.id_ucmogrupo};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Ucmoobracivil.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_ucmogrupo').setValue(this.maestro.id_ucmogrupo);
	}	

	
	}
)
</script>
		
		