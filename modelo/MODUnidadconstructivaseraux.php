<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivaseraux.php
*@author  (admin)
*@date 11-10-2018 19:42:10
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivaseraux extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivaseraux(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivaseraux_sel';
		$this->transaccion='SNX_UCSAUX_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivaseraux','int4');
		$this->captura('unidadconstructivaencseraux','int4');
		$this->captura('id_unidad','int4');
		$this->captura('cantidadseraux','numeric');
		$this->captura('precio','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('unidadconstructivaseraux','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidadabrev','varchar');
		$this->captura('valortotalseraux','numeric');
				
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivaseraux(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaseraux_ime';
		$this->transaccion='SNX_UCSAUX_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('unidadconstructivaencseraux','unidadconstructivaencseraux','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('cantidadseraux','cantidadseraux','numeric');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadconstructivaseraux','unidadconstructivaseraux','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivaseraux(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaseraux_ime';
		$this->transaccion='SNX_UCSAUX_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaseraux','id_unidadconstructivaseraux','int4');
		$this->setParametro('unidadconstructivaencseraux','unidadconstructivaencseraux','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('cantidadseraux','cantidadseraux','numeric');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadconstructivaseraux','unidadconstructivaseraux','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivaseraux(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaseraux_ime';
		$this->transaccion='SNX_UCSAUX_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaseraux','id_unidadconstructivaseraux','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>