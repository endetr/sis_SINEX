<?php
/**
*@package pXP
*@file gen-Unidadconstructivamo.php
*@author  (admin)
*@date 27-07-2018 15:39:11
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Unidadconstructivamo=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Unidadconstructivamo.superclass.constructor.call(this,config);
		this.init();
				
		this.addButton('copyuc', {
			text : 'Copiar',
			iconCls : 'brenew',
			disabled : false,
			handler : this.copyuc,
			tooltip : '<b>Copiar</b>'
		});
		this.addButton('resetcant', {
			text : 'Reset Cantidades',
			iconCls : 'bact',
			disabled : false,
			handler : this.resetcant,
			tooltip : '<b>Reset Cantidades</b>'
		});
		
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_unidadconstructivamo'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'codigo',
				fieldLabel: 'Código',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'TextField',
				filters:{pfiltro:'unconmo.codigo',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'descripcion',
				fieldLabel: 'Descripción',
				allowBlank: false,
				anchor: '80%',
				gwidth: 100,
				maxLength:100
			},
				type:'TextField',
				filters:{pfiltro:'unconmo.descripcion',type:'string'},
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
				filters:{pfiltro:'unconmo.estado_reg',type:'string'},
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
				filters:{pfiltro:'unconmo.id_usuario_ai',type:'numeric'},
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
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'unconmo.fecha_reg',type:'date'},
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
				filters:{pfiltro:'unconmo.usuario_ai',type:'string'},
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
				filters:{pfiltro:'unconmo.fecha_mod',type:'date'},
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
	title:'Módulo Común',
	ActSave:'../../sis_SINEX/control/Unidadconstructivamo/insertarUnidadconstructivamo',
	ActDel:'../../sis_SINEX/control/Unidadconstructivamo/eliminarUnidadconstructivamo',
	ActList:'../../sis_SINEX/control/Unidadconstructivamo/listarUnidadconstructivamo',
	id_store:'id_unidadconstructivamo',
	fields: [
		{name:'id_unidadconstructivamo', type: 'numeric'},
		{name:'codigo', type: 'string'},
		{name:'descripcion', type: 'string'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'valortotalrlp', type: 'numeric'},		
		{name:'valortotalrcb', type: 'numeric'},	
		{name:'valortotalrsc', type: 'numeric'},	
		
	],
	sortInfo:{
		field: 'id_unidadconstructivamo',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	
	tabeast:[
		{
			url:'../../../sis_SINEX/vista/ucmogrupo/Ucmogrupo.php',
			title:'Grupos',
			width:'50%',
			cls:'Ucmogrupo'
		},
		{
			url:'../../../sis_SINEX/vista/unidadconstructivamo/otrosgastos.php',
			title:'Otros gastos',
			height:'50%',
			cls:'otrosgastos'
		}],
		
		copyuc : function() {
			var rec = this.sm.getSelected();
			var data = rec.data;
			
			if (data) {
			Phx.CP.loadingShow();				
				Ext.Ajax.request({
					url : '../../sis_SINEX/control/Unidadconstructivamo/copiarUCMCC',
					params : {
						'id_unidadconstructivamo' : data.id_unidadconstructivamo			
					},
					success : function(data) {
						this.load({params:{start:0, limit:50}})
						this.successExport();		
					    },
						failure : this.conexionFailure,
						timeout : this.timeout,
						scope : this
					});
			}
		},
		
		resetcant : function() {
			var rec = this.sm.getSelected();
			var data = rec.data;
			
			if (data) {
				Phx.CP.loadingShow();
				
				Ext.Ajax.request({
					url : '../../sis_SINEX/control/Unidadconstructivamo/resetCantOBC',
					params : {
						'id_unidadconstructivamo' : data.id_unidadconstructivamo			
					},
					success : function(data) {
						this.load({params:{start:0, limit:50}})
						this.successExport();		
					    },
						failure : this.conexionFailure,
						timeout : this.timeout,
						scope : this
					});
			}
		 }	
	}
)
</script>
		
		