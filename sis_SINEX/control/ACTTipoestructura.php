<?php
/**
*@package pXP
*@file gen-ACTTipoestructura.php
*@author  (admin)
*@date 07-05-2018 19:26:31
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipoestructura extends ACTbase{    
			
	function listarTipoestructura(){
		$this->objParam->defecto('ordenacion','id_tipoestructura');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipoestructura','listarTipoestructura');
		} else{
			$this->objFunc=$this->create('MODTipoestructura');
			
			$this->res=$this->objFunc->listarTipoestructura($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipoestructura(){
		$this->objFunc=$this->create('MODTipoestructura');	
		if($this->objParam->insertar('id_tipoestructura')){
			$this->res=$this->objFunc->insertarTipoestructura($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipoestructura($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipoestructura(){
			$this->objFunc=$this->create('MODTipoestructura');	
		$this->res=$this->objFunc->eliminarTipoestructura($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>