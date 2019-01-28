<?php
/**
*@package pXP
*@file gen-ACTMaterial.php
*@author  (admin)
*@date 05-07-2018 13:08:59
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaterial extends ACTbase{    
			
	function listarMaterial(){
		$this->objParam->defecto('ordenacion','id_material');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaterial','listarMaterial');
		} else{
			$this->objFunc=$this->create('MODMaterial');
			
			$this->res=$this->objFunc->listarMaterial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaterial(){
		$this->objFunc=$this->create('MODMaterial');	
		if($this->objParam->insertar('id_material')){
			$this->res=$this->objFunc->insertarMaterial($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaterial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaterial(){
			$this->objFunc=$this->create('MODMaterial');	
		$this->res=$this->objFunc->eliminarMaterial($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>