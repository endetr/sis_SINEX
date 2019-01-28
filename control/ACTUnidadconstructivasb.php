<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivasb.php
*@author  (admin)
*@date 11-07-2018 16:47:14
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivasb extends ACTbase{    
			
	function listarUnidadconstructivasb(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivasb');

		$this->objParam->defecto('dir_ordenacion','asc');
				
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivasb','listarUnidadconstructivasb');			
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivasb');
			
			$this->res=$this->objFunc->listarUnidadconstructivasb($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivasb(){
		$this->objFunc=$this->create('MODUnidadconstructivasb');	
		if($this->objParam->insertar('id_unidadconstructivasb')){
			$this->res=$this->objFunc->insertarUnidadconstructivasb($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivasb($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivasb(){
		$this->objFunc=$this->create('MODUnidadconstructivasb');	
		$this->res=$this->objFunc->eliminarUnidadconstructivasb($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}	
	
	function resetCant(){
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
			$res=pg_query($link,"SELECT snx.ft_ucsbequipo_Reset();");
			
			return $res;
		}
	}
	
	function addCantTemp(){
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
			$res=pg_query($link,"SELECT snx.ft_ucsbequipotemp_Add();");
			
			return $res;
		}
	}    
			
}

?>