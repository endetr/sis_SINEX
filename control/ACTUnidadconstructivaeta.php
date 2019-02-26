<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivaeta.php
*@author  (admin)
*@date 25-02-2019 15:32:13
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivaeta extends ACTbase{    
			
	function copiarUCETA()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_Unidadconstructivaeta_copiar(" .$this->objParam->getParametro('id_unidadconstructivaeta') .");");
			
			return $res;
		}
	}
				
	function listarUnidadconstructivaeta(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaeta');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaeta','listarUnidadconstructivaeta');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaeta');
			
			$this->res=$this->objFunc->listarUnidadconstructivaeta($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
	function listarOtrosgastos(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaeta');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivaeta')!=''){
			$this->objParam->addFiltro('mcuc.id_unidadconstructivaeta = ' . $this->objParam->getParametro('id_unidadconstructivaeta'));
		}
		else {
			$this->objParam->addFiltro("mcuc.id_unidadconstructivaeta = 0");
	    }
				
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaeta','listarOtrosgastos');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaeta');
			
			$this->res=$this->objFunc->listarOtrosgastos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
					
	function insertarUnidadconstructivaeta(){
		$this->objFunc=$this->create('MODUnidadconstructivaeta');	
		if($this->objParam->insertar('id_unidadconstructivaeta')){
			$this->res=$this->objFunc->insertarUnidadconstructivaeta($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivaeta($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivaeta(){
			$this->objFunc=$this->create('MODUnidadconstructivaeta');	
		$this->res=$this->objFunc->eliminarUnidadconstructivaeta($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>