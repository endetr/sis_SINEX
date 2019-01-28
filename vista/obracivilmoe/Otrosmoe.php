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
	Phx.vista.Otrosmoe=Ext.extend(Phx.gridInterfaz,{
		
		constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Otrosmoe.superclass.constructor.call(this,config);
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
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_otromoe'
			},
			type:'Field',
			form:true 
		},		
		{
			config:{
				name: 'otromoe',
				fieldLabel: 'Otros',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'otromoe',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'cantidadocmoe',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'cantidadocmoe',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorunitariorlpusd',
				fieldLabel: 'Valor Unitario Revista la Paz (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.valorunitariorlpusd',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'valorunitariorcbusd',
				fieldLabel: 'Valor Unitario Revista Cochabamba (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.valorunitariorcbusd',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'valorunitariorscusd',
				fieldLabel: 'Valor Unitario Revista Santa Cruz (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.valorunitariorscusd',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costototalrlp',
				fieldLabel: 'Costo Total Revista la Paz (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.costototalrlp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costototalrcb',
				fieldLabel: 'Costo Total Revista Cochabamba (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.costototalrcb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'costototalrsc',
				fieldLabel: 'Costo Total Revista Santa Cruz (USD)',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'ocm.costototalrsc',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
	],
	
	tam_pag:50,	
	title:'Otros',
	ActList:'../../sis_SINEX/control/Obracivilmoe/listarOtrosmoe',
	id_store:'id_otromoe',
	fields: [
		{name:'id_obracivilmoe', type: 'numeric'},
		{name:'id_otromoe', type: 'numeric'},
		{name:'otromoe', type: 'string'},
		{name:'cantidadocmoe', type: 'numeric'},		
		{name:'valorunitariorlpusd', type: 'numeric'},
		{name:'valorunitariorcbusd', type: 'numeric'},	
		{name:'valorunitariorscusd', type: 'numeric'},
		{name:'costototalrlp', type: 'numeric'},	
		{name:'costototalrcb', type: 'numeric'},
		{name:'costototalrsc', type: 'numeric'},			
	],
	sortInfo:{
		field: 'id_obracivilmoe',
		direction: 'ASC'
	},
	bdel:false,
	bsave:false,

	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_obracivilmoe:this.maestro.id_obracivilmoe};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Otrosmoe.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_obracivilmoe').setValue(this.maestro.id_obracivilmoe);
	},

	}
)
</script>