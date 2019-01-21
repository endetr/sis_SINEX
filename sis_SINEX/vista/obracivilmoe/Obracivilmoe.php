<?php
/**
*@package pXP
*@file gen-Obracivilmoe.php
*@author  (admin)
*@date 30-08-2018 18:19:48
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Obracivilmoe=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Obracivilmoe.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_obracivilmoe'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'obracivilmoe',
				fieldLabel: 'Obra Civil',
				allowBlank: false,
				anchor: '80%',
				gwidth: 400,
				maxLength:1000
			},
				type:'TextField',
				filters:{pfiltro:'obrci.obracivilmoe',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'strtransporte',
				fieldLabel: 'Transporte',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Obracivilmoe/listarObracivilTrans',
					id: 'strtransporte',
					root: 'datos',
					sortInfo: {
						field: 'strtransporte',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['strtransporte'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'strtransporte',
				displayField: 'strtransporte',
				gdisplayField: 'strtransporte',
				hiddenName: 'strtransporte',
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
					return String.format('{0}', record.data['strtransporte']);
				}
			},
				type:'ComboBox',
				id_grupo:0,
				filters:{pfiltro:'obrci.strtransporte',type:'string'},
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_unidad',
				fieldLabel: 'Unidad',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_SINEX/control/Unidad/listarUnidad',
					id: 'id_unidad',
					root: 'datos',
					sortInfo: {
						field: 'unidadabrev',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_unidad', 'unidadabrev'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_unidad',
				displayField: 'unidadabrev',
				gdisplayField: 'desc_unidadabrev',
				hiddenName: 'id_unidad',
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
					return String.format('{0}', record.data['desc_unidadabrev']);
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
				name: 'valorunitario',
				fieldLabel: 'Valor Unitario',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.valorunitario',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:false
		},		
		{
			config:{
				name: 'porccargasocial',
				fieldLabel: 'Porcentaje Cargas Sociales',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.porccargasocial',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcimpmanoobra',
				fieldLabel: 'Porcentaje Impuestos Mano de Obra',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.porcimpmanoobra',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcherramientas',
				fieldLabel: 'Porcentaje Herramientas',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.porcherramientas',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcgastosga',
				fieldLabel: 'Porcentaje Gastos Generales',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.porcgastosga',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},
		{
			config:{
				name: 'porcutilidad',
				fieldLabel: 'Porcentaje Utilidad',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.porcutilidad',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},	
		{
			config:{
				name: 'porcimpuestos',
				fieldLabel: 'Porcentaje Impuestos',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.porcimpuestos',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:true
		},		
		{
			config:{
				name: 'preciounitariorlp',
				fieldLabel: 'Precio Costo Unitario Revista la Paz',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.preciounitariorlp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'preciounitariorcb',
				fieldLabel: 'Precio Costo Unitario Revista Cochabamba',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.preciounitariorcb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'preciounitariorsc',
				fieldLabel: 'Precio Costo Unitario Revista Santa Cruz',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'obrci.preciounitariorsc',type:'numeric'},
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
				filters:{pfiltro:'obrci.estado_reg',type:'string'},
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
				filters:{pfiltro:'obrci.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'obrci.usuario_ai',type:'string'},
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
				filters:{pfiltro:'obrci.fecha_reg',type:'date'},
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
				filters:{pfiltro:'obrci.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Obra Civil',
	ActSave:'../../sis_SINEX/control/Obracivilmoe/insertarObracivilmoe',
	ActDel:'../../sis_SINEX/control/Obracivilmoe/eliminarObracivilmoe',
	ActList:'../../sis_SINEX/control/Obracivilmoe/listarObracivilmoe',
	id_store:'id_obracivilmoe',
	fields: [
		{name:'id_obracivilmoe', type: 'numeric'},
		{name:'porccargasocial', type: 'numeric'},
		{name:'id_unidad', type: 'numeric'},
		{name:'valorunitario', type: 'numeric'},
		{name:'porcimpuestos', type: 'numeric'},
		{name:'porcimpmanoobra', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'porcgastosga', type: 'numeric'},
		{name:'porcutilidad', type: 'numeric'},
		{name:'obracivilmoe', type: 'string'},
		{name:'strtransporte', type: 'string'},
		{name:'porcherramientas', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_unidadabrev', type: 'string'},		
		{name:'preciounitariorlp', type: 'numeric'},		
		{name:'preciounitariorcb', type: 'numeric'},
		{name:'preciounitariorsc', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_obracivilmoe',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabsouth:[
				{
					url:'../../../sis_SINEX/vista/ocmaterialmoe/Ocmaterialmoe.php',
					title:'Materiales',
					height:'35%',
					cls:'Ocmaterialmoe'
				},				
		        {
		          	url:'../../../sis_SINEX/vista/ocmanoobramoe/Ocmanoobramoe.php',
					title:'Mano de Obra',
					//width:400,
					height:'50%',
					cls:'Ocmanoobramoe'
		         },
		         {
					url:'../../../sis_SINEX/vista/ocmaquinariamoe/Ocmaquinariamoe.php',
					title:'Maquinaria',
					height:'35%',
					cls:'Ocmaquinariamoe'
				},
		        {
		          	url:'../../../sis_SINEX/vista/obracivilmoe/Otrosmoe.php',
					title:'Otros',
					//width:400,
					height:'50%',
					cls:'Otrosmoe'
		         }  
        ]	
	}
)
</script>
		
		