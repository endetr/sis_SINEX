<?php
/**
*@package pXP
*@file gen-Unidadconstructivalt.php
*@author  (admin)
*@date 03-08-2018 15:44:56
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivalt=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivalt.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivalt'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'codigo',
				fieldLabel: ' Código',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:10
			},
				type:'TextField',
				filters:{pfiltro:'uclt.codigo',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config:{
				name: 'descripcion',
				fieldLabel: ' Descripción',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'uclt.descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},			
		{
			config: {
				name: 'id_revista',
				fieldLabel: ' Revista',
				allowBlank: false,
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
				anchor: '80%',
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
			config: {
				name: 'id_tipolinea',
				fieldLabel: ' Tipo Línea',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipolinea/listarTipolinea',
					id: 'id_tipolinea',
					root: 'datos',
					sortInfo: {
						field: 'id_tipolinea',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipolinea', 'tipolinea'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipolinea',
				displayField: 'tipolinea',
				gdisplayField: 'desc_tipolinea',
				hiddenName: 'id_tipolinea',
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
					return String.format('{0}', record.data['desc_tipolinea']);
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
				name: 'id_tensionservicio',
				fieldLabel: ' Niveles de Tensión(kV)',
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
				gwidth: 150,
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
				name: 'id_tipoestructura',
				fieldLabel: ' Tipo Estructura',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipoestructura/listarTipoestructura',
					id: 'id_tipoestructura',
					root: 'datos',
					sortInfo: {
						field: 'id_tipoestructura',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipoestructura', 'tipoestructura'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipoestructura',
				displayField: 'tipoestructura',
				gdisplayField: 'desc_tipoestructura',
				hiddenName: 'id_tipoestructura',
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
					return String.format('{0}', record.data['desc_tipoestructura']);
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
				name: 'id_tipoconductor',
				fieldLabel: ' Tipo Conductor',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Tipoconductor/listarTipoconductor',
					id: 'id_tipoconductor',
					root: 'datos',
					sortInfo: {
						field: 'id_tipoconductor',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipoconductor', 'desc_tipoconductor'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_tipoconductor',
				displayField: 'desc_tipoconductor',
				gdisplayField: 'desc_tipoconductor',
				hiddenName: 'id_tipoconductor',
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
					return String.format('{0}', record.data['desc_tipoconductor']);
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
				name: 'conductorfase',
				fieldLabel: ' Conductor Fase(un)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.conductorfase',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_configuracionlt',
				fieldLabel: ' Configuración',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Configuracionlt/listarConfiguracionlt',
					id: 'id_configuracionlt',
					root: 'datos',
					sortInfo: {
						field: 'id_configuracionlt',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_configuracionlt', 'configuracionlt'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_configuracionlt',
				displayField: 'configuracionlt',
				gdisplayField: 'desc_configuracionlt',
				hiddenName: 'id_configuracionlt',
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
					return String.format('{0}', record.data['desc_configuracionlt']);
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
				name: 'id_hilosguarda',
				fieldLabel: 'Hilos Guarda(un)',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Hilosguarda/listarHilosguarda',
					id: 'id_hilosguarda',
					root: 'datos',
					sortInfo: {
						field: 'id_hilosguarda',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_hilosguarda', 'hilosguarda'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_hilosguarda',
				displayField: 'hilosguarda',
				gdisplayField: 'desc_hilosguarda',
				hiddenName: 'id_hilosguarda',
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
					return String.format('{0}', record.data['desc_hilosguarda']);
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
				name: 'id_clasificacionaltura',
				fieldLabel: ' Altura',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Clasificacionaltura/listarClasificacionaltura',
					id: 'id_clasificacionaltura',
					root: 'datos',
					sortInfo: {
						field: 'id_clasificacionaltura',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_clasificacionaltura', 'valoraltura'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_clasificacionaltura',
				displayField: 'valoraltura',
				gdisplayField: 'desc_valoraltura',
				hiddenName: 'id_clasificacionaltura',
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
					return String.format('{0}', record.data['desc_valoraltura']);
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
				name: 'id_pararrayolinea',
				fieldLabel: ' Pararrayo Línea',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Pararrayatolinea/listarPararrayatolinea',
					id: 'id_pararrayolinea',
					root: 'datos',
					sortInfo: {
						field: 'id_pararrayolinea',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_pararrayolinea', 'pararrayolinea'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_pararrayolinea',
				displayField: 'pararrayolinea',
				gdisplayField: 'desc_pararrayolinea',
				hiddenName: 'id_pararrayolinea',
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
					return String.format('{0}', record.data['desc_pararrayolinea']);
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
				name: 'distanciatransporte',
				fieldLabel: ' Distancia Transporte NAC(km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.distanciatransporte',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'distanciatransporteext',
				fieldLabel: ' Distancia Transporte EXTR(km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.distanciatransporteext',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'estructurapasocantidad',
				fieldLabel: ' Estructuras de Paso',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.estructurapasocantidad',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},	
		{
			config:{
				name: 'estructurapasopeso',
				fieldLabel: ' Peso Estructura de Paso (ton)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.estructurapasopeso',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'estructuraamarrecantidad',
				fieldLabel: ' Estructuras de Amarre',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.estructuraamarrecantidad',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'estructuraamarrepeso',
				fieldLabel: ' Peso Estructura de Amarre (ton)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.estructuraamarrepeso',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcmterrenofirme',
				fieldLabel: ' Material de Terreno Firme (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcmterrenofirme',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcmterrenointerme',
				fieldLabel: ' Material de Terreno Intermedio (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcmterrenointerme',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcmterrenoterrenoblando',
				fieldLabel: ' Material de Terreno Blando (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcmterrenoterrenoblando',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},	
		{
			config:{
				name: 'porcmterrenosumer',
				fieldLabel: ' Material de Terreno Sumergido (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcmterrenosumer',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},		
		{
			config:{
				name: 'porcvegetamaleza',
				fieldLabel: ' Vegetación Tipo Maleza (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcvegetamaleza',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},		
		{
			config:{
				name: 'porcvegetamatorral',
				fieldLabel: ' Vegetación Tipo Matorral (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcvegetamatorral',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcvegetaforestacion',
				fieldLabel: ' Vegetación Tipo Forestación (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcvegetaforestacion',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcvegetabosque',
				fieldLabel: ' Vegetación Tipo Bosque (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcvegetabosque',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcterrenoplano',
				fieldLabel: ' Terreno Tipo Plano (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcterrenoplano',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcterrenoondulado',
				fieldLabel: ' Terreno Tipo Ondulado (%)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcterrenoondulado',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcterrenocerros',
				fieldLabel: ' Terreno Tipo Cerros (%)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.porcterrenocerros',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config: {
				name: 'id_areaprotegida',
				fieldLabel: ' Zona Protegida',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Areaprotegida/listarAreaprotegida',
					id: 'id_areaprotegida',
					root: 'datos',
					sortInfo: {
						field: 'id_areaprotegida',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_areaprotegida', 'areaprotegida'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_areaprotegida',
				displayField: 'areaprotegida',
				gdisplayField: 'desc_areaprotegida',
				hiddenName: 'id_areaprotegida',
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
					return String.format('{0}', record.data['desc_areaprotegida']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: false,
			form: true
		},		
		{
			config:{
				name: 'longitud',
				fieldLabel: ' Longitud (km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650,
				decimalPrecision: 5
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.longitud',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config: {
				name: 'id_nivelcontaminacionlt',
				fieldLabel: ' Nivel de Contaminación',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Nivelcontaminacionlt/listarNivelcontaminacionlt',
					id: 'id_nivelcontaminacionlt',
					root: 'datos',
					sortInfo: {
						field: 'id_nivelcontaminacionlt',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_nivelcontaminacionlt', 'nivelcontaminacionlt'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_nivelcontaminacionlt',
				displayField: 'nivelcontaminacionlt',
				gdisplayField: 'desc_nivelcontaminacionlt',
				hiddenName: 'id_nivelcontaminacionlt',
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
					return String.format('{0}', record.data['desc_nivelcontaminacionlt']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: false,
			form: true
		},	
		{
			config: {
				name: 'id_bancoductos',
				fieldLabel: 'Banco de Ductos',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Bancoductos/listarBancoductos',
					id: 'id_bancoductos',
					root: 'datos',
					sortInfo: {
						field: 'bancoductos',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_bancoductos', 'bancoductos'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_bancoductos',
				displayField: 'bancoductos',
				gdisplayField: 'bancoductos',
				hiddenName: 'id_bancoductos',
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
					return String.format('{0}', record.data['bancoductos']);
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
				name: 'id_cajaempalme',
				fieldLabel: 'Caja de Empalme',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Cajaempalme/listarCajaempalme',
					id: 'id_cajaempalme',
					root: 'datos',
					sortInfo: {
						field: 'cajaempalme',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_cajaempalme', 'cajaempalme'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_cajaempalme',
				displayField: 'cajaempalme',
				gdisplayField: 'cajaempalme',
				hiddenName: 'id_cajaempalme',
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
					return String.format('{0}', record.data['cajaempalme']);
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
				name: 'numaccesos',
				fieldLabel: 'Accesos',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650,
				decimalPrecision: 2
			},
				type:'NumberField',
				filters:{pfiltro:'uclt.numaccesos',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'numddp',
				fieldLabel: 'DDP (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numddp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'nummontaje',
				fieldLabel: 'Montaje (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'nummontaje',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numoc',
				fieldLabel: 'Obra Civil (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numoc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numingenieria',
				fieldLabel: 'Ingeniería (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numingenieria',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numadmeje',
				fieldLabel: 'Administración Ejecución (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numadmeje',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numsupero',
				fieldLabel: 'Supervisión de Obra (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numsupero',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numcfinan',
				fieldLabel: 'Costos Financieros (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numcfinan',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numcaamb',
				fieldLabel: 'Costos Aspectos Ambientales (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numcaamb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numcapred',
				fieldLabel: 'Costos Aspectos Prediales (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numcapred',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numcostototaluc',
				fieldLabel: 'Costo Total UC (USD/km)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'numcostototaluc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'descripcionfull',
				fieldLabel: 'descripcionfull',
				allowBlank: false,
			},
				type:'NumberField',
				id_grupo:1,
				grid:false,
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
				filters:{pfiltro:'uclt.estado_reg',type:'string'},
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
				filters:{pfiltro:'uclt.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'uclt.usuario_ai',type:'string'},
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
				filters:{pfiltro:'uclt.fecha_reg',type:'date'},
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
				filters:{pfiltro:'uclt.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Líneas de Transmisión',
	ActSave:'../../sis_SINEX/control/Unidadconstructivalt/insertarUnidadconstructivalt',
	ActDel:'../../sis_SINEX/control/Unidadconstructivalt/eliminarUnidadconstructivalt',
	ActList:'../../sis_SINEX/control/Unidadconstructivalt/listarUnidadconstructivalt',
	id_store:'id_unidadconstructivalt',
	fields: [
		{name:'id_unidadconstructivalt', type: 'numeric'},
		{name:'estructurapasocantidad', type: 'numeric'},
		{name:'id_clasificacionaltura', type: 'numeric'},
		{name:'porcmterrenosumer', type: 'numeric'},
		{name:'id_tensionservicio', type: 'numeric'},
		{name:'descripcion', type: 'string'},
		{name:'id_tipolinea', type: 'numeric'},
		{name:'porcterrenoplano', type: 'numeric'},
		{name:'porcmterrenofirme', type: 'numeric'},		
		{name:'id_hilosguarda', type: 'numeric'},		
		{name:'porcmterrenoterrenoblando', type: 'numeric'},
		{name:'id_tipoestructura', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'porcterrenoondulado', type: 'numeric'},
		{name:'conductorfase', type: 'numeric'},
		{name:'distanciatransporte', type: 'numeric'},
		{name:'distanciatransporteext', type: 'numeric'},
		{name:'porcmterrenointerme', type: 'numeric'},
		{name:'porcvegetabosque', type: 'numeric'},
		{name:'porcvegetaforestacion', type: 'numeric'},
		{name:'estructurapasopeso', type: 'numeric'},
		{name:'estructuraamarrepeso', type: 'numeric'},
		{name:'estructuraamarrecantidad', type: 'numeric'},
		{name:'porcterrenocerros', type: 'numeric'},
		{name:'id_pararrayolinea', type: 'numeric'},
		{name:'id_configuracionlt', type: 'numeric'},
		{name:'porcvegetamatorral', type: 'numeric'},
		{name:'codigo', type: 'string'},
		{name:'porcvegetamaleza', type: 'numeric'},
		{name:'id_tipoconductor', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},		
		{name:'desc_pararrayolinea', type: 'string'},
		{name:'desc_tipolinea', type: 'string'},
		{name:'desc_tensionservicio', type: 'string'},		
		{name:'desc_tipoestructura', type: 'string'},
		{name:'desc_tipoconductor', type: 'string'},
		{name:'desc_configuracionlt', type: 'string'},
		{name:'desc_valoraltura', type: 'numeric'},
		{name:'longitud', type: 'numeric'},	
		{name:'id_nivelcontaminacionlt', type: 'numeric'},		
		{name:'desc_nivelcontaminacionlt', type: 'string'},			
		{name:'id_areaprotegida', type: 'numeric'},		
		{name:'desc_areaprotegida', type: 'string'},		
		{name:'numddp', type: 'numeric'},
		{name:'nummontaje', type: 'numeric'},
		{name:'numoc', type: 'numeric'},
		{name:'numingenieria', type: 'numeric'},		
		{name:'numadmeje', type: 'numeric'},
		{name:'numsupero', type: 'numeric'},
		{name:'numcfinan', type: 'numeric'},
		{name:'numcaamb', type: 'numeric'},
		{name:'numcapred', type: 'numeric'},
		{name:'numcostototaluc', type: 'numeric'},
		{name:'id_revista', type: 'numeric'},	
		{name:'desc_revista', type: 'string'},
		{name:'desc_hilosguarda', type: 'string'},
		{name:'descripcionfull', type: 'string'},		
		{name:'id_bancoductos', type: 'numeric'},
		{name:'bancoductos', type: 'string'},	
		{name:'id_cajaempalme', type: 'numeric'},
		{name:'cajaempalme', type: 'string'},
		{name:'numaccesos', type: 'numeric'},
	],
	sortInfo:{
		field: 'codigo',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[		
			{
				url:'../../../sis_SINEX/vista/materiallt/Materialcantlt.php',
				title:'Equipos y Materiales',
				height:'45%',
				cls:'Materialcantlt'
			},		
			{
				url:'../../../sis_SINEX/vista/obracivillt/Obracivilcantlt.php',
				title:'Obra Civil',
				height:'45%',
				cls:'Obracivilcantlt'
			},
			{
				url:'../../../sis_SINEX/vista/montajelt/Montajecantlt.php',
				title:'Montaje',
				height:'45%',
				cls:'Montajecantlt'
			},
			{
				url:'../../../sis_SINEX/vista/unidadconstructivalt/ucltgastoscontratista.php',
				title:'Gastos del Contratista',
				height:'45%',
				cls:'ucltgastoscontratista'
			},
	        {
              	url:'../../../sis_SINEX/vista/unidadconstructivalt/ucltotrosgastos.php',
              	title:'Otros Gastos y Resumen General',
              	height:'45%',
              	cls:'ucltotrosgastos'
			}
		]
	}
)
</script>
		
		