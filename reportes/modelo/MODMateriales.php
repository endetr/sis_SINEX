<?php
/**
*@package pXP
*@file gen-MODMateriales.php
*@author  (admin)
*@date 16-07-2018 14:29:09
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMateriales extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMateriales(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucsbmateriales_sel';
		$this->transaccion='SNX_UCSBM_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
		
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivasb','int4');
		$this->captura('codigo','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('id_material','int4');
		$this->captura('material','varchar');
		$this->captura('cantidadmate','numeric');	
		$this->captura('valorunitario','numeric');
		$this->captura('valortotal','numeric');				
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
					
}
?>