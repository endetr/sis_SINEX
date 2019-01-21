<?php
/**
*@package pXP
*@file gen-Unidadconstructivatablerocpserv.php
*@author  (admin)
*@date 15-11-2018 14:02:13
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivatablerocpserv=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivatablerocpserv.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivatablerocpserv'
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
				name: 'unidadconstructivatablerocpserv',
				fieldLabel: 'Descripción',
				allowBlank: true,
				anchor: '80%',
				gwidth: 450,
				maxLength:2000
			},
				type:'TextField',
				filters:{pfiltro:'uctcserv.unidadconstructivatablerocpserv',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'cantidadserv',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653,
				decimalPrecision: 5
			},
				type:'NumberField',
				filters:{pfiltro:'uctcserv.cantidadserv',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'precio',
				fieldLabel: 'Valor Unitario (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uctcserv.precio',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valortotal',
				fieldLabel: 'Valor Total (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uctcserv.precio',type:'numeric'},
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
				filters:{pfiltro:'uctcserv.estado_reg',type:'string'},
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
				filters:{pfiltro:'uctcserv.fecha_reg',type:'date'},
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
				filters:{pfiltro:'uctcserv.usuario_ai',type:'string'},
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
				filters:{pfiltro:'uctcserv.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'uctcserv.fecha_mod',type:'date'},
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
	title:'Servicios UC Tableros',
	ActSave:'../../sis_SINEX/control/Unidadconstructivatablerocpserv/insertarUnidadconstructivatablerocpserv',
	ActDel:'../../sis_SINEX/control/Unidadconstructivatablerocpserv/eliminarUnidadconstructivatablerocpserv',
	ActList:'../../sis_SINEX/control/Unidadconstructivatablerocpserv/listarUnidadconstructivatablerocpserv',
	id_store:'id_unidadconstructivatablerocpserv',
	fields: [
		{name:'id_unidadconstructivatablerocpserv', type: 'numeric'},
		{name:'id_unidadconstructivaenctablerocp', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'cantidadserv', type: 'numeric'},
		{name:'precio', type: 'numeric'},
		{name:'unidadconstructivatablerocpserv', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'cantidadserv', type: 'valortotal'},
		{name:'valortotal', type: 'valortotal'},
		
	],
	sortInfo:{
		field: 'id_unidadconstructivatablerocpserv',
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
		Phx.vista.Unidadconstructivatablerocpserv.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivaenctablerocp').setValue(this.maestro.id_unidadconstructivaenctablerocp);
	},
	
	}
)
</script>
		
		