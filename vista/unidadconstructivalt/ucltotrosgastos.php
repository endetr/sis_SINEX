<?php

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.ucltotrosgastos=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.ucltotrosgastos.superclass.constructor.call(this,config);
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
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_descripcion'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'descripcion',
				fieldLabel: 'Descripción',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'unidad',
				fieldLabel: 'Unidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'unidad',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},		
		{
			config:{
				name: 'costobase',
				fieldLabel: 'Costo Base',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'costobase',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'cantidaditem',
				fieldLabel: 'Cant./Porc.',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'cantidaditem',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'costototal',
				fieldLabel: 'Costo Total',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'costototal',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Otros Gastos y Resumen General',
	ActList:'../../sis_SINEX/control/Unidadconstructivalt/listarOtrosgastoslt',
	id_store:'id_descripcion',
	fields: [
		{name:'id_unidadconstructivalt', type: 'numeric'},
		{name:'id_descripcion', type: 'numeric'},
		{name:'descripcion', type: 'string'},		
		{name:'costobase', type: 'numeric'},
		{name:'cantidaditem', type: 'numeric'},		
		{name:'costototal', type: 'numeric'},	
		{name:'unidad', type: 'string'},
	],
	sortInfo:{
		field: 'id_descripcion',
		direction: 'ASC'
	},
	bdel:false,
	bsave:false,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivalt:this.maestro.id_unidadconstructivalt};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.ucltotrosgastos.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivalt').setValue(this.maestro.id_unidadconstructivalt);
	}
	}
)
</script>
		
		