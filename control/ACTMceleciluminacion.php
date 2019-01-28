<?php
/**
*@package pXP
*@file gen-ACTMceleciluminacion.php
*@author  (admin)
*@date 16-10-2018 20:00:25
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMceleciluminacion extends ACTbase{    
			
	function listarMceleciluminacion(){
		$this->objParam->defecto('ordenacion','id_meleciluminacion');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMceleciluminacion','listarMceleciluminacion');
		} else{
			$this->objFunc=$this->create('MODMceleciluminacion');
			
			$this->res=$this->objFunc->listarMceleciluminacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMceleciluminacion(){
		$this->objFunc=$this->create('MODMceleciluminacion');	
		if($this->objParam->insertar('id_meleciluminacion')){
			$this->res=$this->objFunc->insertarMceleciluminacion($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMceleciluminacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMceleciluminacion(){
			$this->objFunc=$this->create('MODMceleciluminacion');	
		$this->res=$this->objFunc->eliminarMceleciluminacion($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>