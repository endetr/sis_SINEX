<?php
/**
*@package pXP
*@file gen-ACTTipoconductor.php
*@author  (admin)
*@date 19-07-2018 15:46:01
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipoconductor extends ACTbase{    
			
	function listarTipoconductor(){
		$this->objParam->defecto('ordenacion','id_tipoconductor');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipoconductor','listarTipoconductor');
		} else{
			$this->objFunc=$this->create('MODTipoconductor');
			
			$this->res=$this->objFunc->listarTipoconductor($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipoconductor(){
		$this->objFunc=$this->create('MODTipoconductor');	
		if($this->objParam->insertar('id_tipoconductor')){
			$this->res=$this->objFunc->insertarTipoconductor($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipoconductor($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipoconductor(){
			$this->objFunc=$this->create('MODTipoconductor');	
		$this->res=$this->objFunc->eliminarTipoconductor($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>