<?php
/**
*@package pXP
*@file gen-MODUcltvalorar.php
*@author  (admin)
*@date 01-11-2018 14:22:48
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcltvalorar extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcltvalorar(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucltvalorar_sel';
		$this->transaccion='SNX_VPUCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucltvalorar','int4');
		$this->captura('codigoproy','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('nombreproy','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valorproyecto','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
	
	function obtenerproyectoUCLT(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucltvalorar_sel';
		$this->transaccion='SNX_VPUCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
		$this->setCount(false);
						
		$this->setParametro('id_ucltvalorar','id_ucltvalorar','int4');				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucltvalorar','int4');
		$this->captura('codigoproy','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('nombreproy','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valorproyecto','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcltvalorar(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucltvalorar_ime';
		$this->transaccion='SNX_VPUCLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('codigoproy','codigoproy','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('nombreproy','nombreproy','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcltvalorar(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucltvalorar_ime';
		$this->transaccion='SNX_VPUCLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucltvalorar','id_ucltvalorar','int4');
		$this->setParametro('codigoproy','codigoproy','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('nombreproy','nombreproy','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcltvalorar(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucltvalorar_ime';
		$this->transaccion='SNX_VPUCLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucltvalorar','id_ucltvalorar','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>