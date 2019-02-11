<?php
/**
*@package pXP
*@file gen-Unidadconstructivasb.php
*@author  (admin)
*@date 11-07-2018 16:47:14
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivasb=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivasb.superclass.constructor.call(this,config);
		this.init();
		
		this.addButton('addCantTemp', {
			text : 'Capturar Cant. Equipos',
			iconCls : 'bsave',
			disabled : false,
			handler : this.resetcant,
			tooltip : '<b>Capturar Cant. Equipos</b>'
		});
		
		this.addButton('resetcant', {
			text : 'Reset Equipos',
			iconCls : 'bact',
			disabled : false,
			handler : this.resetcant,
			tooltip : '<b>Reset Equipos</b>'
		});
		
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivasb'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'codigo',
				fieldLabel: 'Código',
				allowBlank: false,
				anchor: '80%',
				gwidth: 150,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'ucs.codigo',type:'string'},
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
				filters:{pfiltro:'ucs.descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config: {
				name: 'id_tensionservicio',
				fieldLabel: 'Tensión servicio',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tensionservicio/listarTensionservicio',
					id: 'id_tensionservicio',
					root: 'datos',
					sortInfo: {
						field: 'id_tensionservicio',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tensionservicio', 'tensionservicio'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tensionservicio',
				displayField: 'tensionservicio',
				gdisplayField: 'desc_tensionservicio',
				hiddenName: 'id_tensionservicio',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '80%',
				gwidth: 50,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_tensionservicio']);
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
				name: 'id_ubicacion',
				fieldLabel: 'Ubicación',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Ubicacion/listarUbicacion',
					id: 'id_ubicacion',
					root: 'datos',
					sortInfo: {
						field: 'id_ubicacion',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_ubicacion', 'ubicacion'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_ubicacion',
				displayField: 'ubicacion',
				gdisplayField: 'desc_ubicacion',
				hiddenName: 'id_ubicacion',
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
					return String.format('{0}', record.data['desc_ubicacion']);
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
				name: 'alturainstalacion',
				fieldLabel: 'Altura instalación (m.s.n.m)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucs.alturainstalacion',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_claseaislacion',
				fieldLabel: 'Clase aislación (HA)',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Claseaislacion/listarClaseaislacion',
					id: 'id_claseaislacion',
					root: 'datos',
					sortInfo: {
						field: 'id_claseaislacion',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_claseaislacion', 'claseaislacion'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_claseaislacion',
				displayField: 'claseaislacion',
				gdisplayField: 'desc_claseaislacion',
				hiddenName: 'id_claseaislacion',
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
					return String.format('{0}', record.data['desc_claseaislacion']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: true,
			form: false
		},		
		{
			config:{
				name: 'superficie',
				fieldLabel: 'Superficie',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucs.superficie',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'distanciatransporte',
				fieldLabel: 'Distancia transporte Equipo (km)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucs.distanciatransporte',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'distanciatransportemate',
				fieldLabel: 'Distancia transporte Materiales (km)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucs.distanciatransportemate',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'numerobahias',
				fieldLabel: 'Número de Bahias',
				allowBlank: false,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucs.numerobahias',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'varloringenieria',
				fieldLabel: 'Valor Ingeniería',
				allowBlank: false,
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucs.varloringenieria',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valorucsbe',
				fieldLabel: 'Total Equipos',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorucsbm',
				fieldLabel: 'Total Maquinaria',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorucsbmate',
				fieldLabel: 'Total Materiales',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorucsdcont',
				fieldLabel: 'Directo Contratista',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorucsog',
				fieldLabel: 'Otros Gastos',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorucstotal',
				fieldLabel: 'Total Directo',				
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
				filters:{pfiltro:'ucs.estado_reg',type:'string'},
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
				filters:{pfiltro:'ucs.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				filters:{pfiltro:'ucs.usuario_ai',type:'string'},
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
				filters:{pfiltro:'ucs.fecha_reg',type:'date'},
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
				name: 'fecha_mod',
				fieldLabel: 'Fecha Modif.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'ucs.fecha_mod',type:'date'},
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
	title:'Unidad constructiva subestaciones',
	ActSave:'../../sis_SINEX/control/Unidadconstructivasb/insertarUnidadconstructivasb',
	ActDel:'../../sis_SINEX/control/Unidadconstructivasb/eliminarUnidadconstructivasb',
	ActList:'../../sis_SINEX/control/Unidadconstructivasb/listarUnidadconstructivasb',
	id_store:'id_unidadconstructivasb',
	fields: [
		{name:'id_unidadconstructivasb', type: 'numeric'},
		{name:'descripcion', type: 'string'},
		{name:'id_tensionservicio', type: 'numeric'},
		{name:'superficie', type: 'numeric'},
		{name:'codigo', type: 'string'},	
		{name:'desc_coddescrip', type: 'string'},		
		{name:'alturainstalacion', type: 'numeric'},
		{name:'id_ubicacion', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_claseaislacion', type: 'numeric'},
		{name:'distanciatransporte', type: 'numeric'},
		{name:'distanciatransportemate', type: 'numeric'},
		{name:'numerobahias', type: 'numeric'},
		{name:'varloringenieria', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_tensionservicio', type: 'string'},
		{name:'desc_ubicacion', type: 'string'},
		{name:'desc_claseaislacion', type: 'string'},
		{name:'valorucsbe', type: 'numeric'},
		{name:'valorucsbm', type: 'numeric'},
		{name:'valorucsbmate', type: 'numeric'},
		{name:'valorucsdcont', type: 'numeric'},
		{name:'valorucsog', type: 'numeric'},
		{name:'valorucstotal', type: 'numeric'},	
		
	],
	sortInfo:{
		field: 'id_unidadconstructivasb',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[
		{
			url:'../../../sis_SINEX/vista/ucsbmaquinaria/Ucsbmaquinaria.php',
			title:'Maquinarias',
			height:'50%',
			cls:'Ucsbmaquinaria'
		},
		{
			url:'../../../sis_SINEX/vista/ucsbequipo/Ucsbequipo.php',
			title:'Equipos',
			height:'35%',
			cls:'Ucsbequipo'
		},
		{
			url:'../../../sis_SINEX/vista/materiales/Materiales.php',
			title:'Materiales',
			height:'35%',
			cls:'Materiales'
		},
		{
          	url:'../../../sis_SINEX/vista/obraciviles/Obraciviles.php',
			title:'Directo Contratista',
			//width:400,
			height:'50%',
			cls:'Obraciviles'
        },
        {
          	url:'../../../sis_SINEX/vista/obraciviles/Otrosgastos.php',
			title:'Otros Gastos',
			//width:400,
			height:'50%',
			cls:'Otrosgastos'
         } 
	],
	
	resetcant : function() {
		var r = confirm("Esta seguro que desea resetear las cantidades?");	
		var rec = this.sm.getSelected();
		var data = rec.data;
		
		if (r == true) {
			if (data) {
			Phx.CP.loadingShow();
			
			Ext.Ajax.request({
				url : '../../sis_SINEX/control/Unidadconstructivasb/resetCant',
				params : {
					'id_unidadconstructivasb' : data.id_unidadconstructivasb			
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
	}
)
</script>
		
		