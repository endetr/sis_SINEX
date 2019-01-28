<?php
/**
*@package pXP
*@file gen-ACTSpuestatierra.php
*@author  (admin)
*@date 25-07-2018 13:46:20
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTSpuestatierra extends ACTbase{    
			
	function listarSpuestatierra(){
		$this->objParam->defecto('ordenacion','id_puestatierra');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODSpuestatierra','listarSpuestatierra');
		} else{
			$this->objFunc=$this->create('MODSpuestatierra');
			
			$this->res=$this->objFunc->listarSpuestatierra($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarSpuestatierra(){
		$this->objFunc=$this->create('MODSpuestatierra');	
		if($this->objParam->insertar('id_puestatierra')){
			$this->res=$this->objFunc->insertarSpuestatierra($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarSpuestatierra($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarSpuestatierra(){
			$this->objFunc=$this->create('MODSpuestatierra');	
		$this->res=$this->objFunc->eliminarSpuestatierra($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>