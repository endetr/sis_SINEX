<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivamcelec.php
*@author  (admin)
*@date 16-10-2018 20:00:28
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivamcelec extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
	
	function listarOtrosgastos(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivamcelec_sel';
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
		
			
	function listarUnidadconstructivamcelec(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivamcelec_sel';
		$this->transaccion='SNX_MCUC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivamcelec','int4');
		$this->captura('codigo','varchar');
		$this->captura('areasub','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('numerobahias','int4');
		$this->captura('longitudvia','numeric');
		$this->captura('id_claseaislacion','int4');
		$this->captura('descripcion','varchar');
		$this->captura('id_tensionservicio','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_claseaislacion','varchar');
		$this->captura('desc_tensionservicio','varchar');
		$this->captura('totalitems','numeric');
		$this->captura('totalog','numeric');
		$this->captura('totaluc','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivamcelec(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivamcelec_ime';
		$this->transaccion='SNX_MCUC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('areasub','areasub','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('longitudvia','longitudvia','numeric');
		$this->setParametro('id_claseaislacion','id_claseaislacion','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivamcelec(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivamcelec_ime';
		$this->transaccion='SNX_MCUC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivamcelec','id_unidadconstructivamcelec','int4');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('areasub','areasub','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('longitudvia','longitudvia','numeric');
		$this->setParametro('id_claseaislacion','id_claseaislacion','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivamcelec(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivamcelec_ime';
		$this->transaccion='SNX_MCUC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivamcelec','id_unidadconstructivamcelec','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>