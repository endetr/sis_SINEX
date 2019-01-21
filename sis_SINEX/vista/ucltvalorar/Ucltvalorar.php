<?php
/**
*@package pXP
*@file gen-Ucltvalorar.php
*@author  (admin)
*@date 01-11-2018 14:22:48
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ucltvalorar=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ucltvalorar.superclass.constructor.call(this,config);
		this.init();
		
		this.addButton('reportepdf', {
			text : 'Reporte PDF',
			iconCls : 'bpdf',
			disabled : false,
			handler : this.reportepdf,
			tooltip : '<b>Reporte PDF</b>'
		});
		this.addButton('reporteexcel', {
			text : 'Reporte Excel',
			iconCls : 'bexcel',
			disabled : false,
			handler : this.reporteexcel,
			tooltip : '<b>Reporte Excel</b>'
		});
		
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ucltvalorar'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'codigoproy',
				fieldLabel: 'Código Proyecto',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'vpuclt.codigoproy',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config:{
				name: 'nombreproy',
				fieldLabel: 'Nombre Proyecto',
				allowBlank: true,
				anchor: '80%',
				gwidth: 250,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'vpuclt.nombreproy',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valorproyecto',
				fieldLabel: 'Valor Total Proyecto',		
				gwidth: 150,		
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
				filters:{pfiltro:'vpuclt.estado_reg',type:'string'},
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
				filters:{pfiltro:'vpuclt.fecha_reg',type:'date'},
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
				filters:{pfiltro:'vpuclt.usuario_ai',type:'string'},
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
				filters:{pfiltro:'vpuclt.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'vpuclt.fecha_mod',type:'date'},
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
	title:'Valorar Proyectos Líneas de Transmisión',
	ActSave:'../../sis_SINEX/control/Ucltvalorar/insertarUcltvalorar',
	ActDel:'../../sis_SINEX/control/Ucltvalorar/eliminarUcltvalorar',
	ActList:'../../sis_SINEX/control/Ucltvalorar/listarUcltvalorar',
	id_store:'id_ucltvalorar',
	fields: [
		{name:'id_ucltvalorar', type: 'numeric'},
		{name:'codigoproy', type: 'string'},
		{name:'estado_reg', type: 'string'},
		{name:'nombreproy', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'valorproyecto', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_ucltvalorar',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[
		{
			url:'../../../sis_SINEX/vista/ucltvaloraruc/Ucltvaloraruc.php',
			title:'Unidades Constructivas',
			height:'60%',
			cls:'Ucltvaloraruc'
		}
		],
		
	
	reportepdf : function() {
		var rec = this.sm.getSelected();
		var data = rec.data;
		var strNombre;
		if (data) {
			Phx.CP.loadingShow();
			strNombre = 'ProyectoUUCLT-' + data.codigoproy + '.pdf'
			
			Ext.Ajax.request({
				url : '../../sis_SINEX/control/Ucltvalorar/ReportePDF',
				params : {
					'id_ucltvalorar' : data.id_ucltvalorar
				},
				//para que se genere el reporte tiene que ser successExport 
				success : function(data) {
					window.open('../../../sis_SINEX/reportes/' + strNombre, '_blank');
					this.successExport();		
			    },
				failure : this.conexionFailure,
				timeout : this.timeout,
				scope : this
			});
		}

	},
	
	reporteexcel : function() {
		var rec = this.sm.getSelected();
		var data = rec.data;
		var strNombre;
		if (data) {
			Phx.CP.loadingShow();
			strNombre = 'ProyectoUUCLT-' + data.codigoproy + '.xls'
			
			Ext.Ajax.request({
				url : '../../sis_SINEX/control/Ucltvalorar/ReporteEXCEL',
				params : {
					'id_ucltvalorar' : data.id_ucltvalorar
				},
				//para que se genere el reporte tiene que ser successExport 
				success : function(data) {
					window.open('../../../sis_SINEX/reportes/' + strNombre, '_blank');
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
		
		