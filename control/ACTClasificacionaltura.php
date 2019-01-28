<?php
/**
*@package pXP
*@file gen-ACTClasificacionaltura.php
*@author  (admin)
*@date 12-06-2018 14:56:15
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTClasificacionaltura extends ACTbase{    
			
	function listarClasificacionaltura(){
		$this->objParam->defecto('ordenacion','id_clasificacionaltura');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODClasificacionaltura','listarClasificacionaltura');
		} else{
			$this->objFunc=$this->create('MODClasificacionaltura');
			
			$this->res=$this->objFunc->listarClasificacionaltura($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarClasificacionaltura(){
		$this->objFunc=$this->create('MODClasificacionaltura');	
		if($this->objParam->insertar('id_clasificacionaltura')){
			$this->res=$this->objFunc->insertarClasificacionaltura($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarClasificacionaltura($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarClasificacionaltura(){
			$this->objFunc=$this->create('MODClasificacionaltura');	
		$this->res=$this->objFunc->eliminarClasificacionaltura($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>