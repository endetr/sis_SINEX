<?php
/**
*@package pXP
*@file gen-MODTipoconductor.php
*@author  (admin)
*@date 19-07-2018 15:46:01
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTipoconductor extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTipoconductor(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tipoconductor_sel';
		$this->transaccion='SNX_TPC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tipoconductor','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_tensionservicio','int4');
		$this->captura('tipoconductor','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_tensionservicio','varchar');
		$this->captura('desc_tipoconductor','varchar');		
			
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarTipoconductor(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipoconductor_ime';
		$this->transaccion='SNX_TPC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('tipoconductor','tipoconductor','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTipoconductor(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipoconductor_ime';
		$this->transaccion='SNX_TPC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipoconductor','id_tipoconductor','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('tipoconductor','tipoconductor','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTipoconductor(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipoconductor_ime';
		$this->transaccion='SNX_TPC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipoconductor','id_tipoconductor','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>