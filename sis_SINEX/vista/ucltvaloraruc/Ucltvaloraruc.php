<?php
/**
*@package pXP
*@file gen-Ucltvaloraruc.php
*@author  (admin)
*@date 01-11-2018 15:13:41
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ucltvaloraruc=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ucltvaloraruc.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ucltvaloraruc'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_ucltvalorar',
				fieldLabel: 'id_ucltvalorar',				
					},					
			type: 'Field',
			id_grupo: 0,			
			form: true
		},
		{
			config: {
				name: 'id_unidadconstructivalt',
				fieldLabel: ' Unidad Constructiva',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Unidadconstructivalt/listarUnidadconstructivaltddl',
					id: 'id_unidadconstructivalt',
					root: 'datos',
					sortInfo: {
						field: 'descripcionfull',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_unidadconstructivalt', 'descripcionfull'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_unidadconstructivalt',
				displayField: 'descripcionfull',
				gdisplayField: 'desc_descripcionfull',
				hiddenName: 'id_unidadconstructivalt',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 16,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_descripcionfull']);
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
				name: 'codigo',
				fieldLabel: 'Código',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'vuclt.codigo',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},			
		{
			config:{
				name: 'descripcion',
				fieldLabel: 'Descripción',
				allowBlank: true,
				anchor: '80%',
				gwidth: 250,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'vuclt.descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'tipolinea',
				fieldLabel: 'Tipo de Línea',	
				gwidth: 150,			
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},		
		{
			config:{
				name: 'tensionservicio',
				fieldLabel: 'Tensión Servicio',		
				gwidth: 150,		
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'longitud',
				fieldLabel: 'Longitud (km)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179653
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.longitud',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'numddp',
				fieldLabel: 'DDP',
			},
				type:'Field',
				filters:{pfiltro:'vuclt.numddp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'nummontaje',
				fieldLabel: 'Montaje',
			},
				type:'Field',
				filters:{pfiltro:'vuclt.nummontaje',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numoc',
				fieldLabel: 'Obra Civil',
			},
				type:'Field',
				filters:{pfiltro:'vuclt.numoc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numingenieria',
				fieldLabel: 'Ingeniería',
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numingenieria',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'numinspeccion',
				fieldLabel: 'Inspección',
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numinspeccion',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'numadmeje',
				fieldLabel: 'Administración Ejecución',
				gwidth: 200,
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numadmeje',type:'numeric'},
				id_grupo:1,				
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numsupero',
				fieldLabel: 'Supervición de Obra',
				gwidth: 170,
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numsupero',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'numcfinan',
				fieldLabel: 'Costos Financieros',
				gwidth: 170,
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numcfinan',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numcaamb',
				fieldLabel: 'Costos Aspectos Ambientales',
				gwidth: 200,
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numcaamb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},			
		{
			config:{
				name: 'numcapred',
				fieldLabel: 'Costos Aspectos Prediales',
				gwidth: 200,
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numcapred',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},				
		{
			config:{
				name: 'numcostototaluc',
				fieldLabel: 'Costo Total UC (USD/km)',
				gwidth: 200,
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numcostototaluc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'numcostototaluct',
				fieldLabel: 'Costo Total UC (USD)',
				gwidth: 170,
			},
				type:'NumberField',
				filters:{pfiltro:'vuclt.numcostototaluc',type:'numeric'},
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
				filters:{pfiltro:'vuclt.estado_reg',type:'string'},
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
				filters:{pfiltro:'vuclt.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				filters:{pfiltro:'vuclt.fecha_reg',type:'date'},
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
				filters:{pfiltro:'vuclt.usuario_ai',type:'string'},
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
				filters:{pfiltro:'vuclt.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Unidades Constructivas',
	ActSave:'../../sis_SINEX/control/Ucltvaloraruc/insertarUcltvaloraruc',
	ActDel:'../../sis_SINEX/control/Ucltvaloraruc/eliminarUcltvaloraruc',
	ActList:'../../sis_SINEX/control/Ucltvaloraruc/listarUcltvaloraruc',
	id_store:'id_ucltvaloraruc',
	fields: [
		{name:'id_ucltvaloraruc', type: 'numeric'},
		{name:'id_ucltvalorar', type: 'numeric'},
		{name:'id_tipolinea', type: 'numeric'},
		{name:'tipolinea', type: 'string'},
		{name:'id_tensionservicio', type: 'numeric'},
		{name:'tensionservicio', type: 'string'},
		{name:'descripcion', type: 'string'},
		{name:'numoc', type: 'numeric'},
		{name:'numingenieria', type: 'numeric'},
		{name:'codigo', type: 'string'},
		{name:'numadmeje', type: 'numeric'},
		{name:'numcostototaluc', type: 'numeric'},
		{name:'id_unidadconstructivalt', type: 'numeric'},
		{name:'numinspeccion', type: 'numeric'},
		{name:'numcapred', type: 'numeric'},
		{name:'numddp', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'numsupero', type: 'numeric'},
		{name:'longitud', type: 'numeric'},
		{name:'nummontaje', type: 'numeric'},
		{name:'numcaamb', type: 'numeric'},
		{name:'numcfinan', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'numcostototaluct', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_ucltvaloraruc',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_ucltvalorar:this.maestro.id_ucltvalorar};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Ucltvaloraruc.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_ucltvalorar').setValue(this.maestro.id_ucltvalorar);
	},
	
	}
)
</script>
		
		