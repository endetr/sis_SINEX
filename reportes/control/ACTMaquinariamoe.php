<?php
/**
*@package pXP
*@file gen-ACTMaquinariamoe.php
*@author  (admin)
*@date 29-08-2018 18:34:19
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaquinariamoe extends ACTbase{    
			
	function listarMaquinariamoe(){
		$this->objParam->defecto('ordenacion','id_maquinariamoe');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaquinariamoe','listarMaquinariamoe');
		} else{
			$this->objFunc=$this->create('MODMaquinariamoe');
			
			$this->res=$this->objFunc->listarMaquinariamoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaquinariamoe(){
		$this->objFunc=$this->create('MODMaquinariamoe');	
		if($this->objParam->insertar('id_maquinariamoe')){
			$this->res=$this->objFunc->insertarMaquinariamoe($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaquinariamoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaquinariamoe(){
			$this->objFunc=$this->create('MODMaquinariamoe');	
		$this->res=$this->objFunc->eliminarMaquinariamoe($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>