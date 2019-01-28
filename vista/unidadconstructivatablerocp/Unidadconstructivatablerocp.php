<?php
/**
*@package pXP
*@file gen-Unidadconstructivatablerocp.php
*@author  (admin)
*@date 11-10-2018 19:42:39
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivatablerocp=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivatablerocp.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivatablerocp'
			},
			type:'Field',
			form:true 
		},
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivaenctablerocp'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'unidadconstructivatablerocp',
				fieldLabel: ' Descripción',
				allowBlank: false,
				anchor: '80%',
				gwidth: 400,
				maxLength:500
			},
				type:'TextField',
				filters:{pfiltro:'uctcp.unidadconstructivatablerocp',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'cantidadtablerocp',
				fieldLabel: ' Número de Tableros',
				allowBlank: false,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179648,
				decimalPrecision: 5
			},
				type:'NumberField',
				filters:{pfiltro:'uctcp.cantidadtablerocp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'precio',
				fieldLabel: ' Valor Unitario (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uctcp.precio',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valortotaltablerocp',
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
				filters:{pfiltro:'uctcp.estado_reg',type:'string'},
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
				filters:{pfiltro:'uctcp.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'uctcp.usuario_ai',type:'string'},
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
				filters:{pfiltro:'uctcp.fecha_reg',type:'date'},
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
				filters:{pfiltro:'uctcp.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Tableros de Control y Protección',
	ActSave:'../../sis_SINEX/control/Unidadconstructivatablerocp/insertarUnidadconstructivatablerocp',
	ActDel:'../../sis_SINEX/control/Unidadconstructivatablerocp/eliminarUnidadconstructivatablerocp',
	ActList:'../../sis_SINEX/control/Unidadconstructivatablerocp/listarUnidadconstructivatablerocp',
	id_store:'id_unidadconstructivatablerocp',
	fields: [
		{name:'id_unidadconstructivatablerocp', type: 'numeric'},
		{name:'id_unidadconstructivaenctablerocp', type: 'numeric'},
		{name:'precio', type: 'numeric'},
		{name:'cantidadtablerocp', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'unidadconstructivatablerocp', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'valortotaltablerocp', type: 'numeric'},		
		
	],
	sortInfo:{
		field: 'id_unidadconstructivatablerocp',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivaenctablerocp:this.maestro.id_unidadconstructivaenctablerocp};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Unidadconstructivatablerocp.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivaenctablerocp').setValue(this.maestro.id_unidadconstructivaenctablerocp);
	},
	
	}
)
</script>
		
		