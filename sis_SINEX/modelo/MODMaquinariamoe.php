<?php
/**
*@package pXP
*@file gen-MODMaquinariamoe.php
*@author  (admin)
*@date 29-08-2018 18:34:19
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaquinariamoe extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaquinariamoe(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_maquinariamoe_sel';
		$this->transaccion='SNX_MAQMOE_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_maquinariamoe','int4');
		$this->captura('valorunitariorcb','numeric');
		$this->captura('id_unidad','int4');
		$this->captura('valorunitariorlp','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('valorunitariorsc','numeric');
		$this->captura('maquinariamoe','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidadabrev','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaquinariamoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariamoe_ime';
		$this->transaccion='SNX_MAQMOE_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('valorunitariorcb','valorunitariorcb','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorunitariorlp','valorunitariorlp','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valorunitariorsc','valorunitariorsc','numeric');
		$this->setParametro('maquinariamoe','maquinariamoe','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaquinariamoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariamoe_ime';
		$this->transaccion='SNX_MAQMOE_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinariamoe','id_maquinariamoe','int4');
		$this->setParametro('valorunitariorcb','valorunitariorcb','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorunitariorlp','valorunitariorlp','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valorunitariorsc','valorunitariorsc','numeric');
		$this->setParametro('maquinariamoe','maquinariamoe','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaquinariamoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariamoe_ime';
		$this->transaccion='SNX_MAQMOE_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinariamoe','id_maquinariamoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>