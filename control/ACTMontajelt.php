<?php
/**
*@package pXP
*@file gen-ACTMontajelt.php
*@author  (admin)
*@date 19-07-2018 12:33:51
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMontajelt extends ACTbase{    
			
	function listarMontajelt(){
		$this->objParam->defecto('ordenacion','id_montajelt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMontajelt','listarMontajelt');
		} else{
			$this->objFunc=$this->create('MODMontajelt');
			
			$this->res=$this->objFunc->listarMontajelt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarMontajecantlt(){
		$this->objParam->defecto('ordenacion','id_montajelt');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivalt')!=''){
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = ".$this->objParam->getParametro('id_unidadconstructivalt'));
	    }
		else {
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMontajelt','listarMontajecantlt');
		} else{
			$this->objFunc=$this->create('MODMontajelt');
			
			$this->res=$this->objFunc->listarMontajecantlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMontajelt(){
		$this->objFunc=$this->create('MODMontajelt');	
		if($this->objParam->insertar('id_montajelt')){
			$this->res=$this->objFunc->insertarMontajelt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMontajelt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMontajelt(){
			$this->objFunc=$this->create('MODMontajelt');	
		$this->res=$this->objFunc->eliminarMontajelt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>