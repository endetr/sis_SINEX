<?php
/**
*@package pXP
*@file gen-MODMaquinaria.php
*@author  (admin)
*@date 22-03-2018 19:06:44
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaquinaria extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaquinaria(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_maquinaria_sel';
		$this->transaccion='SNX_MAQ_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_maquinaria','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('potencia','numeric');
		$this->captura('peso','numeric');		
		$this->captura('maquinaria','varchar');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valor','numeric');
		$this->captura('valormat','numeric');
		$this->captura('id_factorindexacion','int4');
		$this->captura('desc_factorindexacion','varchar');
		$this->captura('id_tipopreciomaquinaria','int4');
		$this->captura('tipopreciomaquinaria','varchar');
		$this->captura('id_ambitoprecio','int4');
		$this->captura('ambitoprecio','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinaria_ime';
		$this->transaccion='SNX_MAQ_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('potencia','potencia','numeric');
		$this->setParametro('peso','peso','numeric');
		$this->setParametro('maquinaria','maquinaria','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');		
		$this->setParametro('id_tipopreciomaquinaria','id_tipopreciomaquinaria','int4');
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinaria_ime';
		$this->transaccion='SNX_MAQ_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinaria','id_maquinaria','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('potencia','potencia','numeric');
		$this->setParametro('peso','peso','numeric');
		$this->setParametro('maquinaria','maquinaria','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');
		$this->setParametro('id_tipopreciomaquinaria','id_tipopreciomaquinaria','int4');
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinaria_ime';
		$this->transaccion='SNX_MAQ_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinaria','id_maquinaria','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>