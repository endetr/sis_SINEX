<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivamo.php
*@author  (admin)
*@date 27-07-2018 15:39:11
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivamo extends ACTbase{	
	
	function copiarUCMCC()
	{
		$cone=new conexion();
		if($this->tipo_conexion=='persistente'){
			//echo 'fff';exit;
			$link=$cone->conectarp();
		}
	    elseif($this->tipo_conexion=='seguridad'){
	    	//echo 'aaa';exit;
			$link=$cone->conectarSegu();
		}
		else{
			//echo 'sss';exit;
			$link=$cone->conectarnp($this->remote);
		}
		
		if($link==0){

			$this->res->imprimirRespuesta('No se puede conectar a la base de datos','Revise la cadena de conexion a la BD','modelo');
		}
		//Si tengo conexion a la Bd ejecuto la consulta
		else{			
			$res=pg_query($link,"SELECT * FROM snx.ft_unidadconstructivamo_copiar(" .$this->objParam->getParametro('id_unidadconstructivamo') .");");
			
			return $res;
		}
	}
	
	function resetCantOBC(){
		$this->objFunc=$this->create('MODUnidadconstructivamo');	
		$this->res=$this->objFunc->resetCantOBC($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}    
			
	function listarUnidadconstructivamo(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivamo');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivamo','listarUnidadconstructivamo');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivamo');
			
			$this->res=$this->objFunc->listarUnidadconstructivamo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarOtrosgastos(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivamo');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivamo')!=''){
			$this->objParam->addFiltro('id_unidadconstructivamo = ' . $this->objParam->getParametro('id_unidadconstructivamo'));
		}
		else {
			$this->objParam->addFiltro("id_unidadconstructivamo = 0");
	    }
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivamo','listarOtrosgastos');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivamo');
			
			$this->res=$this->objFunc->listarOtrosgastos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivamo(){
		$this->objFunc=$this->create('MODUnidadconstructivamo');	
		if($this->objParam->insertar('id_unidadconstructivamo')){
			$this->res=$this->objFunc->insertarUnidadconstructivamo($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivamo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivamo(){
			$this->objFunc=$this->create('MODUnidadconstructivamo');	
		$this->res=$this->objFunc->eliminarUnidadconstructivamo($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>