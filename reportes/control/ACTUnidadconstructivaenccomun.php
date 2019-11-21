<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivaenccomun.php
*@author  (admin)
*@date 15-11-2018 12:59:55
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivaenccomun extends ACTbase{    
			
	function copiarUCCOM()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_Unidadconstructivaenccomun_copiar(" .$this->objParam->getParametro('id_unidadconstructivaenccomun') .");");
			
			return $res;
		}
	}
				
	function listarUnidadconstructivaenccomun(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaenccomun');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaenccomun','listarUnidadconstructivaenccomun');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaenccomun');
			
			$this->res=$this->objFunc->listarUnidadconstructivaenccomun($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	
	function listarOtrosgastos(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaenccomun');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivaenccomun')!=''){
			$this->objParam->addFiltro('mcuc.id_unidadconstructivaenccomun = ' . $this->objParam->getParametro('id_unidadconstructivaenccomun'));
		}
		else {
			$this->objParam->addFiltro("mcuc.id_unidadconstructivaenccomun = 0");
	    }
				
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaenccomun','listarOtrosgastos');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaenccomun');
			
			$this->res=$this->objFunc->listarOtrosgastos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivaenccomun(){
		$this->objFunc=$this->create('MODUnidadconstructivaenccomun');	
		if($this->objParam->insertar('id_unidadconstructivaenccomun')){
			$this->res=$this->objFunc->insertarUnidadconstructivaenccomun($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivaenccomun($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivaenccomun(){
			$this->objFunc=$this->create('MODUnidadconstructivaenccomun');	
		$this->res=$this->objFunc->eliminarUnidadconstructivaenccomun($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>