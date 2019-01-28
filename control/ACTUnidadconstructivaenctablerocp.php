<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivaenctablerocp.php
*@author  (admin)
*@date 15-11-2018 13:32:16
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivaenctablerocp extends ACTbase{    
		
	function copiarUCTB()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_Unidadconstructivaenctablerocp_copiar(" .$this->objParam->getParametro('id_unidadconstructivaenctablerocp') .");");
			
			return $res;
		}
	}
				
	function listarUnidadconstructivaenctablerocp(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaenctablerocp');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaenctablerocp','listarUnidadconstructivaenctablerocp');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaenctablerocp');
			
			$this->res=$this->objFunc->listarUnidadconstructivaenctablerocp($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarOtrosgastos(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaenctablerocp');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivaenctablerocp')!=''){
			$this->objParam->addFiltro('id_unidadconstructivaenctablerocp = ' . $this->objParam->getParametro('id_unidadconstructivaenctablerocp'));
		}
		else {
			$this->objParam->addFiltro("id_unidadconstructivaenctablerocp = 0");
	    }
				
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaenctablerocp','listarOtrosgastos');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaenctablerocp');
			
			$this->res=$this->objFunc->listarOtrosgastos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivaenctablerocp(){
		$this->objFunc=$this->create('MODUnidadconstructivaenctablerocp');	
		if($this->objParam->insertar('id_unidadconstructivaenctablerocp')){
			$this->res=$this->objFunc->insertarUnidadconstructivaenctablerocp($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivaenctablerocp($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivaenctablerocp(){
			$this->objFunc=$this->create('MODUnidadconstructivaenctablerocp');	
		$this->res=$this->objFunc->eliminarUnidadconstructivaenctablerocp($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>