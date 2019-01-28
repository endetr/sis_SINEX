<?php
/**
*@package pXP
*@file gen-MODUcmceitem.php
*@author  (admin)
*@date 16-10-2018 20:00:31
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcmceitem extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcmceitem(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucmceitem_sel';
		$this->transaccion='SNX_TUCI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucmeitem','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('precio','numeric');
		$this->captura('grupo','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('id_unidadconstructivamcelec','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('totalitem','numeric');
		$this->captura('matitem','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcmceitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmceitem_ime';
		$this->transaccion='SNX_TUCI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('grupo','grupo','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_unidadconstructivamcelec','id_unidadconstructivamcelec','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcmceitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmceitem_ime';
		$this->transaccion='SNX_TUCI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucmeitem','id_ucmeitem','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('grupo','grupo','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_unidadconstructivamcelec','id_unidadconstructivamcelec','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcmceitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmceitem_ime';
		$this->transaccion='SNX_TUCI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucmeitem','id_ucmeitem','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>