<?php
/**
*@package pXP
*@file gen-MODUcsbequipo.php
*@author  (admin)
*@date 09-07-2018 17:58:19
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcsbequipo extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcsbequipo(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucsbequipo_sel';
		$this->transaccion='SNX_UCSBE_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucsbequipo','int4');
		$this->captura('id_unidadconstructivasb','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('cantidadequ','numeric');
		$this->captura('id_equipo','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_equipo','varchar');
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
			
	function insertarUcsbequipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbequipo_ime';
		$this->transaccion='SNX_UCSBE_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadequ','cantidadequ','numeric');
		$this->setParametro('id_equipo','id_equipo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcsbequipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbequipo_ime';
		$this->transaccion='SNX_UCSBE_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbequipo','id_ucsbequipo','int4');
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadequ','cantidadequ','numeric');
		$this->setParametro('id_equipo','id_equipo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcsbequipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbequipo_ime';
		$this->transaccion='SNX_UCSBE_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbequipo','id_ucsbequipo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>