<?php
/**
*@package pXP
*@file gen-Ucmogrupo.php
*@author  (admin)
*@date 27-07-2018 16:51:55
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ucmogrupo=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ucmogrupo.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ucmogrupo'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_unidadconstructivamo',
				fieldLabel: 'id_unidadconstructivamo',				
			},
			type: 'Field',
			id_grupo: 0,
			form: true
		},
		{
			config:{
				name: 'unmogrupo',
				fieldLabel: 'Grupo',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'ucmogr.unmogrupo',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},	
		{
			config:{
				name: 'valortotalrlp',
				fieldLabel: 'Valor Total (RLP)',
				allowBlank: true,				
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'TextField',
				filters:{pfiltro:'valortotalrlp',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},	
		{
			config:{
				name: 'valortotalrcb',
				fieldLabel: 'Valor Total (RCB)',
				allowBlank: true,				
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'TextField',
				filters:{pfiltro:'valortotalrcb',type:'numeric'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'valortotalrsc',
				fieldLabel: 'Valor Total (RSC)',
				allowBlank: true,				
				anchor: '80%',
				gwidth: 150,
				maxLength:1179650
			},
				type:'TextField',
				filters:{pfiltro:'valortotalrsc',type:'numeric'},
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
				filters:{pfiltro:'ucmogr.estado_reg',type:'string'},
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
				filters:{pfiltro:'ucmogr.fecha_reg',type:'date'},
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
				filters:{pfiltro:'ucmogr.usuario_ai',type:'string'},
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
				name: 'id_usuario_ai',
				fieldLabel: 'Creado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'ucmogr.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				filters:{pfiltro:'ucmogr.fecha_mod',type:'date'},
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
	title:'Grupo',
	ActSave:'../../sis_SINEX/control/Ucmogrupo/insertarUcmogrupo',
	ActDel:'../../sis_SINEX/control/Ucmogrupo/eliminarUcmogrupo',
	ActList:'../../sis_SINEX/control/Ucmogrupo/listarUcmogrupo',
	id_store:'id_ucmogrupo',
	fields: [
		{name:'id_ucmogrupo', type: 'numeric'},
		{name:'id_unidadconstructivamo', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'unmogrupo', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'valortotalrlp', type: 'numeric'},		
		{name:'valortotalrcb', type: 'numeric'},	
		{name:'valortotalrsc', type: 'numeric'},	
	],
	sortInfo:{
		field: 'id_ucmogrupo',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_unidadconstructivamo:this.maestro.id_unidadconstructivamo};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Ucmogrupo.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_unidadconstructivamo').setValue(this.maestro.id_unidadconstructivamo);
	},
	
	south:
		{
			url:'../../../sis_SINEX/vista/ucmoobracivil/Ucmoobracivil.php',
			title:'Obra Civil',
			height:'50%',
			cls:'Ucmoobracivil'
		}
	
	
	}
)
</script>
		
		