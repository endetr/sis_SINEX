<?php
/**
*@package pXP
*@file gen-Equipoobracivil.php
*@author  (admin)
*@date 13-11-2018 13:39:04
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Equipoobracivil=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Equipoobracivil.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_equipoobracivil'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType: 'hidden',
				name: 'id_obracivil',
				fieldLabel: 'id_obracivil',
				},
			type: 'Field',
			id_grupo: 0,
			form: true
		},
		{
			config: {
				inputType: 'hidden',
				name: 'id_equipo',
				fieldLabel: 'id_equipo',
				},
			type: 'Field',
			id_grupo: 0,
			form: true
		},
		{
			config:{
				name: 'desc_obracivil',
				fieldLabel: 'Obra Civil',
				allowBlank: true,
				anchor: '80%',
				gwidth: 250,
				maxLength:1179650
			},
				type:'Field',
				filters:{pfiltro:'ociv.obracivil',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'desc_unidad',
				fieldLabel: 'Unidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'Field',
				filters:{pfiltro:'uni.unidad',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'cantidadeoc',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'eocme.cantidadeoc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
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
				filters:{pfiltro:'eocme.estado_reg',type:'string'},
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
				filters:{pfiltro:'eocme.id_usuario_ai',type:'numeric'},
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
				filters:{pfiltro:'eocme.fecha_reg',type:'date'},
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
				filters:{pfiltro:'eocme.usuario_ai',type:'string'},
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
				filters:{pfiltro:'eocme.fecha_mod',type:'date'},
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
	title:'Obra Civil y Montaje Electromecánico - Equipos',
	ActSave:'../../sis_SINEX/control/Equipoobracivil/insertarEquipoobracivil',
	ActDel:'../../sis_SINEX/control/Equipoobracivil/eliminarEquipoobracivil',
	ActList:'../../sis_SINEX/control/Equipoobracivil/listarEquipoobracivil',
	id_store:'id_equipoobracivil',
	fields: [
		{name:'id_equipoobracivil', type: 'numeric'},
		{name:'id_obracivil', type: 'numeric'},
		{name:'cantidadeoc', type: 'numeric'},
		{name:'id_equipo', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_obracivil', type: 'string'},
		{name:'desc_unidad', type: 'string'},
		
	],
	sortInfo:{
		field: 'id_equipoobracivil',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_equipo:this.maestro.id_equipo};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Equipoobracivil.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_equipo').setValue(this.maestro.id_equipo);
	}
	}
)
</script>
		
		