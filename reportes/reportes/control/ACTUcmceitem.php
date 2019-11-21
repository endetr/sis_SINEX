<?php
/**
*@package pXP
*@file gen-ACTUcmceitem.php
*@author  (admin)
*@date 16-10-2018 20:00:31
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcmceitem extends ACTbase{    
			
	function listarUcmceitem(){
		$this->objParam->defecto('ordenacion','id_ucmeitem');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivamcelec')!=''){
		$this->objParam->addFiltro("tuci.id_unidadconstructivamcelec = ".$this->objParam->getParametro('id_unidadconstructivamcelec'));
	    }else {
	    	$this->objParam->addFiltro("tuci.id_unidadconstructivamcelec = 0");
	    }
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcmceitem','listarUcmceitem');
		} else{
			$this->objFunc=$this->create('MODUcmceitem');
			
			$this->res=$this->objFunc->listarUcmceitem($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcmceitem(){
		$this->objFunc=$this->create('MODUcmceitem');	
		if($this->objParam->insertar('id_ucmeitem')){
			$this->res=$this->objFunc->insertarUcmceitem($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcmceitem($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcmceitem(){
			$this->objFunc=$this->create('MODUcmceitem');	
		$this->res=$this->objFunc->eliminarUcmceitem($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>