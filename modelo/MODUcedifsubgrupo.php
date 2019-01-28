<?php
/**
*@package pXP
*@file gen-MODUcedifsubgrupo.php
*@author  (admin)
*@date 27-07-2018 14:52:38
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcedifsubgrupo extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcedifsubgrupo(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucedifsubgrupo_sel';
		$this->transaccion='SNX_UDSG_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucedifsubgrupo','int4');
		$this->captura('id_ucedifgrupo','int4');
		$this->captura('ucedifsubgrupo','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valortotalrlp','numeric');
		$this->captura('valortotalrcb','numeric');	
		$this->captura('valortotalrsc','numeric');	
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcedifsubgrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifsubgrupo_ime';
		$this->transaccion='SNX_UDSG_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucedifgrupo','id_ucedifgrupo','int4');
		$this->setParametro('ucedifsubgrupo','ucedifsubgrupo','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcedifsubgrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifsubgrupo_ime';
		$this->transaccion='SNX_UDSG_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucedifsubgrupo','id_ucedifsubgrupo','int4');
		$this->setParametro('id_ucedifgrupo','id_ucedifgrupo','int4');
		$this->setParametro('ucedifsubgrupo','ucedifsubgrupo','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcedifsubgrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifsubgrupo_ime';
		$this->transaccion='SNX_UDSG_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucedifsubgrupo','id_ucedifsubgrupo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>