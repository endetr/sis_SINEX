<?php
/**
*@package pXP
*@file gen-ACTTipocimentacion.php
*@author  (admin)
*@date 25-07-2018 14:56:46
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipocimentacion extends ACTbase{    
			
	function listarTipocimentacion(){
		$this->objParam->defecto('ordenacion','id_tipocimentacion');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipocimentacion','listarTipocimentacion');
		} else{
			$this->objFunc=$this->create('MODTipocimentacion');
			
			$this->res=$this->objFunc->listarTipocimentacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipocimentacion(){
		$this->objFunc=$this->create('MODTipocimentacion');	
		if($this->objParam->insertar('id_tipocimentacion')){
			$this->res=$this->objFunc->insertarTipocimentacion($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipocimentacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipocimentacion(){
			$this->objFunc=$this->create('MODTipocimentacion');	
		$this->res=$this->objFunc->eliminarTipocimentacion($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>