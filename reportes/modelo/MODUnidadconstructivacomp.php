<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivacomp.php
*@author  (admin)
*@date 11-10-2018 19:56:16
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivacomp extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivacomp(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivacomp_sel';
		$this->transaccion='SNX_UCC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivacomp','int4');
		$this->captura('unidadconstructivacomp','varchar');
		$this->captura('valor','numeric');
		$this->captura('capacidad','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('codigo_unicomp','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valortotal','numeric');		
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivacomp(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivacomp_ime';
		$this->transaccion='SNX_UCC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('unidadconstructivacomp','unidadconstructivacomp','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('capacidad','capacidad','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('codigo_unicomp','codigo_unicomp','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivacomp(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivacomp_ime';
		$this->transaccion='SNX_UCC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivacomp','id_unidadconstructivacomp','int4');
		$this->setParametro('unidadconstructivacomp','unidadconstructivacomp','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('capacidad','capacidad','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('codigo_unicomp','codigo_unicomp','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivacomp(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivacomp_ime';
		$this->transaccion='SNX_UCC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivacomp','id_unidadconstructivacomp','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>