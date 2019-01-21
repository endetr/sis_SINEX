<?php
/**
*@package pXP
*@file gen-Unidadconstructivamcelec.php
*@author  (admin)
*@date 16-10-2018 20:00:28
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivamcelec=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivamcelec.superclass.constructor.call(this,config);
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
					name: 'id_unidadconstructivamcelec'
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
				filters:{pfiltro:'mcuc.codigo',type:'string'},
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
				maxLength:1000
			},
				type:'TextField',
				filters:{pfiltro:'mcuc.descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_tensionservicio',
				fieldLabel: 'Tensión Servicio',
				allowBlank: true,
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
				anchor: '100%',
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
				name: 'id_claseaislacion',
				fieldLabel: 'Clase Aislamiento',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Claseaislacion/listarClaseaislacion',
					id: 'id_claseaislacion',
					root: 'datos',
					sortInfo: {
						field: 'claseaislacion',
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
				anchor: '100%',
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
			form: true
		},		
		{
			config:{
				name: 'numerobahias',
				fieldLabel: 'Número de bahias',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'mcuc.numerobahias',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'areasub',
				fieldLabel: 'Área Subestación (m2)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'mcuc.areasub',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},					
		{
			config:{
				name: 'longitudvia',
				fieldLabel: 'Longitud de Vías (m)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'mcuc.longitudvia',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},			
		{
			config:{
				name: 'totalitems',
				fieldLabel: 'Total Ítems',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'mcuc.totalitems',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'totalog',
				fieldLabel: 'Total Otros Gastos',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'mcuc.totalitems',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'totaluc',
				fieldLabel: 'Total General',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'mcuc.totalitems',type:'numeric'},
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
				filters:{pfiltro:'mcuc.estado_reg',type:'string'},
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
				filters:{pfiltro:'mcuc.usuario_ai',type:'string'},
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
				filters:{pfiltro:'mcuc.fecha_reg',type:'date'},
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
				filters:{pfiltro:'mcuc.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'mcuc.fecha_mod',type:'date'},
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
	title:'MC Unida Constructiva',
	ActSave:'../../sis_SINEX/control/Unidadconstructivamcelec/insertarUnidadconstructivamcelec',
	ActDel:'../../sis_SINEX/control/Unidadconstructivamcelec/eliminarUnidadconstructivamcelec',
	ActList:'../../sis_SINEX/control/Unidadconstructivamcelec/listarUnidadconstructivamcelec',
	id_store:'id_unidadconstructivamcelec',
	fields: [
		{name:'id_unidadconstructivamcelec', type: 'numeric'},
		{name:'codigo', type: 'string'},
		{name:'areasub', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'numerobahias', type: 'numeric'},
		{name:'longitudvia', type: 'numeric'},
		{name:'id_claseaislacion', type: 'numeric'},
		{name:'descripcion', type: 'string'},
		{name:'id_tensionservicio', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_claseaislacion', type: 'string'},
		{name:'desc_tensionservicio', type: 'string'},
		{name:'totalitems', type: 'numeric'},
		{name:'totalog', type: 'numeric'},
		{name:'totaluc', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_unidadconstructivamcelec',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[
		{
			url:'../../../sis_SINEX/vista/ucmceitem/Ucmceitem.php',
			title:'Items',
			height:'50%',
			cls:'Ucmceitem'
		},
		{
			url:'../../../sis_SINEX/vista/unidadconstructivamcelec/ucmcelecotrosgastos.php',
			title:'Otros gastos',
			height:'50%',
			cls:'ucmcelecotrosgastos'
		}
	],
	
	copyuc : function() {
			var rec = this.sm.getSelected();
			var data = rec.data;
			
			if (data) {
			Phx.CP.loadingShow();				
				Ext.Ajax.request({
					url : '../../sis_SINEX/control/Unidadconstructivamcelec/copiarUCMCE',
					params : {
						'id_unidadconstructivamcelec' : data.id_unidadconstructivamcelec			
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
		},
			
	}
)
</script>
		
		