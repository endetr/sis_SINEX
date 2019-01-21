<?php
/**
*@package pXP
*@file gen-MODEquipoobracivil.php
*@author  (admin)
*@date 13-11-2018 13:39:04
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODEquipoobracivil extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarEquipoobracivil(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_equipoobracivil_sel';
		$this->transaccion='SNX_EOCME_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_equipoobracivil','int4');
		$this->captura('id_obracivil','int4');
		$this->captura('cantidadeoc','numeric');
		$this->captura('id_equipo','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarEquipoobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipoobracivil_ime';
		$this->transaccion='SNX_EOCME_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivil','id_obracivil','int4');
		$this->setParametro('cantidadeoc','cantidadeoc','numeric');
		$this->setParametro('id_equipo','id_equipo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarEquipoobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipoobracivil_ime';
		$this->transaccion='SNX_EOCME_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipoobracivil','id_equipoobracivil','int4');
		$this->setParametro('id_obracivil','id_obracivil','int4');
		$this->setParametro('cantidadeoc','cantidadeoc','numeric');
		$this->setParametro('id_equipo','id_equipo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarEquipoobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipoobracivil_ime';
		$this->transaccion='SNX_EOCME_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipoobracivil','id_equipoobracivil','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>