<?php
/**
*@package pXP
*@file gen-ACTUnidad.php
*@author  (admin)
*@date 21-03-2018 19:24:25
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidad extends ACTbase{    
			
	function listarUnidad(){
		$this->objParam->defecto('ordenacion','id_unidad');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidad','listarUnidad');
		} else{
			$this->objFunc=$this->create('MODUnidad');
			
			$this->res=$this->objFunc->listarUnidad($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidad(){
		$this->objFunc=$this->create('MODUnidad');	
		if($this->objParam->insertar('id_unidad')){
			$this->res=$this->objFunc->insertarUnidad($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidad($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidad(){
			$this->objFunc=$this->create('MODUnidad');	
		$this->res=$this->objFunc->eliminarUnidad($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>