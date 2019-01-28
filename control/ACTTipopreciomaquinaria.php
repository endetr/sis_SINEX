<?php
/**
*@package pXP
*@file gen-ACTTipopreciomaquinaria.php
*@author  (admin)
*@date 13-11-2018 18:43:45
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipopreciomaquinaria extends ACTbase{    
			
	function listarTipopreciomaquinaria(){
		$this->objParam->defecto('ordenacion','id_tipopreciomaquinaria');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipopreciomaquinaria','listarTipopreciomaquinaria');
		} else{
			$this->objFunc=$this->create('MODTipopreciomaquinaria');
			
			$this->res=$this->objFunc->listarTipopreciomaquinaria($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipopreciomaquinaria(){
		$this->objFunc=$this->create('MODTipopreciomaquinaria');	
		if($this->objParam->insertar('id_tipopreciomaquinaria')){
			$this->res=$this->objFunc->insertarTipopreciomaquinaria($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipopreciomaquinaria($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipopreciomaquinaria(){
			$this->objFunc=$this->create('MODTipopreciomaquinaria');	
		$this->res=$this->objFunc->eliminarTipopreciomaquinaria($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>