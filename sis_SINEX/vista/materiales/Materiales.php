<?php
/**
*@package pXP
*@file gen-Materiales.php
*@author  (admin)
*@date 16-07-2018 14:29:09
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Materiales=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Materiales.superclass.constructor.call(this,config);
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
				name: 'codigo',
				fieldLabel: 'Codigo',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'ucsbm.codigo',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'descripcion',
				fieldLabel: 'Unidad constructiva',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:200
			},
				type:'TextField',
				filters:{pfiltro:'ucsbm.descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'material',
				fieldLabel: 'Material',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'ucsbm.material',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_material',
				fieldLabel: 'id_material',
			},
			type: 'Field',
			id_grupo: 0,			
			form: true
		},
		{
			config:{
				name: 'cantidadmate',
				fieldLabel: 'Cantidad Material',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorunitario',
				fieldLabel: 'Valor Unitario',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valortotal',
				fieldLabel: 'Valor Total',				
			},
				type:'Field',
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,
	title:'ucsbmateriales',
	ActList:'../../sis_SINEX/control/Materiales/listarMateriales',
	id_store:'id_material',
	fields: [
		{name:'id_unidadconstructivasb', type: 'numeric'},
		{name:'codigo', type: 'string'},
		{name:'descripcion', type: 'string'},		
		{name:'id_material', type: 'numeric'},
		{name:'material', type: 'string'},			
		{name:'cantidadmate', type: 'numeric'},
		{name:'valorunitario', type: 'numeric'},
		{name:'valortotal', type: 'numeric'},
		
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
		Phx.vista.Materiales.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivasb').setValue(this.maestro.id_unidadconstructivasb);
	},
	}
)
</script>
		
		