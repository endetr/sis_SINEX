<?php
/**
*@package pXP
*@file gen-ACTMoneda.php
*@author  (admin)
*@date 22-03-2018 14:46:38
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMoneda extends ACTbase{    
			
	function listarMoneda(){
		$this->objParam->defecto('ordenacion','id_moneda');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMoneda','listarMoneda');
		} else{
			$this->objFunc=$this->create('MODMoneda');
			
			$this->res=$this->objFunc->listarMoneda($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMoneda(){
		$this->objFunc=$this->create('MODMoneda');	
		if($this->objParam->insertar('id_moneda')){
			$this->res=$this->objFunc->insertarMoneda($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMoneda($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMoneda(){
			$this->objFunc=$this->create('MODMoneda');	
		$this->res=$this->objFunc->eliminarMoneda($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>