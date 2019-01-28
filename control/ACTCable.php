<?php
/**
*@package pXP
*@file gen-ACTCable.php
*@author  (admin)
*@date 07-05-2018 19:37:54
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTCable extends ACTbase{    
			
	function listarCable(){
		$this->objParam->defecto('ordenacion','id_cable');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODCable','listarCable');
		} else{
			$this->objFunc=$this->create('MODCable');
			
			$this->res=$this->objFunc->listarCable($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarCable(){
		$this->objFunc=$this->create('MODCable');	
		if($this->objParam->insertar('id_cable')){
			$this->res=$this->objFunc->insertarCable($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarCable($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarCable(){
			$this->objFunc=$this->create('MODCable');	
		$this->res=$this->objFunc->eliminarCable($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>