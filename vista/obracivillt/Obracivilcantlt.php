<?php
/**
*@package pXP
*@file gen-Obracivilcantlt.php
*@author  (admin)
*@date 25-07-2018 14:56:53
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Obracivilcantlt=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Obracivilcantlt.superclass.constructor.call(this,config);
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
				name: 'terrenolt',
				fieldLabel: 'Terreno',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'oclt.terrenolt',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config:{
				name: 'funcionestructura',
				fieldLabel: 'Estructura',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'oclt.funcionestructura',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config:{
				name: 'tipocimentacion',
				fieldLabel: 'Cimentación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'oclt.tipocimentacion',type:'string'},
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
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'cantidaditem',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'cosotunitariooc',
				fieldLabel: 'Costo Unitario (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'cosotunitariooc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'costototaloc',
				fieldLabel: 'Costo Total (USD)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'costototaloc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'pesounitariooc',
				fieldLabel: 'Peso Unitario (Ton)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'pesounitariooc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'pesototaloc',
				fieldLabel: 'Peso Total (Ton)',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'pesototaloc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:true
		}
	],
	tam_pag:50,	
	title:'Obra Civil LT',
	ActList:'../../sis_SINEX/control/Obracivillt/listarObracivilcantlt',
	id_store:'id_obracivillt',
	fields: [
		{name:'id_unidadconstructivalt', type: 'numeric'},
		{name:'terrenolt', type: 'string'},
		{name:'funcionestructura', type: 'string'},
		{name:'tipocimentacion', type: 'string'},
		{name:'cantidaditem', type: 'numeric'},
		{name:'cosotunitariooc', type: 'numeric'},		
		{name:'costototaloc', type: 'numeric'},
		{name:'pesounitariooc', type: 'numeric'},
		{name:'pesototaloc', type: 'numeric'},	
	],
	sortInfo:{
		field: 'id_obracivillt',
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
		Phx.vista.Obracivilcantlt.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivalt').setValue(this.maestro.id_unidadconstructivalt);
	}
	}
)
</script>
		
		