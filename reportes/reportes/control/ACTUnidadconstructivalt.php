<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivalt.php
*@author  (admin)
*@date 03-08-2018 15:44:56
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivalt extends ACTbase{    
			
	function listarUnidadconstructivalt(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivalt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivalt','listarUnidadconstructivalt');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivalt');
			
			$this->res=$this->objFunc->listarUnidadconstructivalt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarUnidadconstructivaltddl(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivalt');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivalt','listarUnidadconstructivalt');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivalt');
			
			$this->res=$this->objFunc->listarUnidadconstructivaltddl($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarGastoscontratistalt(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivalt');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivalt')!=''){
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = ".$this->objParam->getParametro('id_unidadconstructivalt'));
	    }
		else {
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivalt','listarGastoscontratistalt');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivalt');
			
			$this->res=$this->objFunc->listarGastoscontratistalt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarOtrosgastoslt(){
		$this->objParam->defecto('ordenacion','id_descripcion');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivalt')!=''){
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = ".$this->objParam->getParametro('id_unidadconstructivalt'));
	    }
		else {
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMontajelt','listarOtrosgastoslt');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivalt');
			
			$this->res=$this->objFunc->listarOtrosgastoslt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivalt(){
		$this->objFunc=$this->create('MODUnidadconstructivalt');	
		if($this->objParam->insertar('id_unidadconstructivalt')){
			$this->res=$this->objFunc->insertarUnidadconstructivalt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivalt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivalt(){
			$this->objFunc=$this->create('MODUnidadconstructivalt');	
		$this->res=$this->objFunc->eliminarUnidadconstructivalt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>