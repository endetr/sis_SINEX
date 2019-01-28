<?php
/**
*@package pXP
*@file gen-ACTRevista.php
*@author  (admin)
*@date 17-09-2018 13:04:24
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTRevista extends ACTbase{    
			
	function listarRevista(){
		$this->objParam->defecto('ordenacion','id_revista');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODRevista','listarRevista');
		} else{
			$this->objFunc=$this->create('MODRevista');
			
			$this->res=$this->objFunc->listarRevista($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarRevista(){
		$this->objFunc=$this->create('MODRevista');	
		if($this->objParam->insertar('id_revista')){
			$this->res=$this->objFunc->insertarRevista($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarRevista($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarRevista(){
			$this->objFunc=$this->create('MODRevista');	
		$this->res=$this->objFunc->eliminarRevista($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>