<?php
/**
*@package pXP
*@file gen-ACTTerrenosb.php
*@author  (admin)
*@date 03-08-2018 19:41:46
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTerrenosb extends ACTbase{    
			
	function listarTerrenosb(){
		$this->objParam->defecto('ordenacion','id_terrenosb');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTerrenosb','listarTerrenosb');
		} else{
			$this->objFunc=$this->create('MODTerrenosb');
			
			$this->res=$this->objFunc->listarTerrenosb($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTerrenosb(){
		$this->objFunc=$this->create('MODTerrenosb');	
		if($this->objParam->insertar('id_terrenosb')){
			$this->res=$this->objFunc->insertarTerrenosb($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTerrenosb($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTerrenosb(){
			$this->objFunc=$this->create('MODTerrenosb');	
		$this->res=$this->objFunc->eliminarTerrenosb($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>