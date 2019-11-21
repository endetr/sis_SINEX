<?php
/**
*@package pXP
*@file gen-MODObracivilcantidadlt.php
*@author  (admin)
*@date 25-07-2018 18:42:06
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODObracivilcantidadlt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarObracivilcantidadlt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_obracivilcantidadlt_sel';
		$this->transaccion='SNX_OCCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_obracivilcantidadlt','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_configuracionlt','int4');
		$this->captura('id_terreno','int4');
		$this->captura('cantidadobracivillt','numeric');
		$this->captura('id_tipolinea','int4');
		$this->captura('id_tipoestructura','int4');
		$this->captura('id_tipocanalizacion','int4');
		$this->captura('id_tensionservicio','int4');
		$this->captura('id_obracivillt','int4');
		$this->captura('id_funcionestructura','int4');
		$this->captura('id_tipocimentacion','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');		
		$this->captura('tipolinea','varchar');
		$this->captura('tensionservicio','varchar');
		$this->captura('tipoestructura','varchar');
		$this->captura('configuracionlt','varchar');
		$this->captura('funcionestructura','varchar');
		$this->captura('desc_terreno','varchar');
		$this->captura('tipocimentacion','varchar');
		$this->captura('tipocanalizacion','varchar');
		$this->captura('id_bancoductos','int4');
		$this->captura('bancoductos','varchar');
		$this->captura('id_cajaempalme','int4');
		$this->captura('cajaempalme','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarObracivilcantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilcantidadlt_ime';
		$this->transaccion='SNX_OCCLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('id_terreno','id_terreno','int4');
		$this->setParametro('cantidadobracivillt','cantidadobracivillt','numeric');
		$this->setParametro('id_tipolinea','id_tipolinea','int4');
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('id_tipocanalizacion','id_tipocanalizacion','int4');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('id_obracivillt','id_obracivillt','int4');
		$this->setParametro('id_funcionestructura','id_funcionestructura','int4');
		$this->setParametro('id_tipocimentacion','id_tipocimentacion','int4');
		$this->setParametro('id_bancoductos','id_bancoductos','int4');
		$this->setParametro('id_cajaempalme','id_cajaempalme','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarObracivilcantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilcantidadlt_ime';
		$this->transaccion='SNX_OCCLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivilcantidadlt','id_obracivilcantidadlt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('id_terreno','id_terreno','int4');
		$this->setParametro('cantidadobracivillt','cantidadobracivillt','numeric');
		$this->setParametro('id_tipolinea','id_tipolinea','int4');
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('id_tipocanalizacion','id_tipocanalizacion','int4');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('id_obracivillt','id_obracivillt','int4');
		$this->setParametro('id_funcionestructura','id_funcionestructura','int4');
		$this->setParametro('id_tipocimentacion','id_tipocimentacion','int4');
		$this->setParametro('id_bancoductos','id_bancoductos','int4');
		$this->setParametro('id_cajaempalme','id_cajaempalme','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarObracivilcantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilcantidadlt_ime';
		$this->transaccion='SNX_OCCLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivilcantidadlt','id_obracivilcantidadlt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>