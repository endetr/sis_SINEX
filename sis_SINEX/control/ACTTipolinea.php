<?php
/**
*@package pXP
*@file gen-ACTTipolinea.php
*@author  (admin)
*@date 19-07-2018 14:03:02
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipolinea extends ACTbase{    
			
	function listarTipolinea(){
		$this->objParam->defecto('ordenacion','id_tipolinea');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipolinea','listarTipolinea');
		} else{
			$this->objFunc=$this->create('MODTipolinea');
			
			$this->res=$this->objFunc->listarTipolinea($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipolinea(){
		$this->objFunc=$this->create('MODTipolinea');	
		if($this->objParam->insertar('id_tipolinea')){
			$this->res=$this->objFunc->insertarTipolinea($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipolinea($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipolinea(){
			$this->objFunc=$this->create('MODTipolinea');	
		$this->res=$this->objFunc->eliminarTipolinea($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>