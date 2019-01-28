<?php
/**
*@package pXP
*@file gen-ACTMateriales.php
*@author  (admin)
*@date 16-07-2018 14:29:09
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMateriales extends ACTbase{    
			
	function listarMateriales(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivasb');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivasb')!=''){
		$this->objParam->addFiltro("id_unidadconstructivasb = ".$this->objParam->getParametro('id_unidadconstructivasb'));
	    }
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMateriales','listarMateriales');
		} else{
			$this->objFunc=$this->create('MODMateriales');
			
			$this->res=$this->objFunc->listarMateriales($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}			
				
}

?>