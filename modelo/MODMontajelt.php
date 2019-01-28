<?php
/**
*@package pXP
*@file gen-MODMontajelt.php
*@author  (admin)
*@date 19-07-2018 12:33:51
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMontajelt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMontajelt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_montajelt_sel';
		$this->transaccion='SNX_MONLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_montajelt','int4');
		$this->captura('id_unidad','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('montajelt','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');		
		$this->captura('unidadabrev','varchar');
		$this->captura('valormontajelt','numeric');
		$this->captura('id_factorindexacion','int4');
		$this->captura('desc_factorindexacion','varchar');			
				
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}

	function listarMontajecantlt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_montajecantlt_sel';
		$this->transaccion='SNX_MONLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivalt','int4');
		$this->captura('id_grupo','int4');		
		$this->captura('grupo','varchar');
		$this->captura('id_item','int4');	
		$this->captura('item','varchar');
		$this->captura('id_unidad','int4');	
		$this->captura('unidadabrev','varchar');
		$this->captura('cantidaditem','numeric');	
		$this->captura('costounitari','numeric');	
		$this->captura('costototal','numeric');	
				
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMontajelt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajelt_ime';
		$this->transaccion='SNX_MONLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('montajelt','montajelt','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMontajelt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajelt_ime';
		$this->transaccion='SNX_MONLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_montajelt','id_montajelt','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('montajelt','montajelt','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMontajelt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajelt_ime';
		$this->transaccion='SNX_MONLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_montajelt','id_montajelt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>