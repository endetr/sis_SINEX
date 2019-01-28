<?php
/**
*@package pXP
*@file gen-ACTVegetacion.php
*@author  (admin)
*@date 24-07-2018 14:00:24
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTVegetacion extends ACTbase{    
			
	function listarVegetacion(){
		$this->objParam->defecto('ordenacion','id_vegetacion');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODVegetacion','listarVegetacion');
		} else{
			$this->objFunc=$this->create('MODVegetacion');
			
			$this->res=$this->objFunc->listarVegetacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarVegetacion(){
		$this->objFunc=$this->create('MODVegetacion');	
		if($this->objParam->insertar('id_vegetacion')){
			$this->res=$this->objFunc->insertarVegetacion($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarVegetacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarVegetacion(){
			$this->objFunc=$this->create('MODVegetacion');	
		$this->res=$this->objFunc->eliminarVegetacion($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>