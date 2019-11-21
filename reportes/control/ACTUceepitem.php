<?php
/**
*@package pXP
*@file gen-ACTUceepitem.php
*@author  (admin)
*@date 11-10-2018 19:56:25
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUceepitem extends ACTbase{    
			
	function listarUceepitem(){
		$this->objParam->defecto('ordenacion','id_uceepitem');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivaeep')!=''){
		$this->objParam->addFiltro("uci.id_unidadconstructivaeep = ".$this->objParam->getParametro('id_unidadconstructivaeep'));
		}
		else {
	    	$this->objParam->addFiltro("uci.id_unidadconstructivaeep = 0");
	    }
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUceepitem','listarUceepitem');
		} else{
			$this->objFunc=$this->create('MODUceepitem');
			
			$this->res=$this->objFunc->listarUceepitem($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUceepitem(){
		$this->objFunc=$this->create('MODUceepitem');	
		if($this->objParam->insertar('id_uceepitem')){
			$this->res=$this->objFunc->insertarUceepitem($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUceepitem($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUceepitem(){
			$this->objFunc=$this->create('MODUceepitem');	
		$this->res=$this->objFunc->eliminarUceepitem($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>