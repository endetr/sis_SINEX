<?php
/**
*@package pXP
*@file gen-ACTUcmogrupo.php
*@author  (admin)
*@date 27-07-2018 16:51:55
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcmogrupo extends ACTbase{    
			
	function listarUcmogrupo(){
		$this->objParam->defecto('ordenacion','id_ucmogrupo');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivamo')!=''){
			$this->objParam->addFiltro("ucmogr.id_unidadconstructivamo = ".$this->objParam->getParametro('id_unidadconstructivamo'));
		} else {		
			$this->objParam->addFiltro("ucmogr.id_unidadconstructivamo = 0");
	    }
	    
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcmogrupo','listarUcmogrupo');
		} else{
			$this->objFunc=$this->create('MODUcmogrupo');
			
			$this->res=$this->objFunc->listarUcmogrupo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcmogrupo(){
		$this->objFunc=$this->create('MODUcmogrupo');	
		if($this->objParam->insertar('id_ucmogrupo')){
			$this->res=$this->objFunc->insertarUcmogrupo($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcmogrupo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcmogrupo(){
			$this->objFunc=$this->create('MODUcmogrupo');	
		$this->res=$this->objFunc->eliminarUcmogrupo($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>