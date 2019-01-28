<?php
/**
*@package pXP
*@file gen-ACTIndicetipo.php
*@author  (admin)
*@date 23-07-2018 15:53:42
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTIndicetipo extends ACTbase{    
			
	function listarIndicetipo(){
		$this->objParam->defecto('ordenacion','id_indicetipo');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODIndicetipo','listarIndicetipo');
		} else{
			$this->objFunc=$this->create('MODIndicetipo');
			
			$this->res=$this->objFunc->listarIndicetipo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarIndicetipo(){
		$this->objFunc=$this->create('MODIndicetipo');	
		if($this->objParam->insertar('id_indicetipo')){
			$this->res=$this->objFunc->insertarIndicetipo($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarIndicetipo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarIndicetipo(){
			$this->objFunc=$this->create('MODIndicetipo');	
		$this->res=$this->objFunc->eliminarIndicetipo($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>