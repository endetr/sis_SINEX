<?php
/**
*@package pXP
*@file gen-ACTMcelecmallatierra.php
*@author  (admin)
*@date 16-10-2018 20:00:20
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMcelecmallatierra extends ACTbase{    
			
	function listarMcelecmallatierra(){
		$this->objParam->defecto('ordenacion','id_mcelecmallatierra');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMcelecmallatierra','listarMcelecmallatierra');
		} else{
			$this->objFunc=$this->create('MODMcelecmallatierra');
			
			$this->res=$this->objFunc->listarMcelecmallatierra($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMcelecmallatierra(){
		$this->objFunc=$this->create('MODMcelecmallatierra');	
		if($this->objParam->insertar('id_mcelecmallatierra')){
			$this->res=$this->objFunc->insertarMcelecmallatierra($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMcelecmallatierra($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMcelecmallatierra(){
			$this->objFunc=$this->create('MODMcelecmallatierra');	
		$this->res=$this->objFunc->eliminarMcelecmallatierra($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>