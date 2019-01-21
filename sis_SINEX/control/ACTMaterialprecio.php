<?php
/**
*@package pXP
*@file gen-ACTMaterialprecio.php
*@author  (admin)
*@date 05-07-2018 13:09:03
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaterialprecio extends ACTbase{    
			
	function listarMaterialprecio(){
		$this->objParam->defecto('ordenacion','id_materialprecio');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_material')!=''){
			$this->objParam->addFiltro("matpre.id_material = ".$this->objParam->getParametro('id_material'));
	    } else {
	    	$this->objParam->addFiltro("matpre.id_material = 0");
	    }	
		
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaterialprecio','listarMaterialprecio');
		} else{
			$this->objFunc=$this->create('MODMaterialprecio');
			
			$this->res=$this->objFunc->listarMaterialprecio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaterialprecio(){
		$this->objFunc=$this->create('MODMaterialprecio');	
		if($this->objParam->insertar('id_materialprecio')){
			$this->res=$this->objFunc->insertarMaterialprecio($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaterialprecio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaterialprecio(){
			$this->objFunc=$this->create('MODMaterialprecio');	
		$this->res=$this->objFunc->eliminarMaterialprecio($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>