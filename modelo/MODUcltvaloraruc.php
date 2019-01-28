<?php
/**
*@package pXP
*@file gen-MODUcltvaloraruc.php
*@author  (admin)
*@date 01-11-2018 20:21:15
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcltvaloraruc extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcltvaloraruc(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucltvaloraruc_sel';
		$this->transaccion='SNX_VUCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucltvaloraruc','int4');
		$this->captura('id_ucltvalorar','int4');
		$this->captura('id_tipolinea','int4');
		$this->captura('tipolinea','varchar');
		$this->captura('id_tensionservicio','int4');
		$this->captura('tensionservicio','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('numoc','numeric');
		$this->captura('numingenieria','numeric');
		$this->captura('codigo','varchar');
		$this->captura('numadmeje','numeric');
		$this->captura('numcostototaluc','numeric');
		$this->captura('id_unidadconstructivalt','int4');
		$this->captura('numinspeccion','numeric');
		$this->captura('numcapred','numeric');
		$this->captura('numddp','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('numsupero','numeric');
		$this->captura('longitud','numeric');
		$this->captura('nummontaje','numeric');
		$this->captura('numcaamb','numeric');
		$this->captura('numcfinan','numeric');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('numcostototaluct','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcltvaloraruc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucltvaloraruc_ime';
		$this->transaccion='SNX_VUCLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucltvalorar','id_ucltvalorar','int4');
		$this->setParametro('id_unidadconstructivalt','id_unidadconstructivalt','int4');
		$this->setParametro('longitud','longitud','numeric');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcltvaloraruc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucltvaloraruc_ime';
		$this->transaccion='SNX_VUCLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucltvaloraruc','id_ucltvaloraruc','int4');
		$this->setParametro('id_ucltvalorar','id_ucltvalorar','int4');
		$this->setParametro('id_unidadconstructivalt','id_unidadconstructivalt','int4');
		$this->setParametro('longitud','longitud','numeric');		

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcltvaloraruc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucltvaloraruc_ime';
		$this->transaccion='SNX_VUCLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucltvaloraruc','id_ucltvaloraruc','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>