<?php
/**
*@package pXP
*@file gen-ACTTasacambio.php
*@author  (admin)
*@date 02-04-2018 13:35:50
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTasacambio extends ACTbase{    
			
	function listarTasacambio(){
		$this->objParam->defecto('ordenacion','id_tasacambio');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTasacambio','listarTasacambio');
		} else{
			$this->objFunc=$this->create('MODTasacambio');
			
			$this->res=$this->objFunc->listarTasacambio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTasacambio(){
		$this->objFunc=$this->create('MODTasacambio');	
		if($this->objParam->insertar('id_tasacambio')){
			$this->res=$this->objFunc->insertarTasacambio($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTasacambio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTasacambio(){
			$this->objFunc=$this->create('MODTasacambio');	
		$this->res=$this->objFunc->eliminarTasacambio($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>