<?php
/**
*@package pXP
*@file gen-Ucedifobracivil.php
*@author  (admin)
*@date 27-07-2018 14:52:35
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ucedifobracivil=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ucedifobracivil.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ucedifobracivil'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_ucedifsubgrupo',
				fieldLabel: 'id_ucedifsubgrupo',				
			},
			type: 'Field',
			id_grupo: 0,
			form: true
		},		
		{
			config: {
				name: 'id_obracivilmoe',
				fieldLabel: 'Descripción',
				allowBlank: true,
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
				anchor: '100%',
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
				name: 'cantidadobracivil',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'TextField',
				filters:{pfiltro:'udoc.cantidadobracivil',type:'numeric'},
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
				filters:{pfiltro:'udoc.estado_reg',type:'string'},
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
				filters:{pfiltro:'udoc.id_usuario_ai',type:'numeric'},
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
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'udoc.fecha_reg',type:'date'},
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
				filters:{pfiltro:'udoc.usuario_ai',type:'string'},
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
				filters:{pfiltro:'udoc.fecha_mod',type:'date'},
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
	title:'Obra civil',
	ActSave:'../../sis_SINEX/control/Ucedifobracivil/insertarUcedifobracivil',
	ActDel:'../../sis_SINEX/control/Ucedifobracivil/eliminarUcedifobracivil',
	ActList:'../../sis_SINEX/control/Ucedifobracivil/listarUcedifobracivil',
	id_store:'id_ucedifobracivil',
	fields: [
		{name:'id_ucedifobracivil', type: 'numeric'},
		{name:'id_ucedifsubgrupo', type: 'numeric'},
		{name:'cantidadobracivil', type: 'numeric'},
		{name:'id_obracivilmoe', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
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
		field: 'id_ucedifobracivil',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_ucedifsubgrupo:this.maestro.id_ucedifsubgrupo};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Ucedifobracivil.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_ucedifsubgrupo').setValue(this.maestro.id_ucedifsubgrupo);
	}
	}
)
</script>
		
		