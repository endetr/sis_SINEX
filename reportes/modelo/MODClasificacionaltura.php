<?php
/**
*@package pXP
*@file gen-MODClasificacionaltura.php
*@author  (admin)
*@date 12-06-2018 14:56:15
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODClasificacionaltura extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarClasificacionaltura(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_clasificacionaltura_sel';
		$this->transaccion='SNX_CFA_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_clasificacionaltura','int4');
		$this->captura('valoraltura','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');				
			
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarClasificacionaltura(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_clasificacionaltura_ime';
		$this->transaccion='SNX_CFA_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('valoraltura','valoraltura','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarClasificacionaltura(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_clasificacionaltura_ime';
		$this->transaccion='SNX_CFA_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_clasificacionaltura','id_clasificacionaltura','int4');
		$this->setParametro('valoraltura','valoraltura','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarClasificacionaltura(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_clasificacionaltura_ime';
		$this->transaccion='SNX_CFA_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_clasificacionaltura','id_clasificacionaltura','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>