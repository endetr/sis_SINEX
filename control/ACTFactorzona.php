<?php
/**
*@package pXP
*@file gen-ACTFactorzona.php
*@author  (admin)
*@date 12-06-2018 14:56:11
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTFactorzona extends ACTbase{    
			
	function listarFactorzona(){
		$this->objParam->defecto('ordenacion','id_factorzona');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODFactorzona','listarFactorzona');
		} else{
			$this->objFunc=$this->create('MODFactorzona');
			
			$this->res=$this->objFunc->listarFactorzona($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarFactorzona(){
		$this->objFunc=$this->create('MODFactorzona');	
		if($this->objParam->insertar('id_factorzona')){
			$this->res=$this->objFunc->insertarFactorzona($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarFactorzona($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarFactorzona(){
			$this->objFunc=$this->create('MODFactorzona');	
		$this->res=$this->objFunc->eliminarFactorzona($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>