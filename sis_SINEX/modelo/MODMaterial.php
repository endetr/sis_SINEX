<?php
/**
*@package pXP
*@file gen-MODMaterial.php
*@author  (admin)
*@date 05-07-2018 13:08:59
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaterial extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaterial(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_material_sel';
		$this->transaccion='SNX_MAT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_material','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('peso','numeric');
		$this->captura('id_unidad','int4');
		$this->captura('material','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidad','varchar');
		$this->captura('valor','numeric');
		$this->captura('id_factorindexacion','int4');
		$this->captura('desc_factorindexacion','varchar');		
		$this->captura('id_ambitoprecio','int4');
		$this->captura('ambitoprecio','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_material_ime';
		$this->transaccion='SNX_MAT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('peso','peso','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('material','material','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');		
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_material_ime';
		$this->transaccion='SNX_MAT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_material','id_material','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('peso','peso','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('material','material','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_material_ime';
		$this->transaccion='SNX_MAT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_material','id_material','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>