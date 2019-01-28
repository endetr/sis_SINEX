<?php
/**
*@package pXP
*@file gen-Unidadconstructivaenctablerocp.php
*@author  (admin)
*@date 15-11-2018 13:32:16
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivaenctablerocp=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivaenctablerocp.superclass.constructor.call(this,config);
		this.init();
		
		this.addButton('copyuc', {
			text : 'Copiar',
			iconCls : 'brenew',
			disabled : false,
			handler : this.copyuc,
			tooltip : '<b>Copiar</b>'
		});
		
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
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
				name: 'codigo',
				fieldLabel: 'Código',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'uctcpenc.codigo',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'descripcion',
				fieldLabel: 'Descripción',
				allowBlank: true,
				anchor: '80%',
				gwidth: 300,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'uctcpenc.descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'numerobahias',
				fieldLabel: 'Número Bahias',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'uctcpenc.numerobahias',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config:{
				name: 'porcrepuestos',
				fieldLabel: 'Porcentaje en Repuestos',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uctcpenc.porcrepuestos',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valoritem',
				fieldLabel: 'Total Ítems',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'uctcpenc.numerobahias',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorserv',
				fieldLabel: 'Total Servicios',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'uctcpenc.numerobahias',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorog',
				fieldLabel: 'Total Otros Gastos',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'uctcpenc.numerobahias',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valortotal',
				fieldLabel: 'Total General',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'uctcpenc.numerobahias',type:'numeric'},
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
				filters:{pfiltro:'uctcpenc.estado_reg',type:'string'},
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
				filters:{pfiltro:'uctcpenc.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'uctcpenc.fecha_reg',type:'date'},
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
				filters:{pfiltro:'uctcpenc.usuario_ai',type:'string'},
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
				filters:{pfiltro:'uctcpenc.fecha_mod',type:'date'},
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
	title:'Unidad Constructiva Tableros de Control y protección',
	ActSave:'../../sis_SINEX/control/Unidadconstructivaenctablerocp/insertarUnidadconstructivaenctablerocp',
	ActDel:'../../sis_SINEX/control/Unidadconstructivaenctablerocp/eliminarUnidadconstructivaenctablerocp',
	ActList:'../../sis_SINEX/control/Unidadconstructivaenctablerocp/listarUnidadconstructivaenctablerocp',
	id_store:'id_unidadconstructivaenctablerocp',
	fields: [
		{name:'id_unidadconstructivaenctablerocp', type: 'numeric'},
		{name:'codigo', type: 'string'},
		{name:'numerobahias', type: 'numeric'},
		{name:'descripcion', type: 'string'},
		{name:'porcrepuestos', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'valoritem', type: 'numeric'},
		{name:'valorserv', type: 'numeric'},
		{name:'valorog', type: 'numeric'},
		{name:'valortotal', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_unidadconstructivaenctablerocp',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[
		{
			url:'../../../sis_SINEX/vista/unidadconstructivatablerocp/Unidadconstructivatablerocp.php',
			title:'Ítems',
			height:'75%',
			cls:'Unidadconstructivatablerocp'
		},
		{
			url:'../../../sis_SINEX/vista/unidadconstructivatablerocpserv/Unidadconstructivatablerocpserv.php',
			title:'Servicios',
			height:'75%',
			cls:'Unidadconstructivatablerocpserv'
		},
		{
			url:'../../../sis_SINEX/vista/unidadconstructivaenctablerocp/otrosgastos.php',
			title:'Otros gastos',
			height:'75%',
			cls:'otrosgastos'
		}
	],
	
	copyuc : function() {
			var rec = this.sm.getSelected();
			var data = rec.data;
			
			if (data) {
			Phx.CP.loadingShow();				
				Ext.Ajax.request({
					url : '../../sis_SINEX/control/Unidadconstructivaenctablerocp/copiarUCTB',
					params : {
						'id_unidadconstructivaenctablerocp' : data.id_unidadconstructivaenctablerocp			
					},
					success : function(data) {
						this.load({params:{start:0, limit:50}})
						this.successExport();		
					    },
						failure : this.conexionFailure,
						timeout : this.timeout,
						scope : this
					});
			}
		}
	
	}
)
</script>
		
		