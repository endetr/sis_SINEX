<?php
/**
*@package pXP
*@file gen-ACTMaquinaria.php
*@author  (admin)
*@date 22-03-2018 19:06:44
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaquinaria extends ACTbase{    
			
	function listarMaquinaria(){
		$this->objParam->defecto('ordenacion','id_maquinaria');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaquinaria','listarMaquinaria');
		} else{
			$this->objFunc=$this->create('MODMaquinaria');
			
			$this->res=$this->objFunc->listarMaquinaria($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaquinaria(){
		$this->objFunc=$this->create('MODMaquinaria');	
		if($this->objParam->insertar('id_maquinaria')){
			$this->res=$this->objFunc->insertarMaquinaria($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaquinaria($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaquinaria(){
			$this->objFunc=$this->create('MODMaquinaria');	
		$this->res=$this->objFunc->eliminarMaquinaria($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>