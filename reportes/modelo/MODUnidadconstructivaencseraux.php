<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivaencseraux.php
*@author  (admin)
*@date 14-11-2018 20:35:13
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivaencseraux extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
	
	function listarOtrosgastos(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivaencseraux_sel';
		$this->transaccion='SNX_OTG_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_item','int4');
		$this->captura('id_otrauc','int4');
		$this->captura('otrosgastos','varchar');
		$this->captura('cantidadog','numeric');
		$this->captura('valorunitario','numeric');
		$this->captura('valorog','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}	
			
	function listarUnidadconstructivaencseraux(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivaencseraux_sel';
		$this->transaccion='SNX_UCSAENC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('unidadconstructivaencseraux','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('numerobahias','int4');
		$this->captura('descripcion','varchar');
		$this->captura('codigo','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valoritem','numeric');
		$this->captura('valorog','numeric');
		$this->captura('valortotal','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivaencseraux(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaencseraux_ime';
		$this->transaccion='SNX_UCSAENC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('codigo','codigo','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivaencseraux(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaencseraux_ime';
		$this->transaccion='SNX_UCSAENC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('unidadconstructivaencseraux','unidadconstructivaencseraux','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('codigo','codigo','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivaencseraux(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaencseraux_ime';
		$this->transaccion='SNX_UCSAENC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('unidadconstructivaencseraux','unidadconstructivaencseraux','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>