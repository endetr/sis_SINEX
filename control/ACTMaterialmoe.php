<?php
/**
*@package pXP
*@file gen-ACTMaterialmoe.php
*@author  (admin)
*@date 29-08-2018 18:34:08
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaterialmoe extends ACTbase{    
			
	function listarMaterialmoe(){
		$this->objParam->defecto('ordenacion','id_materialmoe');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaterialmoe','listarMaterialmoe');
		} else{
			$this->objFunc=$this->create('MODMaterialmoe');
			
			$this->res=$this->objFunc->listarMaterialmoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaterialmoe(){
		$this->objFunc=$this->create('MODMaterialmoe');	
		if($this->objParam->insertar('id_materialmoe')){
			$this->res=$this->objFunc->insertarMaterialmoe($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaterialmoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaterialmoe(){
			$this->objFunc=$this->create('MODMaterialmoe');	
		$this->res=$this->objFunc->eliminarMaterialmoe($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>