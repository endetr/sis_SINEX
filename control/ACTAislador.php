<?php
/**
*@package pXP
*@file gen-ACTAislador.php
*@author  (admin)
*@date 07-05-2018 19:37:56
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTAislador extends ACTbase{    
			
	function listarAislador(){
		$this->objParam->defecto('ordenacion','id_aislador');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODAislador','listarAislador');
		} else{
			$this->objFunc=$this->create('MODAislador');
			
			$this->res=$this->objFunc->listarAislador($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarAislador(){
		$this->objFunc=$this->create('MODAislador');	
		if($this->objParam->insertar('id_aislador')){
			$this->res=$this->objFunc->insertarAislador($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarAislador($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarAislador(){
			$this->objFunc=$this->create('MODAislador');	
		$this->res=$this->objFunc->eliminarAislador($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>