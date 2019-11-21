<?php
/**
*@package pXP
*@file gen-ACTHilosguarda.php
*@author  (admin)
*@date 23-10-2018 13:47:29
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTHilosguarda extends ACTbase{    
			
	function listarHilosguarda(){
		$this->objParam->defecto('ordenacion','id_hilosguarda');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODHilosguarda','listarHilosguarda');
		} else{
			$this->objFunc=$this->create('MODHilosguarda');
			
			$this->res=$this->objFunc->listarHilosguarda($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarHilosguarda(){
		$this->objFunc=$this->create('MODHilosguarda');	
		if($this->objParam->insertar('id_hilosguarda')){
			$this->res=$this->objFunc->insertarHilosguarda($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarHilosguarda($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarHilosguarda(){
			$this->objFunc=$this->create('MODHilosguarda');	
		$this->res=$this->objFunc->eliminarHilosguarda($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>