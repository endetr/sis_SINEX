<?php
/**
*@package pXP
*@file gen-Unidadconstructivaenccomun.php
*@author  (admin)
*@date 15-11-2018 12:59:55
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivaenccomun=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivaenccomun.superclass.constructor.call(this,config);
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
					name: 'id_unidadconstructivaenccomun'
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
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'uccmenc.codigo',type:'string'},
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
				filters:{pfiltro:'uccmenc.descripcion',type:'string'},
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
				gwidth: 150,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'uccmenc.numerobahias',type:'numeric'},
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
				filters:{pfiltro:'uccmenc.numerobahias',type:'numeric'},
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
				filters:{pfiltro:'uccmenc.numerobahias',type:'numeric'},
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
				filters:{pfiltro:'uccmenc.numerobahias',type:'numeric'},
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
				filters:{pfiltro:'uccmenc.estado_reg',type:'string'},
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
				filters:{pfiltro:'uccmenc.fecha_reg',type:'date'},
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
				filters:{pfiltro:'uccmenc.usuario_ai',type:'string'},
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
				filters:{pfiltro:'uccmenc.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'uccmenc.fecha_mod',type:'date'},
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
	title:'Unidad Constructiva Comunicaciones',
	ActSave:'../../sis_SINEX/control/Unidadconstructivaenccomun/insertarUnidadconstructivaenccomun',
	ActDel:'../../sis_SINEX/control/Unidadconstructivaenccomun/eliminarUnidadconstructivaenccomun',
	ActList:'../../sis_SINEX/control/Unidadconstructivaenccomun/listarUnidadconstructivaenccomun',
	id_store:'id_unidadconstructivaenccomun',
	fields: [
		{name:'id_unidadconstructivaenccomun', type: 'numeric'},
		{name:'codigo', type: 'string'},
		{name:'estado_reg', type: 'string'},
		{name:'numerobahias', type: 'numeric'},
		{name:'descripcion', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'valoritem', type: 'numeric'},
		{name:'valorog', type: 'numeric'},
		{name:'valortotal', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_unidadconstructivaenccomun',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[
		{
			url:'../../../sis_SINEX/vista/unidadconstructivacomun/Unidadconstructivacomun.php',
			title:'Ítems',
			height:'75%',
			cls:'Unidadconstructivacomun'
		},
		{
			url:'../../../sis_SINEX/vista/unidadconstructivaenccomun/otrosgastos.php',
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
					url : '../../sis_SINEX/control/Unidadconstructivaenccomun/copiarUCCOM',
					params : {
						'id_unidadconstructivaenccomun' : data.id_unidadconstructivaenccomun			
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
		
		