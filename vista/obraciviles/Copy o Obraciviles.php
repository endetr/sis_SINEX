<?php
/**
*@package pXP
*@file gen-Otrosgastos.php
*@author  (admin)
*@date 18-07-2018 15:01:57
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Otrosgastos=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Otrosgastos.superclass.constructor.call(this,config);
		this.init();
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
				name: 'obracivil',
				fieldLabel: 'Obra civil',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'obracivil',type:'string'},
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
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_obracivil',
				fieldLabel: 'id_obracivil',
			},
			type: 'Field',
			id_grupo: 0,
			form: true
		},
		{
			config:{
				name: 'codigo',
				fieldLabel: 'Codigo',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'codigo',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},		
		{
			config:{
				name: 'unidadbrev',
				fieldLabel: 'Unidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'unidadbrev',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'cantidadpeso',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'cantidadpeso',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorobracivil',
				fieldLabel: 'Valor Obracivil',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'valorobracivil',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
	],
	tam_pag:50,	
	title:'ucsbobrasciviles',
	ActList:'../../sis_SINEX/control/Obraciviles/listarOtrosgastos',
	id_store:'id_unidadconstructivasb',
	fields: [
		{name:'id_unidadconstructivasb', type: 'numeric'},
		{name:'codigo', type: 'string'},
		{name:'descripcion', type: 'string'},		
		{name:'otrosgastos', type: 'string'},
		{name:'cantidadog', type: 'numeric'},
		{name:'valorog', type: 'numeric'},	
		
	],
	sortInfo:{
		field: 'id_unidadconstructivasb',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivasb:this.maestro.id_unidadconstructivasb};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Otrosgastos.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivasb').setValue(this.maestro.id_unidadconstructivasb);
	},
	}
)
</script>
		
		