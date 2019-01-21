<?php
/**
*@package pXP
*@file gen-MODUcedifgrupo.php
*@author  (admin)
*@date 27-07-2018 14:52:40
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcedifgrupo extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcedifgrupo(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucedifgrupo_sel';
		$this->transaccion='SNX_UDG_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucedifgrupo','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('ucedifgrupo','varchar');
		$this->captura('id_unidadconstructivaedif','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
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
			
	function insertarUcedifgrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifgrupo_ime';
		$this->transaccion='SNX_UDG_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('ucedifgrupo','ucedifgrupo','varchar');
		$this->setParametro('id_unidadconstructivaedif','id_unidadconstructivaedif','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcedifgrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifgrupo_ime';
		$this->transaccion='SNX_UDG_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucedifgrupo','id_ucedifgrupo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('ucedifgrupo','ucedifgrupo','varchar');
		$this->setParametro('id_unidadconstructivaedif','id_unidadconstructivaedif','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcedifgrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifgrupo_ime';
		$this->transaccion='SNX_UDG_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucedifgrupo','id_ucedifgrupo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>