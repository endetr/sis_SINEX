<?php

class RPrueba extends ReportePDF {
	var $datos_titulo;
	var $datos_detalle;
	var $ancho_hoja;
	var $gerencia;

	function datosHeader ($detalle) {
		$this->SetHeaderMargin(10);
		$this->SetAutoPageBreak(TRUE, 10);
		$this->ancho_hoja = $this->getPageWidth()-PDF_MARGIN_LEFT-PDF_MARGIN_RIGHT-10;
		$this->datos_detalle = $detalle;
		$this->SetMargins(10, 15, 5,10);
	}
	//
	function Header() {		
	}
	//	
	function generarCabecera(){
		$conf_par_tablewidths=array(7,40,10);
		$conf_par_tablenumbers=array(0,0,0);
		$conf_par_tablealigns=array('C','C','C');
		$conf_tabletextcolor=array();
		$this->tablewidths=$conf_par_tablewidths;
		$this->tablealigns=$conf_par_tablealigns;
		$this->tablenumbers=$conf_par_tablenumbers;
		$this->tableborders=$conf_tableborders;
		$this->tabletextcolor=$conf_tabletextcolor;
		$RowArray = array(
							's0' => 'Dato 1',
							's1' => 'Dato 2',
							's12' => 'Dato 3',
						);
		$this->MultiRow($RowArray, false, 1);
	}
	//
	function generarReporte($detalle,$tipo,$proveedor) {
		$this->setFontSubsetting(false);
		$this->AddPage();
		$this->generarCuerpo();
	}
	//		
	function generarCuerpo($detalle,$tipo,$proveedor){		
		$count = 1;
		$sw = 0;
		$ult_region = '';
		$fill = 0;
		$this->total = count($detalle);
		$this->s1 = 0;
		$this->s2 = 0;
		$this->s3 = 0;
		$this->s4 = 0;
		$this->s5 = 0;
		$this->s6 = 0;
		$this->s7 = 0;
		$this->s8 = 0;
		$this->imprimirLinea($val,$count,$fill);
	}
	//desde 
	function imprimirLinea($val,$count,$fill){
		$this->SetFillColor(224, 235, 255);
		$this->SetTextColor(0,0,0);
		$this->SetFont('','',6);
		$i=1;
		foreach ($this->cobro as $datarow) {
			$this->tablealigns=array('C','L');	// las alings de las tablas center left right	
			$this->tableborders=array('RLT','RLT'); // los bordes de la tabla right left top botton
			$this->tabletextcolor=array();	
			
			$RowArray = array(
				's0' =>$i,
				's1' =>$datarow['dato_1'],
				's2' =>trim($datarow['dato_2'])
			);
			$fill = !$fill;					
			$this->total = $this->total -1;			
			$i++;		
			$this-> MultiRow($RowArray,$fill,0);										
			$this->revisarfinPagina($datarow);
		}
		$this->tablewidths=$conf_par_tablewidths;
		$this->tablealigns=$conf_par_tablealigns;
		$this->tablenumbers=$conf_par_tablenumbers;
		$this->tableborders=$conf_tableborders;
		$this->tabletextcolor=$conf_tabletextcolor;
	} 
	//desde generar cuerpo
	function revisarfinPagina($a){
		$dimensions = $this->getPageDimensions();
		$hasBorder = false;
		$startY = $this->GetY();
		$this->getNumLines($row['cell1data'], 90);
		$this->calcularMontos($a);			
		if ($startY > 235) {			
			if($this->total!= 0){
				$this->AddPage();
				$this->generarCabecera();
			}				
		}
	}
	//pie de pagina
	function Footer() {		
		$this->setY(-15);
		$ormargins = $this->getOriginalMargins();
		$this->SetTextColor(0, 0, 0);
		$line_width = 0.85 / $this->getScaleFactor();
		$this->SetLineStyle(array('width' => $line_width, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => array(0, 0, 0)));
		$ancho = round(($this->getPageWidth() - $ormargins['left'] - $ormargins['right']) / 3);
		$this->Ln(2);
		$cur_y = $this->GetY();
		$this->Cell($ancho, 0, '', '', 0, 'L');
		$pagenumtxt = 'Página'.' '.$this->getAliasNumPage().' de '.$this->getAliasNbPages();
		$this->Cell($ancho, 0, $pagenumtxt, '', 0, 'C');
		$this->Cell($ancho, 0, '', '', 0, 'R');
		$this->Ln();
		$fecha_rep = date("d-m-Y H:i:s");
		$this->Cell($ancho, 0, '', '', 0, 'L');
		$this->Ln($line_width);
	}
}
?>