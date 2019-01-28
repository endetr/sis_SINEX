<?php
/**
*@package pXP
*@file gen-Montajelcantt.php
*@author  (admin)
*@date 19-07-2018 12:33:51
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Montajecantlt=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Montajecantlt.superclass.constructor.call(this,config);
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
				name: 'grupo',
				fieldLabel: 'Grupo',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:200
			},
				type:'TextField',
				filters:{pfiltro:'monlt.grupo',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'item',
				fieldLabel: 'Ítem',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:200
			},
				type:'TextField',
				filters:{pfiltro:'monlt.item',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'unidadabrev',
				fieldLabel: 'Unidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:200
			},
				type:'TextField',
				filters:{pfiltro:'monlt.unidadabrev',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},		
		{
			config:{
				name: 'cantidaditem',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'cantidaditem',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config:{
				name: 'costounitari',
				fieldLabel: 'Costo Unitario (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'costounitari',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config:{
				name: 'costototal',
				fieldLabel: 'Costo Total (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'costototal',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		}
	],
	tam_pag:50,	
	title:'Montaje Líneas',
	ActList:'../../sis_SINEX/control/Montajelt/listarMontajecantlt',
	id_store:'id_item',
	fields: [
		{name:'id_unidadconstructivalt', type: 'numeric'},
		{name:'id_grupo', type: 'numeric'},
		{name:'grupo', type: 'string'},
		{name:'id_item', type: 'numeric'},
		{name:'item', type: 'string'},		
		{name:'id_unidad', type: 'numeric'},
		{name:'unidadabrev', type: 'string'},
		{name:'cantidaditem', type: 'numeric'},
		{name:'costounitari', type: 'numeric'},
		{name:'costototal', type: 'numeric'},
		
	],
	sortInfo:{
		field: 'id_item',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
		
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivalt:this.maestro.id_unidadconstructivalt};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Montajecantlt.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivalt').setValue(this.maestro.id_unidadconstructivalt);
	},
	}
)
</script>
		
		