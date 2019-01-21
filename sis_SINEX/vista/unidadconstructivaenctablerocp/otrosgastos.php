<?php

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.otrosgastos=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.otrosgastos.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivaenctablerocp'
			},
			type:'Field',
			form:true 
		},
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_item'
			},
			type:'Field',
			form:true 
		},
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_otrauc'
			},
			type:'Field',
			form:true 
		},	
		{
			config:{
				name: 'otrosgastos',
				fieldLabel: 'Otros Gastos',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'otrosgastos',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},		
		{
			config:{
				name: 'cantidadog',
				fieldLabel: 'Cantidad',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'cantidadog',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorunitario',
				fieldLabel: 'Valor Unitario',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179652
			},
				type:'NumberField',
				filters:{pfiltro:'valorunitario',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valorog',
				fieldLabel: 'Valor',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'valorog',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Otros Gastos',
	ActList:'../../sis_SINEX/control/Unidadconstructivaenctablerocp/listarOtrosgastos',
	id_store:'id_item',
	fields: [
		{name:'id_item', type: 'numeric'},
		{name:'id_otrauc', type: 'numeric'},
		{name:'otrosgastos', type: 'string'},		
		{name:'cantidadog', type: 'numeric'},
		{name:'valorunitario', type: 'numeric'},		
		{name:'valorog', type: 'numeric'},
	],
	sortInfo:{
		field: 'id_item',
		direction: 'ASC'
	},
	bdel:false,
	bsave:false,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivaenctablerocp:this.maestro.id_unidadconstructivaenctablerocp};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.otrosgastos.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivaenctablerocp').setValue(this.maestro.id_unidadconstructivaenctablerocp);
	}
	}
)
</script>	
		