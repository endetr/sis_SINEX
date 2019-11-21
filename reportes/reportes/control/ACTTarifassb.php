<?php
/**
*@package pXP
*@file gen-ACTTarifassb.php
*@author  (admin)
*@date 10-10-2018 13:26:46
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTarifassb extends ACTbase{    
			
	function listarTarifassb(){
		$this->objParam->defecto('ordenacion','id_tarifasb');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTarifassb','listarTarifassb');
		} else{
			$this->objFunc=$this->create('MODTarifassb');
			
			$this->res=$this->objFunc->listarTarifassb($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTarifassb(){
		$this->objFunc=$this->create('MODTarifassb');	
		if($this->objParam->insertar('id_tarifasb')){
			$this->res=$this->objFunc->insertarTarifassb($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTarifassb($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTarifassb(){
			$this->objFunc=$this->create('MODTarifassb');	
		$this->res=$this->objFunc->eliminarTarifassb($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>