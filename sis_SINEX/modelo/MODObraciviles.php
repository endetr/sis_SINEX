<?php
/**
*@package pXP
*@file gen-MODObraciviles.php
*@author  (admin)
*@date 18-07-2018 15:01:57
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODObraciviles extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarObraciviles(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucsbobracivil_sel';
		$this->transaccion='SNX_UCSBEO_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivasb','int4');
		$this->captura('codigo','varchar');
		$this->captura('id_obracivil','int4');
		$this->captura('descripcion','varchar');
		$this->captura('obracivil','varchar');
		$this->captura('unidadbrev','varchar');
		$this->captura('cantidadpeso','numeric');
		$this->captura('valorobracivil','numeric');
		$this->captura('valorunitario','numeric');		
		
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
	
	function listarOtrosgastos(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucsbotrosgastos_sel';
		$this->transaccion='SNX_UCSBEO_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivasb','int4');
		$this->captura('codigo','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('otrosgastos','varchar');
		$this->captura('cantidadog','numeric');
		$this->captura('valorog','numeric');
		$this->captura('valorunitario','numeric');	
		$this->captura('Id_Item','int4');			
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
				
}
?>