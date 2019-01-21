<?php
/**
*@package pXP
*@file gen-Ucsbvalorar.php
*@author  (admin)
*@date 09-11-2018 18:38:43
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ucsbvalorar=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ucsbvalorar.superclass.constructor.call(this,config);
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
					name: 'id_ucsbvalorar'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'codigoproy',
				fieldLabel: 'Codigo Proyecto',
				allowBlank: true,
				anchor: '80%',
				gwidth: 150,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'sbv.codigoproy',type:'string'},
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
				gwidth: 350,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'sbv.nombreproy',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'numerobahias',
				fieldLabel: 'Numero de Bahias',
				allowBlank: true,
				anchor: '80%',
				gwidth: 200,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'sbv.numerobahias',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_terrenosb',
				fieldLabel: 'Terreno',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Terrenosb/listarTerrenosb',
					id: 'id_terrenosb',
					root: 'datos',
					sortInfo: {
						field: 'id_terrenosb',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_terrenosb', 'terrenosb'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_terrenosb',
				displayField: 'terrenosb',
				gdisplayField: 'desc_terrenosb',
				hiddenName: 'id_terrenosb',
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
					return String.format('{0}', record.data['desc_terrenosb']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: true,
			form: true
		},			
		{
			config: {
				name: 'id_revista',
				fieldLabel: 'Revista',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Revista/listarRevista',
					id: 'id_revista',
					root: 'datos',
					sortInfo: {
						field: 'id_revista',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_revista', 'revista'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_revista',
				displayField: 'revista',
				gdisplayField: 'desc_revista',
				hiddenName: 'id_revista',
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
					return String.format('{0}', record.data['desc_revista']);
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
				name: 'altura',
				fieldLabel: 'Altura',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'sbv.altura',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'distanciatransext',
				fieldLabel: 'Distancia Trans. Ext.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 300,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'sbv.distanciatransext',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'distanciatransnac',
				fieldLabel: 'Distancia Trans. Nac.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 300,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'sbv.distanciatransnac',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config:{
				name: 'valortotal',
				fieldLabel: 'Valor total',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'valortotal',type:'numeric'},
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
				filters:{pfiltro:'sbv.estado_reg',type:'string'},
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
				filters:{pfiltro:'sbv.fecha_reg',type:'date'},
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
				filters:{pfiltro:'sbv.usuario_ai',type:'string'},
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
				filters:{pfiltro:'sbv.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'sbv.fecha_mod',type:'date'},
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
	title:'Subestacion Valor',
	ActSave:'../../sis_SINEX/control/Ucsbvalorar/insertarUcsbvalorar',
	ActDel:'../../sis_SINEX/control/Ucsbvalorar/eliminarUcsbvalorar',
	ActList:'../../sis_SINEX/control/Ucsbvalorar/listarUcsbvalorar',
	id_store:'id_ucsbvalorar',
	fields: [
		{name:'id_ucsbvalorar', type: 'numeric'},
		{name:'id_terrenosb', type: 'numeric'},
		{name:'numerobahias', type: 'numeric'},
		{name:'codigoproy', type: 'string'},
		{name:'id_revista', type: 'numeric'},
		{name:'distanciatransnac', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'altura', type: 'numeric'},
		{name:'distanciatransext', type: 'numeric'},
		{name:'nombreproy', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_terrenosb', type: 'string'},
		{name:'desc_revista', type: 'string'},
		{name:'valortotal', type: 'numeric'},		
		
	],
	sortInfo:{
		field: 'id_ucsbvalorar',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
		tabsouth:[
		{
			url:'../../../sis_SINEX/vista/ucsbvalorarcuc/Ucsbvalorarcuc.php',
			title:'Unidades constructivas subestaciones',
			height:'75%',
			cls:'Ucsbvalorarcuc'
		},
		{
			url:'../../../sis_SINEX/vista/ucsbvalorarouc/Ucsbvalorarouc.php',
			title:'Otras unidades constructivas',
			height:'75%',
			cls:'Ucsbvalorarouc'
		},
	],
	
	reportepdf : function() {
		var rec = this.sm.getSelected();
		var data = rec.data;
		var strNombre;
		if (data) {
			Phx.CP.loadingShow();
			strNombre = 'ProyectoUUESE-' + data.codigoproy + '.pdf'
			
			Ext.Ajax.request({
				url : '../../sis_SINEX/control/Ucsbvalorar/ReportePDF',
				params : {
					'id_ucsbvalorar' : data.id_ucsbvalorar
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
			strNombre = 'ProyectoUUESE-' + data.codigoproy + '.xls'
			
			Ext.Ajax.request({
				url : '../../sis_SINEX/control/Ucsbvalorar/ReporteEXCEL',
				params : {
					'id_ucsbvalorar' : data.id_ucsbvalorar
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
		
		