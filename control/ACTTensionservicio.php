<?php
/**
*@package pXP
*@file gen-ACTTensionservicio.php
*@author  (admin)
*@date 21-03-2018 19:24:34
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTensionservicio extends ACTbase{    
			
	function listarTensionservicio(){
		$this->objParam->defecto('ordenacion','id_tensionservicio');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTensionservicio','listarTensionservicio');
		} else{
			$this->objFunc=$this->create('MODTensionservicio');
			
			$this->res=$this->objFunc->listarTensionservicio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTensionservicio(){
		$this->objFunc=$this->create('MODTensionservicio');	
		if($this->objParam->insertar('id_tensionservicio')){
			$this->res=$this->objFunc->insertarTensionservicio($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTensionservicio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTensionservicio(){
			$this->objFunc=$this->create('MODTensionservicio');	
		$this->res=$this->objFunc->eliminarTensionservicio($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>