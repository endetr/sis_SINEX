<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivaeep.php
*@author  (admin)
*@date 11-10-2018 19:56:19
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivaeep extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivaeep(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivaeep_sel';
		$this->transaccion='SNX_UCEE_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivaeep','int4');		
		$this->captura('codigo_unieepp','varchar');
		$this->captura('norma','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('id_tensionservicio','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_tensionservicio','varchar');
		$this->captura('codigo_unicod','varchar');
		$this->captura('totalitems','numeric');
		$this->captura('desc_codigo_unieeppten','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivaeep(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaeep_ime';
		$this->transaccion='SNX_UCEE_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('codigo_unieepp','codigo_unieepp','varchar');
		$this->setParametro('norma','norma','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivaeep(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaeep_ime';
		$this->transaccion='SNX_UCEE_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaeep','id_unidadconstructivaeep','int4');
		$this->setParametro('codigo_unieepp','codigo_unieepp','varchar');
		$this->setParametro('norma','norma','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivaeep(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaeep_ime';
		$this->transaccion='SNX_UCEE_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaeep','id_unidadconstructivaeep','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>