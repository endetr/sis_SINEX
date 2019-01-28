<?php
/**
*@package pXP
*@file gen-ACTUcsbmaquinaria.php
*@author  (admin)
*@date 09-07-2018 15:17:47
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcsbmaquinaria extends ACTbase{    
			
	function listarUcsbmaquinaria(){
		$this->objParam->defecto('ordenacion','id_ucsbmaquinaria');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivasb')!=''){
		$this->objParam->addFiltro("ucsbm.id_unidadconstructivasb = ".$this->objParam->getParametro('id_unidadconstructivasb'));
	    }else {
	    	$this->objParam->addFiltro("ucsbm.id_unidadconstructivasb = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcsbmaquinaria','listarUcsbmaquinaria');
		} else{
			$this->objFunc=$this->create('MODUcsbmaquinaria');
			
			$this->res=$this->objFunc->listarUcsbmaquinaria($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcsbmaquinaria(){
		$this->objFunc=$this->create('MODUcsbmaquinaria');	
		if($this->objParam->insertar('id_ucsbmaquinaria')){
			$this->res=$this->objFunc->insertarUcsbmaquinaria($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcsbmaquinaria($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcsbmaquinaria(){
			$this->objFunc=$this->create('MODUcsbmaquinaria');	
		$this->res=$this->objFunc->eliminarUcsbmaquinaria($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>