<?php
/**
*@package pXP
*@file gen-ACTTerrenolt.php
*@author  (admin)
*@date 03-08-2018 19:41:41
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTerrenolt extends ACTbase{    
			
	function listarTerrenolt(){
		$this->objParam->defecto('ordenacion','id_terrenolt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTerrenolt','listarTerrenolt');
		} else{
			$this->objFunc=$this->create('MODTerrenolt');
			
			$this->res=$this->objFunc->listarTerrenolt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTerrenolt(){
		$this->objFunc=$this->create('MODTerrenolt');	
		if($this->objParam->insertar('id_terrenolt')){
			$this->res=$this->objFunc->insertarTerrenolt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTerrenolt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTerrenolt(){
			$this->objFunc=$this->create('MODTerrenolt');	
		$this->res=$this->objFunc->eliminarTerrenolt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>