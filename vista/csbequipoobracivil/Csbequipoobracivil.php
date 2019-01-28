<?php
/**
*@package pXP
*@file gen-Csbequipoobracivil.php
*@author  (admin)
*@date 18-07-2018 13:37:38
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Csbequipoobracivil=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Csbequipoobracivil.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[		
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
				filters:{pfiltro:'ucsbeo.codigo',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'obracivil',
				fieldLabel: 'Obra Civil',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'ucsbeo.obracivil',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
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
				filters:{pfiltro:'ucsbeo.valorunitario',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'unidad',
				fieldLabel: 'Unidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'ucsbeo.unidad',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config:{
				name: 'cantidad',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucsbeo.cantidad',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config:{
				name: 'cantidadmate',
				fieldLabel: 'Cantidad Material',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucsbeo.cantidadmate',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'valortotal',
				fieldLabel: 'Valor Total',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ucsbeo.valortotal',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
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
	],
	tam_pag:50,	
	title:'ucsbequipoobracivil',
	ActList:'../../sis_SINEX/control/Csbequipoobracivil/listarCsbequipoobracivil',
	id_store:'id_obracivil',
	fields: [
		{name:'id_unidadconstructivasb', type: 'numeric'},
		{name:'codigo', type: 'string'},		
		{name:'descripcion', type: 'string'},	
		{name:'id_obracivil', type: 'string'},	
		{name:'obracivil', type: 'string'},
		{name:'cantidadmoc', type: 'numeric'},
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
		Phx.vista.Csbequipoobracivil.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivasb').setValue(this.maestro.id_unidadconstructivasb);
	},
	}
)
</script>
		
		