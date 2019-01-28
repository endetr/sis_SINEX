<?php
/**
*@package pXP
*@file gen-ACTUcsbequipo.php
*@author  (admin)
*@date 09-07-2018 17:58:19
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcsbequipo extends ACTbase{    
			
	function listarUcsbequipo(){
		$this->objParam->defecto('ordenacion','id_ucsbequipo');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivasb')!=''){
		$this->objParam->addFiltro("ucsbe.id_unidadconstructivasb = ".$this->objParam->getParametro('id_unidadconstructivasb'));
	    }else {
	    	$this->objParam->addFiltro("ucsbe.id_unidadconstructivasb = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcsbequipo','listarUcsbequipo');
		} else{
			$this->objFunc=$this->create('MODUcsbequipo');
			
			$this->res=$this->objFunc->listarUcsbequipo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcsbequipo(){
		$this->objFunc=$this->create('MODUcsbequipo');	
		if($this->objParam->insertar('id_ucsbequipo')){
			$this->res=$this->objFunc->insertarUcsbequipo($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcsbequipo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcsbequipo(){
			$this->objFunc=$this->create('MODUcsbequipo');	
		$this->res=$this->objFunc->eliminarUcsbequipo($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>