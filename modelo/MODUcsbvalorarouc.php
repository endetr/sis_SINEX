<?php
/**
*@package pXP
*@file gen-MODUcsbvalorarouc.php
*@author  (admin)
*@date 13-11-2018 18:53:49
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcsbvalorarouc extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcsbvalorarouc(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucsbvalorarouc_sel';
		$this->transaccion='SNX_SBUC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucsbvalorarouc','int4');
		$this->captura('id_ucsbvalorar','int4');
		$this->captura('valortotal','numeric');
		$this->captura('codigo','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('cantidaditem','numeric');
		$this->captura('id_otraunidad','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('codigo_descripcion','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcsbvalorarouc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorarouc_ime';
		$this->transaccion='SNX_SBUC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbvalorar','id_ucsbvalorar','int4');
		$this->setParametro('valortotal','valortotal','numeric');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('cantidaditem','cantidaditem','numeric');
		$this->setParametro('id_otraunidad','id_otraunidad','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcsbvalorarouc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorarouc_ime';
		$this->transaccion='SNX_SBUC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbvalorarouc','id_ucsbvalorarouc','int4');
		$this->setParametro('id_ucsbvalorar','id_ucsbvalorar','int4');
		$this->setParametro('valortotal','valortotal','numeric');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('cantidaditem','cantidaditem','numeric');
		$this->setParametro('id_otraunidad','id_otraunidad','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcsbvalorarouc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorarouc_ime';
		$this->transaccion='SNX_SBUC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbvalorarouc','id_ucsbvalorarouc','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}

	function listarOtrasunidades(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_otrasunidadesconstructivas_sel';
		$this->transaccion='SNX_OUCSB_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_otraunidad','varchar');
		$this->captura('codigo','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('codigo_descripcion','varchar');
		$this->captura('valortotal','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}	
			
}
?>