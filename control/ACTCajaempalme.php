<?php
/**
*@package pXP
*@file gen-ACTCajaempalme.php
*@author  (admin)
*@date 14-02-2019 17:57:59
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTCajaempalme extends ACTbase{    
			
	function listarCajaempalme(){
		$this->objParam->defecto('ordenacion','id_cajaempalme');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODCajaempalme','listarCajaempalme');
		} else{
			$this->objFunc=$this->create('MODCajaempalme');
			
			$this->res=$this->objFunc->listarCajaempalme($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarCajaempalme(){
		$this->objFunc=$this->create('MODCajaempalme');	
		if($this->objParam->insertar('id_cajaempalme')){
			$this->res=$this->objFunc->insertarCajaempalme($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarCajaempalme($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarCajaempalme(){
			$this->objFunc=$this->create('MODCajaempalme');	
		$this->res=$this->objFunc->eliminarCajaempalme($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>