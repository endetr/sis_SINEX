<?php
/**
*@package pXP
*@file gen-ACTMes.php
*@author  (admin)
*@date 23-03-2018 14:43:22
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMes extends ACTbase{    
			
	function listarMes(){
		$this->objParam->defecto('ordenacion','id_mes');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMes','listarMes');
		} else{
			$this->objFunc=$this->create('MODMes');
			
			$this->res=$this->objFunc->listarMes($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMes(){
		$this->objFunc=$this->create('MODMes');	
		if($this->objParam->insertar('id_mes')){
			$this->res=$this->objFunc->insertarMes($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMes($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMes(){
			$this->objFunc=$this->create('MODMes');	
		$this->res=$this->objFunc->eliminarMes($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>