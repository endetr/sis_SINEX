<?php
/**
*@package pXP
*@file gen-MODUcsbmaquinaria.php
*@author  (admin)
*@date 09-07-2018 15:17:47
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcsbmaquinaria extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcsbmaquinaria(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucsbmaquinaria_sel';
		$this->transaccion='SNX_UCSBM_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucsbmaquinaria','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_maquinaria','int4');
		$this->captura('cantidadmaq','numeric');
		$this->captura('id_unidadconstructivasb','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('maquinaria','varchar');
		$this->captura('codigo','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('valorunitario','numeric');
		$this->captura('valortotal','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcsbmaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbmaquinaria_ime';
		$this->transaccion='SNX_UCSBM_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_maquinaria','id_maquinaria','int4');
		$this->setParametro('cantidadmaq','cantidadmaq','numeric');
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcsbmaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbmaquinaria_ime';
		$this->transaccion='SNX_UCSBM_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbmaquinaria','id_ucsbmaquinaria','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_maquinaria','id_maquinaria','int4');
		$this->setParametro('cantidadmaq','cantidadmaq','numeric');
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcsbmaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbmaquinaria_ime';
		$this->transaccion='SNX_UCSBM_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbmaquinaria','id_ucsbmaquinaria','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>