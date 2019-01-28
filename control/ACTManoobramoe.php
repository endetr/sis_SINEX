<?php
/**
*@package pXP
*@file gen-ACTManoobramoe.php
*@author  (admin)
*@date 29-08-2018 18:34:29
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTManoobramoe extends ACTbase{    
			
	function listarManoobramoe(){
		$this->objParam->defecto('ordenacion','id_manoobramoe');

		$this->objParam->defecto('dir_ordenacion','asc');	
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODManoobramoe','listarManoobramoe');
		} else{
			$this->objFunc=$this->create('MODManoobramoe');
			
			$this->res=$this->objFunc->listarManoobramoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarManoobramoe(){
		$this->objFunc=$this->create('MODManoobramoe');	
		if($this->objParam->insertar('id_manoobramoe')){
			$this->res=$this->objFunc->insertarManoobramoe($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarManoobramoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarManoobramoe(){
			$this->objFunc=$this->create('MODManoobramoe');	
		$this->res=$this->objFunc->eliminarManoobramoe($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>