<?php
/**
*@package pXP
*@file gen-ACTMaterialpreciolt.php
*@author  (admin)
*@date 19-07-2018 14:36:40
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaterialpreciolt extends ACTbase{    
			
	function listarMaterialpreciolt(){
		$this->objParam->defecto('ordenacion','id_materialpreciolt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_materiallt')!=''){
		$this->objParam->addFiltro("mtplt.id_materiallt = ".$this->objParam->getParametro('id_materiallt'));
	    }else {
	    	$this->objParam->addFiltro("mtplt.id_materiallt = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaterialpreciolt','listarMaterialpreciolt');
		} else{
			$this->objFunc=$this->create('MODMaterialpreciolt');
			
			$this->res=$this->objFunc->listarMaterialpreciolt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaterialpreciolt(){
		$this->objFunc=$this->create('MODMaterialpreciolt');	
		if($this->objParam->insertar('id_materialpreciolt')){
			$this->res=$this->objFunc->insertarMaterialpreciolt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaterialpreciolt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaterialpreciolt(){
			$this->objFunc=$this->create('MODMaterialpreciolt');	
		$this->res=$this->objFunc->eliminarMaterialpreciolt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>