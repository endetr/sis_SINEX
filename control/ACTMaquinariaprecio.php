<?php
/**
*@package pXP
*@file gen-ACTMaquinariaprecio.php
*@author  (admin)
*@date 22-03-2018 19:06:49
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaquinariaprecio extends ACTbase{    
			
	function listarMaquinariaprecio(){
		$this->objParam->defecto('ordenacion','id_maquinariaprecio');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_maquinaria')!=''){
			$this->objParam->addFiltro("mpr.id_maquinaria = ".$this->objParam->getParametro('id_maquinaria'));
	    } else {
	    	$this->objParam->addFiltro("mpr.id_maquinaria = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaquinariaprecio','listarMaquinariaprecio');
		} else{
			$this->objFunc=$this->create('MODMaquinariaprecio');
			
			$this->res=$this->objFunc->listarMaquinariaprecio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaquinariaprecio(){
		$this->objFunc=$this->create('MODMaquinariaprecio');	
		if($this->objParam->insertar('id_maquinariaprecio')){
			$this->res=$this->objFunc->insertarMaquinariaprecio($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaquinariaprecio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaquinariaprecio(){
			$this->objFunc=$this->create('MODMaquinariaprecio');	
		$this->res=$this->objFunc->eliminarMaquinariaprecio($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>