<?php
/**
*@package pXP
*@file gen-Ucedifsubgrupo.php
*@author  (admin)
*@date 27-07-2018 14:52:38
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Ucedifsubgrupo=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Ucedifsubgrupo.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_ucedifsubgrupo'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				inputType:'hidden',
				name: 'id_ucedifgrupo',
				fieldLabel: 'id_ucedifgrupo',				
			},
			type: 'Field',
			id_grupo: 0,
			form: true
		},		
		{
			config:{
				name: 'ucedifsubgrupo',
				fieldLabel: 'SubGrupo',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'udsg.ucedifsubgrupo',type:'string'},
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
				filters:{pfiltro:'udsg.estado_reg',type:'string'},
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
				filters:{pfiltro:'udsg.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				name: 'usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'TextField',
				filters:{pfiltro:'udsg.usuario_ai',type:'string'},
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
				filters:{pfiltro:'udsg.fecha_reg',type:'date'},
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
				filters:{pfiltro:'udsg.fecha_mod',type:'date'},
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
	title:'SubGrupos',
	ActSave:'../../sis_SINEX/control/Ucedifsubgrupo/insertarUcedifsubgrupo',
	ActDel:'../../sis_SINEX/control/Ucedifsubgrupo/eliminarUcedifsubgrupo',
	ActList:'../../sis_SINEX/control/Ucedifsubgrupo/listarUcedifsubgrupo',
	id_store:'id_ucedifsubgrupo',
	fields: [
		{name:'id_ucedifsubgrupo', type: 'numeric'},
		{name:'id_ucedifgrupo', type: 'numeric'},
		{name:'ucedifsubgrupo', type: 'string'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'valortotalrlp', type: 'numeric'},		
		{name:'valortotalrcb', type: 'numeric'},	
		{name:'valortotalrsc', type: 'numeric'},
	],
	sortInfo:{
		field: 'id_ucedifsubgrupo',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	south:
		{
			url:'../../../sis_SINEX/vista/ucedifobracivil/Ucedifobracivil.php',
			title:'Obra civil',
			height:'55%',
			cls:'Ucedifobracivil'
		},
		
	onReloadPage:function(m){
		this.maestro=m;
		this.store.baseParams={id_ucedifgrupo:this.maestro.id_ucedifgrupo};
		this.load({params:{start:0, limit:50}})
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Ucedifsubgrupo.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_ucedifgrupo').setValue(this.maestro.id_ucedifgrupo);
	}
	}
)
</script>
		
		