<?php
/**
*@package pXP
*@file gen-MODMaquinariaobracivil.php
*@author  (admin)
*@date 13-11-2018 13:55:26
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaquinariaobracivil extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaquinariaobracivil(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_maquinariaobracivil_sel';
		$this->transaccion='SNX_MOCME_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_maquinariaobracivil','int4');
		$this->captura('id_obracivil','int4');
		$this->captura('id_maquinaria','int4');
		$this->captura('cantidadmoc','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_obracivil','varchar');
		$this->captura('desc_unidad','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaquinariaobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariaobracivil_ime';
		$this->transaccion='SNX_MOCME_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivil','id_obracivil','int4');
		$this->setParametro('id_maquinaria','id_maquinaria','int4');
		$this->setParametro('cantidadmoc','cantidadmoc','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaquinariaobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariaobracivil_ime';
		$this->transaccion='SNX_MOCME_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinariaobracivil','id_maquinariaobracivil','int4');
		$this->setParametro('id_obracivil','id_obracivil','int4');
		$this->setParametro('id_maquinaria','id_maquinaria','int4');
		$this->setParametro('cantidadmoc','cantidadmoc','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaquinariaobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariaobracivil_ime';
		$this->transaccion='SNX_MOCME_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinariaobracivil','id_maquinariaobracivil','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>