<?php
/**
*@package pXP
*@file gen-MODEquipo.php
*@author  (admin)
*@date 22-03-2018 12:58:05
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODEquipo extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarEquipo(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_equipo_sel';
		$this->transaccion='SNX_EQU_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_equipo','int4');
		$this->captura('equipo','varchar');
		$this->captura('id_claseaislacion','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_claseaislacion','varchar');	
		$this->captura('valor','numeric');
		$this->captura('valormat','numeric');
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
			
	function insertarEquipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipo_ime';
		$this->transaccion='SNX_EQU_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('equipo','equipo','varchar');
		$this->setParametro('id_claseaislacion','id_claseaislacion','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');		
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarEquipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipo_ime';
		$this->transaccion='SNX_EQU_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipo','id_equipo','int4');
		$this->setParametro('equipo','equipo','varchar');
		$this->setParametro('id_claseaislacion','id_claseaislacion','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');	
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarEquipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipo_ime';
		$this->transaccion='SNX_EQU_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipo','id_equipo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>