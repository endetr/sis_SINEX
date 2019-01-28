<?php
/**
*@package pXP
*@file gen-ACTTipocanalizacion.php
*@author  (admin)
*@date 25-07-2018 14:56:50
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipocanalizacion extends ACTbase{    
			
	function listarTipocanalizacion(){
		$this->objParam->defecto('ordenacion','id_tipocanalizacion');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipocanalizacion','listarTipocanalizacion');
		} else{
			$this->objFunc=$this->create('MODTipocanalizacion');
			
			$this->res=$this->objFunc->listarTipocanalizacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipocanalizacion(){
		$this->objFunc=$this->create('MODTipocanalizacion');	
		if($this->objParam->insertar('id_tipocanalizacion')){
			$this->res=$this->objFunc->insertarTipocanalizacion($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipocanalizacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipocanalizacion(){
			$this->objFunc=$this->create('MODTipocanalizacion');	
		$this->res=$this->objFunc->eliminarTipocanalizacion($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>