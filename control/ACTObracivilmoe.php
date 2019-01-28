<?php
/**
*@package pXP
*@file gen-ACTObracivilmoe.php
*@author  (admin)
*@date 30-08-2018 18:19:48
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTObracivilmoe extends ACTbase{    
			
	function listarObracivilmoe(){
		$this->objParam->defecto('ordenacion','id_obracivilmoe');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObracivilmoe','listarObracivilmoe');
		} else{
			$this->objFunc=$this->create('MODObracivilmoe');
			
			$this->res=$this->objFunc->listarObracivilmoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}	
	
	function listarObracivilTrans(){
		$this->objParam->defecto('ordenacion','strtransporte');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObracivilmoe','listarObracivilTrans');
		} else{
			$this->objFunc=$this->create('MODObracivilmoe');
			
			$this->res=$this->objFunc->listarObracivilTrans($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}	
		
	function listarOtrosmoe(){
		$this->objParam->defecto('ordenacion','id_obracivilmoe');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_obracivilmoe')!=''){
			$this->objParam->addFiltro("obrci.id_obracivilmoe = ".$this->objParam->getParametro('id_obracivilmoe'));
	    }
		 else {
	    	$this->objParam->addFiltro("obrci.id_obracivilmoe = 0");
	    }		
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObracivilmoe','listarOtrosmoe');
		} else{
			$this->objFunc=$this->create('MODObracivilmoe');
			
			$this->res=$this->objFunc->listarOtrosmoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarObracivilmoe(){
		$this->objFunc=$this->create('MODObracivilmoe');	
		if($this->objParam->insertar('id_obracivilmoe')){
			$this->res=$this->objFunc->insertarObracivilmoe($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarObracivilmoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarObracivilmoe(){
			$this->objFunc=$this->create('MODObracivilmoe');	
		$this->res=$this->objFunc->eliminarObracivilmoe($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>