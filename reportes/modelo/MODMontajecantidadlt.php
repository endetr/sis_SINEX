<?php
/**
*@package pXP
*@file gen-MODMontajecantidadlt.php
*@author  (admin)
*@date 19-07-2018 14:51:24
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMontajecantidadlt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMontajecantidadlt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_montajecantidadlt_sel';
		$this->transaccion='SNX_MONTC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_montajecantidadlt','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('cantidadmontajelt','numeric');
		$this->captura('id_tipoestructura','int4');
		$this->captura('id_tensionservicio','int4');
		$this->captura('id_configuracionlt','int4');
		$this->captura('id_tipolinea','int4');
		$this->captura('id_montajelt','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');		
		$this->captura('tipoestructura','varchar');
		$this->captura('tensionservicio','varchar');
		$this->captura('configuracionlt','varchar');
		$this->captura('tipolinea','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMontajecantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajecantidadlt_ime';
		$this->transaccion='SNX_MONTC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadmontajelt','cantidadmontajelt','numeric');
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('id_tipolinea','id_tipolinea','int4');
		$this->setParametro('id_montajelt','id_montajelt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMontajecantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajecantidadlt_ime';
		$this->transaccion='SNX_MONTC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_montajecantidadlt','id_montajecantidadlt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadmontajelt','cantidadmontajelt','numeric');
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('id_tipolinea','id_tipolinea','int4');
		$this->setParametro('id_montajelt','id_montajelt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMontajecantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajecantidadlt_ime';
		$this->transaccion='SNX_MONTC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_montajecantidadlt','id_montajecantidadlt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>