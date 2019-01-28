<?php
/**
*@package pXP
*@file gen-ACTObracivillt.php
*@author  (admin)
*@date 25-07-2018 14:56:53
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTObracivillt extends ACTbase{    
			
	function listarObracivillt(){
		$this->objParam->defecto('ordenacion','id_obracivillt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObracivillt','listarObracivillt');
		} else{
			$this->objFunc=$this->create('MODObracivillt');
			
			$this->res=$this->objFunc->listarObracivillt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarObracivilcantlt(){
		$this->objParam->defecto('ordenacion','id_obracivillt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivalt')!=''){
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = ".$this->objParam->getParametro('id_unidadconstructivalt'));
	    }
		else
		{
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = 0");
		}
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObracivillt','listarObracivilcantlt');
		} else{
			$this->objFunc=$this->create('MODObracivillt');
			
			$this->res=$this->objFunc->listarObracivilcantlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarObracivillt(){
		$this->objFunc=$this->create('MODObracivillt');	
		if($this->objParam->insertar('id_obracivillt')){
			$this->res=$this->objFunc->insertarObracivillt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarObracivillt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarObracivillt(){
			$this->objFunc=$this->create('MODObracivillt');	
		$this->res=$this->objFunc->eliminarObracivillt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>