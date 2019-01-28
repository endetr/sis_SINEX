<?php
/**
*@package pXP
*@file gen-ACTTarifaingsb.php
*@author  (admin)
*@date 14-11-2018 16:12:18
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTarifaingsb extends ACTbase{    
			
	function listarTarifaingsb(){
		$this->objParam->defecto('ordenacion','id_tarifaingsb');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTarifaingsb','listarTarifaingsb');
		} else{
			$this->objFunc=$this->create('MODTarifaingsb');
			
			$this->res=$this->objFunc->listarTarifaingsb($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTarifaingsb(){
		$this->objFunc=$this->create('MODTarifaingsb');	
		if($this->objParam->insertar('id_tarifaingsb')){
			$this->res=$this->objFunc->insertarTarifaingsb($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTarifaingsb($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTarifaingsb(){
			$this->objFunc=$this->create('MODTarifaingsb');	
		$this->res=$this->objFunc->eliminarTarifaingsb($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>