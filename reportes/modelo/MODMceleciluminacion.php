<?php
/**
*@package pXP
*@file gen-MODMceleciluminacion.php
*@author  (admin)
*@date 16-10-2018 20:00:25
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMceleciluminacion extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMceleciluminacion(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_mceleciluminacion_sel';
		$this->transaccion='SNX_MCIL_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_meleciluminacion','int4');
		$this->captura('tubopvc','numeric');
		$this->captura('totalcable','numeric');
		$this->captura('luminariaporpb','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_tensionservicio','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_tensionservicio','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMceleciluminacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_mceleciluminacion_ime';
		$this->transaccion='SNX_MCIL_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('tubopvc','tubopvc','numeric');
		$this->setParametro('totalcable','totalcable','numeric');
		$this->setParametro('luminariaporpb','luminariaporpb','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMceleciluminacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_mceleciluminacion_ime';
		$this->transaccion='SNX_MCIL_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_meleciluminacion','id_meleciluminacion','int4');
		$this->setParametro('tubopvc','tubopvc','numeric');
		$this->setParametro('totalcable','totalcable','numeric');
		$this->setParametro('luminariaporpb','luminariaporpb','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMceleciluminacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_mceleciluminacion_ime';
		$this->transaccion='SNX_MCIL_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_meleciluminacion','id_meleciluminacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>