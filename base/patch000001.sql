/***********************************I-SCP-JYP-CMS-1-18/01/2019****************************************/

CREATE TABLE snx.taislador (
    id_aislador integer NOT NULL,
    aislador character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.taislador_id_aislador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tambitoprecio (
    id_ambitoprecio integer NOT NULL,
    ambitoprecio character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tambitoprecio_id_ambitoprecio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	
CREATE TABLE snx.tareaprotegida (
    id_areaprotegida integer NOT NULL,
    areaprotegida character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tareaprotegida_id_areaprotegida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tcable (
    id_cable integer NOT NULL,
    cable character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tcable_id_cable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	
	
CREATE TABLE snx.tclaseaislacion (
    id_claseaislacion integer NOT NULL,
    claseaislacion character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tclaseaislacion_id_claseaislacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	

CREATE TABLE snx.tclasificacionaltura (
    id_clasificacionaltura integer NOT NULL,
    valoraltura numeric(18,2),
    factor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tclasificacionaltura_id_clasificacionaltura_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	

CREATE TABLE snx.tconfiguracionlt (
    id_configuracionlt integer NOT NULL,
    configuracionlt character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tconfiguracionlt_id_configuracionlt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tequipo (
    id_equipo integer NOT NULL,
    equipo character varying(100),
    id_claseaislacion integer,
    id_factorindexacion integer,
    id_ambitoprecio integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tequipo_id_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	

CREATE TABLE snx.tequipomaterial (
    id_equipo integer,
    id_material integer,
    cantidadequimat numeric(18,2),
    id_equipomaterial integer NOT NULL
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tequipomaterial_id_equipomaterial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tequipoobracivil (
    id_equipoobracivil integer NOT NULL,
    id_obracivil integer,
    id_equipo integer,
    cantidadeoc numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tequipoobracivil_id_equipoobracivil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	

CREATE TABLE snx.tequipoprecio (
    id_equipoprecio integer NOT NULL,
    id_equipo integer,
    proyecto character varying(100),
    fechaprecio date,
    id_moneda integer,
    valorequipo numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tequipoprecio_id_equipoprecio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE

	
	

CREATE TABLE snx.textraslt (
    id_extraslt integer NOT NULL,
    extraslt character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.textraslt_id_extraslt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	
CREATE TABLE snx.tfactorambiental (
    id_factorambiental integer NOT NULL,
    rangoinicial numeric(18,2),
    rangofinal numeric(18,2),
    porcprotegida numeric(18,2),
    porcsinproteger numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tfactorambiental_id_factorambiental_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tfactorzona (
    id_factorzona integer NOT NULL,
    calificacion character varying(50),
    factor numeric(18,2),
    distanciaini integer,
    distanciafin integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tfactorzona_id_factorzona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tfuncionestructura (
    id_funcionestructura integer NOT NULL,
    funcionestructura character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tfuncionestructura_id_funcionestructura_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.therrajeaccesorio (
    id_herrajeaccesorio integer NOT NULL,
    herrajeaccesorio character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.therrajeaccesorio_id_herrajeaccesorio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.thilosguarda (
    id_hilosguarda integer NOT NULL,
    hilosguarda character varying(100),
    cantidadopgw integer,
    cantidadacero integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.thilosguarda_id_hilosguarda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tindiceslt (
    id_indicelt integer NOT NULL,
    indicelt character varying(100),
    id_ambitoprecio integer,
    id_unidad integer,
    id_indicetipo integer,
    valorindice numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tindiceslt_id_indicelt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tindicetipo (
    id_indicetipo integer NOT NULL,
    indicetipo character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tindicetipo_id_indicetipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tingenierialt (
    id_ingenierialt integer NOT NULL,
    id_tipolinea integer,
    id_tensionservicio integer,
    id_unidadconstructivalt integer,
    valoringenieria numeric(18,4)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tingenierialt_id_ingenierialt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tlistafactoresindexacion (
    id_factorindexacion integer NOT NULL,
    factorindexacion character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tlistafactoresindexacion_id_factorindexacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmanoobramoe (
    id_manoobramoe integer NOT NULL,
    manoobramoe character varying(1000),
    id_unidad integer,
    valorunitariorlp numeric(18,5),
    valorunitariorcb numeric(18,5),
    valorunitariorsc numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmanoobramoe_id_manoobramoe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	
CREATE TABLE snx.tmaquinaria (
    id_maquinaria integer NOT NULL,
    maquinaria character varying(100),
    potencia numeric(18,2),
    peso numeric(18,2),
    id_factorindexacion integer,
    id_ambitoprecio integer,
    id_tipopreciomaquinaria integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;


CREATE SEQUENCE snx.tmaquinaria_id_maquinaria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaquinariafactor (
    id_maquinariafactor integer NOT NULL,
    id_obracivil integer,
    id_tipopreciomaquinaria integer,
    numfactor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaquinariafactor_id_maquinariafactor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE snx.tmaquinariamaterial (
    id_maquinaria integer,
    id_material integer,
    cantidadmate numeric(18,2),
    id_maquinariamaterial integer NOT NULL
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaquinariamaterial_id_maquinariamaterial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaquinariamoe (
    id_maquinariamoe integer NOT NULL,
    maquinariamoe character varying(1000),
    id_unidad integer,
    valorunitariorlp numeric(18,5),
    valorunitariorcb numeric(18,5),
    valorunitariorsc numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaquinariamoe_id_maquinariamoe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaquinariaobracivil (
    id_maquinariaobracivil integer NOT NULL,
    id_obracivil integer,
    id_maquinaria integer,
    cantidadmoc numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaquinariaobracivil_id_maquinariaobracivil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaquinariaprecio (
    id_maquinariaprecio integer NOT NULL,
    id_maquinaria integer,
    proyecto character varying(100),
    fechaprecio date,
    id_moneda integer,
    valormaquinaria numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaquinariaprecio_id_maquinariaprecio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaterial (
    id_material integer NOT NULL,
    material character varying(100),
    id_unidad integer,
    peso numeric(18,2),
    id_factorindexacion integer,
    id_ambitoprecio integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaterial_id_material_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaterialcantidadlt (
    id_materialcantidadlt integer NOT NULL,
    id_materiallt integer,
    id_tipoconductor integer,
    hilosguarda integer,
    id_configuracionlt integer,
    cantidadmontajelt numeric(18,5),
    id_tensionservicio integer,
    id_funcionestructura integer,
    id_puestatierra integer,
    id_aislador integer,
    id_tipolinea integer,
    id_extralt integer,
    id_tipoestructura integer,
    id_hilosguarda integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaterialcantidadlt_id_materialcantidadlt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmateriales (
    id_materiales integer NOT NULL,
    id_unidadconstructivasb integer,
    codigo character varying(100),
    descripcion character varying(100),
    id_material integer,
    material character varying(100),
    cantidadmate numeric(18,2),
    valorunitario numeric(18,2),
    valortotal numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmateriales_id_materiales_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmateriallt (
    id_materiallt integer NOT NULL,
    materiallt character varying(100),
    id_unidad integer,
    peso numeric(18,5),
    id_factorindexacion integer,
    id_ambitoprecio integer,
    id_tipolinea integer,
    cargarotura numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmateriallt_id_materiallt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaterialmoe (
    id_materialmoe integer NOT NULL,
    materialmoe character varying(1000),
    id_unidad integer,
    valorunitariorlp numeric(18,5),
    valorunitariorcb numeric(18,5),
    valorunitariorsc numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaterialmoe_id_materialmoe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaterialprecio (
    id_materialprecio integer NOT NULL,
    id_material integer,
    proyecto character varying(100),
    fechaprecio date,
    id_moneda integer,
    valormaterial numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaterialprecio_id_materialprecio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmaterialpreciolt (
    id_materialpreciolt integer NOT NULL,
    id_materiallt integer,
    proyecto character varying(100),
    fechaprecio timestamp without time zone,
    id_moneda integer,
    valormateriallt numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmaterialpreciolt_id_materialpreciolt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	

CREATE TABLE snx.tmcelecapantallamiento (
    id_mcelecapantallamiento integer NOT NULL,
    id_claseaislamiento integer,
    cableporbahia numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmcelecapantallamiento_id_mcelecapantallamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE TABLE snx.tmceleciluminacion (
    id_meleciluminacion integer NOT NULL,
    id_tensionservicio integer,
    luminariaporpb integer,
    tubopvc numeric(18,2),
    totalcable numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmeleciluminacion_id_meleciluminacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
	
	

CREATE TABLE snx.tmcelecmallatierra (
    id_mcelecmallatierra integer NOT NULL,
    id_claseaislamiento integer,
    cableporbahina numeric(18,2),
    factortorre numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmcelecmallatierra_id_mcelecmallatierra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	


CREATE TABLE snx.tmes (
    id_mes integer NOT NULL,
    nombre character varying(20)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmes_id_mes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	

CREATE TABLE snx.tmoneda (
    id_moneda integer NOT NULL,
    moneda character varying(50)
)
INHERITS (pxp.tbase);
ALTER TABLE ONLY snx.tmoneda ALTER COLUMN id_moneda SET STATISTICS 0;

CREATE SEQUENCE snx.tmoneda_id_moneda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
	

CREATE TABLE snx.tmontajecantidadlt (
    id_montajecantidadlt integer NOT NULL,
    id_montajelt integer,
    id_tensionservicio integer,
    id_tipoestructura integer,
    id_configuracionlt integer,
    cantidadmontajelt numeric(18,4),
    id_tipolinea integer,
    id_funcionestructura integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmontajecantidadlt_id_montajecantidadlt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tmontajelt (
    id_montajelt integer NOT NULL,
    montajelt character varying(200),
    id_unidad integer,
    id_factorindexacion integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmontajelt_id_montajelt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


	

CREATE TABLE snx.tmontajepreciolt (
    id_montajepreciolt integer NOT NULL,
    id_montajelt integer,
    proyecto character varying(100),
    fechaprecio date,
    id_moneda integer,
    valormontajelt numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tmontajepreciolt_id_montajepreciolt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tnivelcontaminacionlt (
    id_nivelcontaminacionlt integer NOT NULL,
    nivelcontaminacionlt character varying(50),
    factor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tnivelcontaminacionlt_id_nivelcontaminacionlt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tobracivil (
    id_obracivil integer NOT NULL,
    obracivil character varying(100),
    id_unidad integer
)
WITHOUT OIDS;

CREATE SEQUENCE snx.tobracivil_id_obracivil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tobracivilcantidadlt (
    id_obracivilcantidadlt integer NOT NULL,
    id_obracivillt integer,
    id_tipolinea integer,
    id_tensionservicio integer,
    id_tipoestructura integer,
    id_configuracionlt integer,
    id_funcionestructura integer,
    id_terreno integer,
    id_tipocimentacion integer,
    id_tipocanalizacion integer,
    cantidadobracivillt numeric(18,4)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tobracivilcantidadlt_id_obracivilcantidadlt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tobraciviles (
    id_obrasciviles integer NOT NULL,
    id_unidadconstructivasb integer,
    codigo character varying(100),
    descripcion character varying(100),
    id_obracivil integer,
    obracivil character varying(100),
    cantidadmoc numeric(18,2),
    valorunitario numeric(18,2),
    valortotal numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tobraciviles_id_obrasciviles_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tobracivillt (
    id_obracivillt integer NOT NULL,
    obracivillt character varying(50),
    id_unidad integer,
    peso numeric(18,5),
    id_factorindexacion integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tobracivillt_id_obracivillt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tobracivilmoe (
    id_obracivilmoe integer NOT NULL,
    obracivilmoe character varying(1000),
    id_unidad integer,
    valorunitario numeric(18,2),
    porccargasocial numeric(18,2),
    porcimpmanoobra numeric(18,2),
    porcherramientas numeric(18,2),
    porcgastosga numeric(18,2),
    porcutilidad numeric(18,2),
    porcimpuestos numeric(18,2),
    strtransporte character varying(2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tobracivilmoe_id_obracivilmoe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tobracivilpreciolt (
    id_obracivilpreciolt integer NOT NULL,
    id_obracivillt integer,
    proyecto character varying(100),
    fechaprecio date,
    id_moneda integer,
    valorobracivillt numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tobracivilpreciolt_id_obracivilpreciolt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tocmanoobramoe (
    id_ocmanoobramoe integer NOT NULL,
    id_obracivilmoe integer,
    id_manoobramoe integer,
    cantidadmanoobramoe numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tocmanoobramoe_id_ocmanoobramoe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tocmaquinariamoe (
    id_ocmaquinariamoe integer NOT NULL,
    id_obracivilmoe integer,
    id_maquinariamoe integer,
    cantidadmaquinariamoe numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tocmaquinariamoe_id_ocmaquinariamoe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tocmaterialmoe (
    id_ocmaterialmoe integer NOT NULL,
    id_obracivilmoe integer,
    id_materialmoe integer,
    cantidadmaterialmoe numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tocmaterialmoe_id_ocmaterialmoe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tpararrayatolinea (
    id_pararrayolinea integer NOT NULL,
    pararrayolinea character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tpararrayatolinea_id_pararrayolinea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tpcu335311335311 (
    id_pcu335311335311 integer NOT NULL,
    ano integer,
    id_mes integer,
    valor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tpcu335311335311_id_pcu335311335311_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tpcu335313335313 (
    id_pcu335313335313 integer NOT NULL,
    ano integer,
    id_mes integer,
    valor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tpcu335313335313_id_pcu335313335313_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tpuc33123312 (
    id_pcu33123312 integer NOT NULL,
    ano integer,
    id_mes integer,
    valor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tpuc33123312_id_pcu33123312_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tpuc3359293359291 (
    id_puc3359293359291 integer NOT NULL,
    ano integer,
    id_mes integer,
    valor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tpuc3359293359291_id_puc3359293359291_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.trevista (
    id_revista integer NOT NULL,
    revista character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.trevista_id_revista_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tspuestatierra (
    id_puestatierra integer NOT NULL,
    puestatierra character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tspuestatierra_id_puestatierra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttarifaingsb (
    id_tarifaingsb integer NOT NULL,
    numerobahias integer,
    porceingenieria numeric(18,2),
    porceidfaenas numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttarifaingsb_id_tarifaingsb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttarifassb (
    id_tarifasb integer NOT NULL,
    tarifasb character varying(100),
    id_unidad integer,
    valortarifa numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttarifassb_id_tarifasb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttasacambio (
    id_tasacambio integer NOT NULL,
    id_monedaorigen integer,
    id_monedadestino integer,
    id_mes integer,
    ano integer,
    valor numeric(18,4)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttasacambio_id_tasacambio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttensionservicio (
    id_tensionservicio integer NOT NULL,
    tensionservicio character varying(50),
    um_kv numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttensionservicio_id_tensionservicio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tterrenolt (
    id_terrenolt integer NOT NULL,
    terrenolt character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tterrenolt_id_terrenolt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	
CREATE TABLE snx.tterrenosb (
    id_terrenosb integer NOT NULL,
    terrenosb character varying(50),
    factor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tterrenosb_id_terrenosb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttipocanalizacion (
    id_tipocanalizacion integer NOT NULL,
    tipocanalizacion character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttipocanalizacion_id_tipocanalizacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttipocimentacion (
    id_tipocimentacion integer NOT NULL,
    tipocimentacion character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttipocimentacion_id_tipocimentacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttipoconductor (
    id_tipoconductor integer NOT NULL,
    tipoconductor character varying(50),
    id_tensionservicio integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttipoconductor_id_tipoconductor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttipoestructura (
    id_tipoestructura integer NOT NULL,
    tipoestructura character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttipoestructura_id_tipoestructura_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttipolinea (
    id_tipolinea integer NOT NULL,
    tipolinea character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttipolinea_id_tipolinea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.ttipopreciomaquinaria (
    id_tipopreciomaquinaria integer NOT NULL,
    tipopreciomaquinaria character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.ttipopreciomaquinaria_id_tipopreciomaquinaria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tubicacion (
    id_ubicacion integer NOT NULL,
    ubicacion character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tubicacion_id_ubicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucedifgrupo (
    id_ucedifgrupo integer NOT NULL,
    id_unidadconstructivaedif integer,
    ucedifgrupo character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucedifgrupo_id_ucedifgrupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucedifobracivil (
    id_ucedifobracivil integer NOT NULL,
    id_ucedifsubgrupo integer,
    id_obracivilmoe integer,
    cantidadobracivil numeric(18,4)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucedifobracivil_id_ucedifobracivil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucedifsubgrupo (
    id_ucedifsubgrupo integer NOT NULL,
    id_ucedifgrupo integer,
    ucedifsubgrupo character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucedifsubgrupo_id_ucedifsubgrupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tuceepitem (
    id_uceepitem integer NOT NULL,
    id_unidadconstructivaeep integer,
    descripcion character varying(1000),
    valor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tuceepitem_id_uceepitem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltmaestragrupo (
    id_grupo integer NOT NULL,
    grupo character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltmaestragrupo_id_grupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltmaestraitem (
    id_item integer NOT NULL,
    item character varying(100),
    id_grupo integer,
    id_unidad integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltmaestraitem_id_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltvalorar (
    id_ucltvalorar integer NOT NULL,
    codigoproy character varying(50),
    nombreproy character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltvalorar_id_ucltvalorar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltvaloraruc (
    id_ucltvaloraruc integer NOT NULL,
    id_ucltvalorar integer,
    codigo character varying(50),
    descripcion character varying(100),
    id_tipolinea integer,
    id_tensionservicio integer,
    longitud numeric(18,5),
    numddp numeric(18,2),
    nummontaje numeric(18,2),
    numoc numeric(18,2),
    numingenieria numeric(18,2),
    numinspeccion numeric(18,2),
    numadmeje numeric(18,2),
    numsupero numeric(18,2),
    numcfinan numeric(18,2),
    numcaamb numeric(18,2),
    numcapred numeric(18,2),
    numcostototaluc numeric(18,2),
    id_unidadconstructivalt integer,
    desc_tipoconductor character varying(1000),
    distanciatransporte numeric(18,2),
    distanciatransporteext numeric(18,2),
    conductorfase integer,
    desc_configuracionlt character varying(100),
    desc_hilosguarda character varying(100),
    desc_valoraltura character varying(100),
    desc_revista character varying(100),
    desc_pararrayolinea character varying(50),
    estructurapasocantidad numeric(18,2),
    estructurapasopeso numeric(18,2),
    estructuraamarrecantidad numeric(18,2),
    estructuraamarrepeso numeric(18,2),
    porcmterrenofirme numeric(18,2),
    porcmterrenointerme numeric(18,2),
    porcmterrenoterrenoblando numeric(18,2),
    porcmterrenosumer numeric(18,2),
    porcvegetamaleza numeric(18,2),
    porcvegetamatorral numeric(18,2),
    porcvegetaforestacion numeric(18,2),
    porcvegetabosque numeric(18,2),
    porcterrenoplano numeric(18,2),
    porcterrenoondulado numeric(18,2),
    porcterrenocerros numeric(18,2),
    desc_areaprotegida character varying(100),
    desc_tipoestructura character varying(100),
    desc_nivelcontaminacionlt character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltvaloraruc_id_ucltvaloraruc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltvalorarucem (
    id_ucltvalorarucem integer NOT NULL,
    id_ucltvaloraruc integer,
    id_grupo integer,
    grupo character varying(100),
    id_item integer,
    item character varying(1000),
    unidadabrev character varying(50),
    cantidaditem numeric(18,5),
    costounitarioext numeric(18,2),
    costounitarionac numeric(18,2),
    pesounitarioext numeric(18,5),
    pesounitarionac numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltvalorarucem_id_ucltvalorarucem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltvalorarucgc (
    id_ucltvalorarucgc integer NOT NULL,
    id_ucltvaloraruc integer,
    id_descripcion integer,
    descripcion character varying(1000),
    unidad character varying(50),
    costobase numeric(18,5),
    cantidaditem numeric(18,2),
    costototal numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltvalorarucgc_id_ucltvalorarucgc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltvalorarucmon (
    id_ucltvalorarucmon integer NOT NULL,
    id_ucltvaloraruc integer,
    id_grupo integer,
    grupo character varying(100),
    id_item integer,
    item character varying(1000),
    unidadabrev character varying(50),
    cantidaditem numeric(18,5),
    costounitario numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltvalorarucmon_id_ucltvalorarucmon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltvalorarucoc (
    id_ucltvalorarucoc integer NOT NULL,
    id_ucltvaloraruc integer,
    terrenolt character varying(100),
    funcionestructura character varying(100),
    tipocimentacion character varying(100),
    cantidaditem numeric(18,5),
    costounitariooc numeric(18,2),
    pesounitariooc numeric(18,5)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltvalorarucoc_id_ucltvalorarucoc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucltvalorarucogrg (
    id_ucltvalorarucogrg integer NOT NULL,
    id_ucltvaloraruc integer,
    id_descripcion integer,
    descripcion character varying(1000),
    unidad character varying(50),
    costobase numeric(18,5),
    cantidaditem numeric(18,2),
    costototal numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucltvalorarucogrg_id_ucltvalorarucogrg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucmceitem (
    id_ucmeitem integer NOT NULL,
    id_unidadconstructivamcelec integer,
    grupo character varying(50),
    descripcion character varying(1000),
    precio numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucmceitem_id_ucmeitem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucmogrupo (
    id_ucmogrupo integer NOT NULL,
    id_unidadconstructivamo integer,
    unmogrupo character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucmogrupo_id_ucmogrupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucmoobracivil (
    id_ucmoobracivil integer NOT NULL,
    id_ucmogrupo integer,
    id_obracivilmoe integer,
    cantidadobra numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucmoobracivil_id_ucmoobracivil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucsbequipo (
    id_ucsbequipo integer NOT NULL,
    id_unidadconstructivasb integer,
    id_equipo integer,
    cantidadequ numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbequipo_id_ucsbequipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucsbequipotemp (
    id_ucsbequipotemp integer NOT NULL,
    id_unidadconstructivasb integer,
    id_equipo integer,
    cantidadequ numeric(18,5)
);


CREATE SEQUENCE snx.tucsbequipotemp_id_ucsbequipotemp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucsbmaquinaria (
    id_ucsbmaquinaria integer NOT NULL,
    id_unidadconstructivasb integer,
    id_maquinaria integer,
    cantidadmaq numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbmaquinaria_id_ucsbmaquinaria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucsbvalorar (
    id_ucsbvalorar integer NOT NULL,
    codigoproy character varying(50),
    nombreproy character varying(100),
    altura numeric(18,2),
    distanciatransext numeric(18,2),
    distanciatransnac numeric(18,2),
    numerobahias integer,
    id_revista integer,
    id_terrenosb integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbvalorar_id_ucsbvalorar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tucsbvalorarcuc (
    id_ucsvalorarcuc integer NOT NULL,
    id_ucsbvalorar integer,
    codigo character varying(50),
    descripcion character varying(1000),
    id_tensionservicio integer,
    valorucsbe numeric(18,2),
    valorucsbm numeric(18,2),
    valorucsbmate numeric(18,2),
    valorucsbcont numeric(18,2),
    valorucsbog numeric(18,2),
    valorucsbtotal numeric(18,2),
    cantidaditem numeric(18,2),
    potencia numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbvalorarcuc_id_ucsvalorarcuc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tucsbvalorarcuccont (
    id_ucsbvalorarcuccont integer NOT NULL,
    id_ucsbvalorarcuc integer,
    id_obracivil integer,
    obracivil character varying(100),
    unidadbrev character varying(50),
    cantidadpeso numeric(18,5),
    valorunitario numeric(18,2),
    valorobracivil numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbvalorarcuccant_id_ucsbvalorarcuccant_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tucsbvalorarcuce (
    id_ucsbvalorarcuce integer NOT NULL,
    id_ucsbvalorarcuc integer,
    id_equipo integer,
    equipo character varying(100),
    unidadabrer character varying(50),
    cantidadequ numeric(18,5),
    valorunitario numeric(18,2),
    valortotal numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbvalorarcuce_id_ucsbvalorarcuce_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tucsbvalorarcucm (
    id_ucsbvalorarcucm integer NOT NULL,
    id_ucsbvalorarcuc integer,
    id_maquinaria integer,
    maquinaria character varying(100),
    cantidadmaq numeric(18,5),
    valorunitario numeric(18,2),
    valortotal numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbvalorarcucm_id_ucsbvalorarcucm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tucsbvalorarcucmate (
    id_ucsbnalorarcucmate integer NOT NULL,
    id_ucsbvalorarcuc integer,
    id_material integer,
    material character varying(100),
    unidadbrev character varying(50),
    cantidadmate numeric(18,5),
    valorunitarioext numeric(18,2),
    valortotalext numeric(18,2),
    valorunitarionac numeric(18,2),
    valortotalnac numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbvalorarcucmate_id_ucsbnalorarcucmate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tucsbvalorarcucog (
    id_ucsbvalorarcucog integer NOT NULL,
    id_ucsbvalorarcuc integer,
    id_item integer,
    otrosgastos character varying(100),
    cantidadog numeric(18,5),
    valorunitario numeric(18,2),
    valorog numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbvalorarcucog_id_ucsbvalorarcucog_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tucsbvalorarouc (
    id_ucsbvalorarouc integer NOT NULL,
    id_ucsbvalorar integer,
    codigo character varying(50),
    descripcion character varying(100),
    valortotal numeric(18,2),
    cantidaditem numeric(18,5),
    id_otraunidad character varying(50)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tucsbvalorarouc_id_ucsbvalorarouc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tucsbvaloraroucdet (
    id_ucsbvaloraroucdet integer NOT NULL,
    id_ucsbvalorarouc integer,
    nivel integer,
    descripcion character varying(1000),
    unidadabrev character varying(50),
    cantidaditem numeric(18,5),
    valorunitario numeric(18,2),
    valortotal numeric(18,2)
);

CREATE SEQUENCE snx.tucsbvaloraroucdet_id_ucsbvaloraroucdet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tucsbvaloraroucog (
    id_ucsbvaloraroucog integer NOT NULL,
    id_ucsbvalorarouc integer,
    otrosgastos character varying(1000),
    cantidadog numeric(18,5),
    valorunitario numeric(18,2),
    valorog numeric(18,2)
);

CREATE SEQUENCE snx.tucsbvaloraroucog_id_ucsbvaloraroucog_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tueepotros (
    id_uceepotros integer NOT NULL,
    id_unidadconstructivaeep integer,
    descripcion character varying(1000),
    valor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tueepotros_id_uceepotros_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tunidad (
    id_unidad integer NOT NULL,
    unidad character varying(50),
    unidadabrev character varying(15)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidad_id_unidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE snx.tunidadconstructivacomp (
    id_unidadconstructivacomp integer NOT NULL,
    codigo_unicomp character varying(50),
    unidadconstructivacomp character varying(100),
    capacidad numeric(18,2),
    valor numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivacomp_id_unidadconstructivacomp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivacomun (
    id_unidadconstructivacomun integer NOT NULL,
    unidadconstructivacomun character varying(500),
    id_unidad integer,
    cantidadcomun numeric(18,5),
    precio numeric(18,2),
    id_unidadconstructivaenccomun integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivacomun_id_unidadconstructivacomun_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivaedif (
    id_unidadconstructivaedif integer NOT NULL,
    codigo character varying(50),
    descripcion character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivaedif_id_unidadconstructivaedif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivaeep (
    id_unidadconstructivaeep integer NOT NULL,
    codigo_unieepp character varying(50),
    descripcion character varying(100),
    norma character varying(100),
    id_tensionservicio integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivaeep_id_unidadconstructivaeep_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivaenccomun (
    id_unidadconstructivaenccomun integer NOT NULL,
    codigo character varying(50),
    descripcion character varying(100),
    numerobahias integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivaenccomun_id_unidadconstructivaenccomun_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivaencseraux (
    unidadconstructivaencseraux integer NOT NULL,
    codigo character varying(50),
    descripcion character varying(100),
    numerobahias integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivaencseraux_unidadconstructivaencseraux_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivaenctablerocp (
    id_unidadconstructivaenctablerocp integer NOT NULL,
    codigo character varying(50),
    descripcion character varying(100),
    numerobahias integer,
    porcrepuestos numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivaenctablero_id_unidadconstructivaenctable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivalt (
    id_unidadconstructivalt integer NOT NULL,
    codigo character varying(10),
    descripcion character varying(100),
    id_tipolinea integer,
    id_tensionservicio integer,
    id_tipoestructura integer,
    id_tipoconductor integer,
    conductorfase integer,
    id_configuracionlt integer,
    id_clasificacionaltura integer,
    id_pararrayolinea integer,
    distanciatransporte numeric(18,2),
    estructurapasocantidad numeric(18,2),
    estructurapasopeso numeric(18,2),
    estructuraamarrecantidad numeric(18,2),
    estructuraamarrepeso numeric(18,2),
    porcmterrenofirme numeric(18,2),
    porcmterrenointerme numeric(18,2),
    porcmterrenoterrenoblando numeric(18,2),
    porcmterrenosumer numeric(18,2),
    porcvegetamaleza numeric(18,2),
    porcvegetamatorral numeric(18,2),
    porcvegetaforestacion numeric(18,2),
    porcvegetabosque numeric(18,2),
    porcterrenoplano numeric(18,2),
    porcterrenoondulado numeric(18,2),
    porcterrenocerros numeric(18,2),
    longitud numeric(18,5),
    id_nivelcontaminacionlt integer,
    id_areaprotegida integer,
    factoroc integer,
    id_revista integer,
    id_hilosguarda integer,
    distanciatransporteext numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivalt_id_unidadconstructivalt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivalteqmate (
    id_unidadconstructivalteqmate integer NOT NULL,
    id_unidadconstructivalt integer,
    id_item integer,
    id_codigo integer,
    id_puestatierra integer,
    id_aislador integer,
    id_extralt integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivalteqmate_id_unidadconstructivalteqmate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivaltmontaje (
    id_unidadconstructivaltmontaje integer NOT NULL,
    id_unidadconstructivalt integer,
    id_item integer,
    id_codigo integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivaltmontaje_id_unidadconstructivaltmontaje_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivamcelec (
    id_unidadconstructivamcelec integer NOT NULL,
    codigo character varying(50),
    descripcion character varying(1000),
    id_tensionservicio integer,
    id_claseaislacion integer,
    numerobahias integer,
    areasub numeric(18,2),
    longitudvia numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivamcelec_id_unidadconstructivamcelec_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivamo (
    id_unidadconstructivamo integer NOT NULL,
    codigo character varying(50),
    descripcion character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivamo_id_unidadconstructivamo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivasb (
    descripcion character varying(100),
    id_tensionservicio integer,
    id_ubicacion integer,
    alturainstalacion numeric(18,2),
    id_claseaislacion integer,
    superficie numeric(18,2),
    distanciatransporte numeric(18,2),
    codigo character varying(50),
    id_unidadconstructivasb integer NOT NULL,
    cantidaducsb integer,
    valorucsbe numeric(18,2),
    valorucsbm numeric(18,2),
    valorucsbmate numeric(18,2),
    valorucsflete numeric(18,2),
    valorucsdinter numeric(18,2),
    valorucsdcont numeric(18,2),
    valorucsog numeric(18,2),
    valorucsimprevito numeric(18,2),
    valorucsb numeric(18,2),
    valorucsing numeric(18,2),
    valorucsbsuperobra numeric(18,2),
    valorucsinsp numeric(18,2),
    valorucstotal numeric(18,2),
    distanciatransportemate numeric(18,2),
    numerobahias integer,
    varloringenieria numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivasb_id_unidadconstructivasb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivaseraux (
    id_unidadconstructivaseraux integer NOT NULL,
    unidadconstructivaseraux character varying(500),
    id_unidad integer,
    cantidadseraux numeric(18,5),
    precio numeric(18,2),
    unidadconstructivaencseraux integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivaseraux_id_unidadconstructivaseraux_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivatablerocp (
    id_unidadconstructivatablerocp integer NOT NULL,
    unidadconstructivatablerocp character varying(500),
    cantidadtablerocp numeric(18,0),
    precio numeric(18,2),
    id_unidadconstructivaenctablerocp integer
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivatablerocp_id_unidadconstructivatablerocp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tunidadconstructivatablerocpserv (
    id_unidadconstructivatablerocpserv integer NOT NULL,
    id_unidadconstructivaenctablerocp integer,
    unidadconstructivatablerocpserv character varying(2000),
    cantidadserv numeric(18,5),
    precio numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tunidadconstructivatablerocps_id_unidadconstructivatableroc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



	

CREATE TABLE snx.tvegetacion (
    id_vegetacion integer NOT NULL,
    tipovegetacion character varying(50),
    costoroce numeric(18,2)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE SEQUENCE snx.tvegetacion_id_vegetacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;





--
-- TOC entry 5940 (class 2604 OID 85818)
-- Name: taislador fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.taislador ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5941 (class 2604 OID 85819)
-- Name: taislador fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.taislador ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5942 (class 2604 OID 85820)
-- Name: taislador estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.taislador ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5943 (class 2604 OID 85821)
-- Name: taislador id_aislador; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.taislador ALTER COLUMN id_aislador SET DEFAULT nextval('snx.taislador_id_aislador_seq'::regclass);


--
-- TOC entry 6041 (class 2604 OID 179347)
-- Name: tambitoprecio fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tambitoprecio ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6042 (class 2604 OID 179348)
-- Name: tambitoprecio fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tambitoprecio ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6043 (class 2604 OID 179349)
-- Name: tambitoprecio estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tambitoprecio ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6044 (class 2604 OID 179350)
-- Name: tambitoprecio id_ambitoprecio; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tambitoprecio ALTER COLUMN id_ambitoprecio SET DEFAULT nextval('snx.tambitoprecio_id_ambitoprecio_seq'::regclass);


--
-- TOC entry 6209 (class 2604 OID 689134)
-- Name: tareaprotegida fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tareaprotegida ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6210 (class 2604 OID 689135)
-- Name: tareaprotegida fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tareaprotegida ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6211 (class 2604 OID 689136)
-- Name: tareaprotegida estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tareaprotegida ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6212 (class 2604 OID 689137)
-- Name: tareaprotegida id_areaprotegida; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tareaprotegida ALTER COLUMN id_areaprotegida SET DEFAULT nextval('snx.tareaprotegida_id_areaprotegida_seq'::regclass);


--
-- TOC entry 5944 (class 2604 OID 85829)
-- Name: tcable fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tcable ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5945 (class 2604 OID 85830)
-- Name: tcable fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tcable ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5946 (class 2604 OID 85831)
-- Name: tcable estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tcable ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5947 (class 2604 OID 85832)
-- Name: tcable id_cable; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tcable ALTER COLUMN id_cable SET DEFAULT nextval('snx.tcable_id_cable_seq'::regclass);


--
-- TOC entry 5900 (class 2604 OID 46974)
-- Name: tclaseaislacion fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclaseaislacion ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5901 (class 2604 OID 46975)
-- Name: tclaseaislacion fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclaseaislacion ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5902 (class 2604 OID 46976)
-- Name: tclaseaislacion estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclaseaislacion ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5903 (class 2604 OID 46977)
-- Name: tclaseaislacion id_claseaislacion; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclaseaislacion ALTER COLUMN id_claseaislacion SET DEFAULT nextval('snx.tclaseaislacion_id_claseaislacion_seq'::regclass);


--
-- TOC entry 5960 (class 2604 OID 90434)
-- Name: tclasificacionaltura fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclasificacionaltura ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5961 (class 2604 OID 90435)
-- Name: tclasificacionaltura fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclasificacionaltura ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5962 (class 2604 OID 90436)
-- Name: tclasificacionaltura estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclasificacionaltura ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5963 (class 2604 OID 90437)
-- Name: tclasificacionaltura id_clasificacionaltura; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclasificacionaltura ALTER COLUMN id_clasificacionaltura SET DEFAULT nextval('snx.tclasificacionaltura_id_clasificacionaltura_seq'::regclass);


--
-- TOC entry 6029 (class 2604 OID 164601)
-- Name: tconfiguracionlt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tconfiguracionlt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6030 (class 2604 OID 164602)
-- Name: tconfiguracionlt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tconfiguracionlt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6031 (class 2604 OID 164603)
-- Name: tconfiguracionlt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tconfiguracionlt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6032 (class 2604 OID 164604)
-- Name: tconfiguracionlt id_configuracionlt; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tconfiguracionlt ALTER COLUMN id_configuracionlt SET DEFAULT nextval('snx.tconfiguracionlt_id_configuracionlt_seq'::regclass);


--
-- TOC entry 5904 (class 2604 OID 46985)
-- Name: tequipo fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipo ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5905 (class 2604 OID 46986)
-- Name: tequipo fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipo ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5906 (class 2604 OID 46987)
-- Name: tequipo estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipo ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5907 (class 2604 OID 46988)
-- Name: tequipo id_equipo; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipo ALTER COLUMN id_equipo SET DEFAULT nextval('snx.tequipo_id_equipo_seq'::regclass);


--
-- TOC entry 5976 (class 2604 OID 103180)
-- Name: tequipomaterial fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipomaterial ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5977 (class 2604 OID 103181)
-- Name: tequipomaterial fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipomaterial ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5978 (class 2604 OID 103182)
-- Name: tequipomaterial estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipomaterial ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5979 (class 2604 OID 103183)
-- Name: tequipomaterial id_equipomaterial; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipomaterial ALTER COLUMN id_equipomaterial SET DEFAULT nextval('snx.tequipomaterial_id_equipomaterial_seq'::regclass);


--
-- TOC entry 5989 (class 2604 OID 123219)
-- Name: tequipoobracivil fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tequipoobracivil ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5990 (class 2604 OID 123220)
-- Name: tequipoobracivil fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tequipoobracivil ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5991 (class 2604 OID 123221)
-- Name: tequipoobracivil estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tequipoobracivil ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5992 (class 2604 OID 123222)
-- Name: tequipoobracivil id_equipoobracivil; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tequipoobracivil ALTER COLUMN id_equipoobracivil SET DEFAULT nextval('snx.tequipoobracivil_id_equipoobracivil_seq'::regclass);


--
-- TOC entry 5908 (class 2604 OID 46996)
-- Name: tequipoprecio fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipoprecio ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5909 (class 2604 OID 46997)
-- Name: tequipoprecio fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipoprecio ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5910 (class 2604 OID 46998)
-- Name: tequipoprecio estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipoprecio ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5911 (class 2604 OID 46999)
-- Name: tequipoprecio id_equipoprecio; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipoprecio ALTER COLUMN id_equipoprecio SET DEFAULT nextval('snx.tequipoprecio_id_equipoprecio_seq'::regclass);


--
-- TOC entry 6141 (class 2604 OID 287125)
-- Name: textraslt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.textraslt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6142 (class 2604 OID 287126)
-- Name: textraslt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.textraslt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6143 (class 2604 OID 287127)
-- Name: textraslt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.textraslt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6144 (class 2604 OID 1492514)
-- Name: textraslt id_extraslt; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.textraslt ALTER COLUMN id_extraslt SET DEFAULT nextval('snx.textraslt_id_extraslt_seq'::regclass);


--
-- TOC entry 6205 (class 2604 OID 688626)
-- Name: tfactorambiental fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tfactorambiental ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6206 (class 2604 OID 688627)
-- Name: tfactorambiental fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tfactorambiental ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6207 (class 2604 OID 688628)
-- Name: tfactorambiental estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tfactorambiental ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6208 (class 2604 OID 688629)
-- Name: tfactorambiental id_factorambiental; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tfactorambiental ALTER COLUMN id_factorambiental SET DEFAULT nextval('snx.tfactorambiental_id_factorambiental_seq'::regclass);


--
-- TOC entry 5956 (class 2604 OID 90423)
-- Name: tfactorzona fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfactorzona ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5957 (class 2604 OID 90424)
-- Name: tfactorzona fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfactorzona ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5958 (class 2604 OID 90425)
-- Name: tfactorzona estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfactorzona ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5959 (class 2604 OID 90426)
-- Name: tfactorzona id_factorzona; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfactorzona ALTER COLUMN id_factorzona SET DEFAULT nextval('snx.tfactorzona_id_factorzona_seq'::regclass);


--
-- TOC entry 6061 (class 2604 OID 191154)
-- Name: tfuncionestructura fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfuncionestructura ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6062 (class 2604 OID 191155)
-- Name: tfuncionestructura fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfuncionestructura ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6063 (class 2604 OID 191156)
-- Name: tfuncionestructura estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfuncionestructura ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6064 (class 2604 OID 191157)
-- Name: tfuncionestructura id_funcionestructura; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfuncionestructura ALTER COLUMN id_funcionestructura SET DEFAULT nextval('snx.tfuncionestructura_id_funcionestructura_seq'::regclass);


--
-- TOC entry 5948 (class 2604 OID 85840)
-- Name: therrajeaccesorio fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.therrajeaccesorio ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5949 (class 2604 OID 85841)
-- Name: therrajeaccesorio fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.therrajeaccesorio ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5950 (class 2604 OID 85842)
-- Name: therrajeaccesorio estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.therrajeaccesorio ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5951 (class 2604 OID 85843)
-- Name: therrajeaccesorio id_herrajeaccesorio; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.therrajeaccesorio ALTER COLUMN id_herrajeaccesorio SET DEFAULT nextval('snx.therrajeaccesorio_id_herrajeaccesorio_seq'::regclass);


--
-- TOC entry 6265 (class 2604 OID 4769186)
-- Name: thilosguarda fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.thilosguarda ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6266 (class 2604 OID 4769187)
-- Name: thilosguarda fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.thilosguarda ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6267 (class 2604 OID 4769188)
-- Name: thilosguarda estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.thilosguarda ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6268 (class 2604 OID 4769189)
-- Name: thilosguarda id_hilosguarda; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.thilosguarda ALTER COLUMN id_hilosguarda SET DEFAULT nextval('snx.thilosguarda_id_hilosguarda_seq'::regclass);


--
-- TOC entry 6045 (class 2604 OID 179454)
-- Name: tindiceslt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindiceslt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6046 (class 2604 OID 179455)
-- Name: tindiceslt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindiceslt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6047 (class 2604 OID 179456)
-- Name: tindiceslt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindiceslt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6048 (class 2604 OID 179457)
-- Name: tindiceslt id_indicelt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindiceslt ALTER COLUMN id_indicelt SET DEFAULT nextval('snx.tindiceslt_id_indicelt_seq'::regclass);


--
-- TOC entry 6049 (class 2604 OID 180612)
-- Name: tindicetipo fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindicetipo ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6050 (class 2604 OID 180613)
-- Name: tindicetipo fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindicetipo ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6051 (class 2604 OID 180614)
-- Name: tindicetipo estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindicetipo ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6052 (class 2604 OID 180615)
-- Name: tindicetipo id_indicetipo; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindicetipo ALTER COLUMN id_indicetipo SET DEFAULT nextval('snx.tindicetipo_id_indicetipo_seq'::regclass);


--
-- TOC entry 6153 (class 2604 OID 291849)
-- Name: tingenierialt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tingenierialt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6154 (class 2604 OID 291850)
-- Name: tingenierialt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tingenierialt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6155 (class 2604 OID 291851)
-- Name: tingenierialt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tingenierialt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6156 (class 2604 OID 291852)
-- Name: tingenierialt id_ingenierialt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tingenierialt ALTER COLUMN id_ingenierialt SET DEFAULT nextval('snx.tingenierialt_id_ingenierialt_seq'::regclass);


--
-- TOC entry 6133 (class 2604 OID 257777)
-- Name: tlistafactoresindexacion fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tlistafactoresindexacion ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6134 (class 2604 OID 257778)
-- Name: tlistafactoresindexacion fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tlistafactoresindexacion ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6135 (class 2604 OID 257779)
-- Name: tlistafactoresindexacion estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tlistafactoresindexacion ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6136 (class 2604 OID 257780)
-- Name: tlistafactoresindexacion id_factorindexacion; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tlistafactoresindexacion ALTER COLUMN id_factorindexacion SET DEFAULT nextval('snx.tlistafactoresindexacion_id_factorindexacion_seq'::regclass);


--
-- TOC entry 6169 (class 2604 OID 412329)
-- Name: tmanoobramoe fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmanoobramoe ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6170 (class 2604 OID 412330)
-- Name: tmanoobramoe fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmanoobramoe ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6171 (class 2604 OID 412331)
-- Name: tmanoobramoe estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmanoobramoe ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6172 (class 2604 OID 412332)
-- Name: tmanoobramoe id_manoobramoe; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmanoobramoe ALTER COLUMN id_manoobramoe SET DEFAULT nextval('snx.tmanoobramoe_id_manoobramoe_seq'::regclass);


--
-- TOC entry 5912 (class 2604 OID 56601)
-- Name: tmaquinaria fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinaria ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5913 (class 2604 OID 56602)
-- Name: tmaquinaria fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinaria ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5914 (class 2604 OID 56603)
-- Name: tmaquinaria estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinaria ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5915 (class 2604 OID 56604)
-- Name: tmaquinaria id_maquinaria; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinaria ALTER COLUMN id_maquinaria SET DEFAULT nextval('snx.tmaquinaria_id_maquinaria_seq'::regclass);


--
-- TOC entry 6350 (class 2604 OID 15412949)
-- Name: tmaquinariafactor fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariafactor ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6351 (class 2604 OID 15412950)
-- Name: tmaquinariafactor fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariafactor ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6352 (class 2604 OID 15412951)
-- Name: tmaquinariafactor estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariafactor ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6353 (class 2604 OID 15412952)
-- Name: tmaquinariafactor id_maquinariafactor; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariafactor ALTER COLUMN id_maquinariafactor SET DEFAULT nextval('snx.tmaquinariafactor_id_maquinariafactor_seq'::regclass);


--
-- TOC entry 5972 (class 2604 OID 103169)
-- Name: tmaquinariamaterial fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariamaterial ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5973 (class 2604 OID 103170)
-- Name: tmaquinariamaterial fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariamaterial ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5974 (class 2604 OID 103171)
-- Name: tmaquinariamaterial estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariamaterial ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5975 (class 2604 OID 103172)
-- Name: tmaquinariamaterial id_maquinariamaterial; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariamaterial ALTER COLUMN id_maquinariamaterial SET DEFAULT nextval('snx.tmaquinariamaterial_id_maquinariamaterial_seq'::regclass);


--
-- TOC entry 6165 (class 2604 OID 412315)
-- Name: tmaquinariamoe fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariamoe ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6166 (class 2604 OID 412316)
-- Name: tmaquinariamoe fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariamoe ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6167 (class 2604 OID 412317)
-- Name: tmaquinariamoe estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariamoe ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6168 (class 2604 OID 412318)
-- Name: tmaquinariamoe id_maquinariamoe; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariamoe ALTER COLUMN id_maquinariamoe SET DEFAULT nextval('snx.tmaquinariamoe_id_maquinariamoe_seq'::regclass);


--
-- TOC entry 5993 (class 2604 OID 123230)
-- Name: tmaquinariaobracivil fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariaobracivil ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5994 (class 2604 OID 123231)
-- Name: tmaquinariaobracivil fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariaobracivil ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5995 (class 2604 OID 123232)
-- Name: tmaquinariaobracivil estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariaobracivil ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5996 (class 2604 OID 123233)
-- Name: tmaquinariaobracivil id_maquinariaobracivil; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariaobracivil ALTER COLUMN id_maquinariaobracivil SET DEFAULT nextval('snx.tmaquinariaobracivil_id_maquinariaobracivil_seq'::regclass);


--
-- TOC entry 5916 (class 2604 OID 56612)
-- Name: tmaquinariaprecio fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariaprecio ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5917 (class 2604 OID 56613)
-- Name: tmaquinariaprecio fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariaprecio ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5918 (class 2604 OID 56614)
-- Name: tmaquinariaprecio estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariaprecio ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5919 (class 2604 OID 56615)
-- Name: tmaquinariaprecio id_maquinariaprecio; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariaprecio ALTER COLUMN id_maquinariaprecio SET DEFAULT nextval('snx.tmaquinariaprecio_id_maquinariaprecio_seq'::regclass);


--
-- TOC entry 5964 (class 2604 OID 95462)
-- Name: tmaterial fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterial ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5965 (class 2604 OID 95463)
-- Name: tmaterial fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterial ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5966 (class 2604 OID 95464)
-- Name: tmaterial estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterial ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5967 (class 2604 OID 95465)
-- Name: tmaterial id_material; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterial ALTER COLUMN id_material SET DEFAULT nextval('snx.tmaterial_id_material_seq'::regclass);


--
-- TOC entry 6025 (class 2604 OID 164413)
-- Name: tmaterialcantidadlt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6026 (class 2604 OID 164414)
-- Name: tmaterialcantidadlt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6027 (class 2604 OID 164415)
-- Name: tmaterialcantidadlt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6028 (class 2604 OID 164416)
-- Name: tmaterialcantidadlt id_materialcantidadlt; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt ALTER COLUMN id_materialcantidadlt SET DEFAULT nextval('snx.tmaterialcantidadlt_id_materialcantidadlt_seq'::regclass);


--
-- TOC entry 5997 (class 2604 OID 150783)
-- Name: tmateriales fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriales ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5998 (class 2604 OID 150784)
-- Name: tmateriales fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriales ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5999 (class 2604 OID 150785)
-- Name: tmateriales estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriales ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6000 (class 2604 OID 150786)
-- Name: tmateriales id_materiales; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriales ALTER COLUMN id_materiales SET DEFAULT nextval('snx.tmateriales_id_materiales_seq'::regclass);


--
-- TOC entry 6017 (class 2604 OID 164387)
-- Name: tmateriallt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6018 (class 2604 OID 164388)
-- Name: tmateriallt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6019 (class 2604 OID 164389)
-- Name: tmateriallt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6020 (class 2604 OID 164390)
-- Name: tmateriallt id_materiallt; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt ALTER COLUMN id_materiallt SET DEFAULT nextval('snx.tmateriallt_id_materiallt_seq'::regclass);


--
-- TOC entry 6161 (class 2604 OID 412301)
-- Name: tmaterialmoe fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaterialmoe ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6162 (class 2604 OID 412302)
-- Name: tmaterialmoe fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaterialmoe ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6163 (class 2604 OID 412303)
-- Name: tmaterialmoe estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaterialmoe ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6164 (class 2604 OID 412304)
-- Name: tmaterialmoe id_materialmoe; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaterialmoe ALTER COLUMN id_materialmoe SET DEFAULT nextval('snx.tmaterialmoe_id_materialmoe_seq'::regclass);


--
-- TOC entry 5968 (class 2604 OID 95473)
-- Name: tmaterialprecio fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialprecio ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5969 (class 2604 OID 95474)
-- Name: tmaterialprecio fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialprecio ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5970 (class 2604 OID 95475)
-- Name: tmaterialprecio estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialprecio ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5971 (class 2604 OID 95476)
-- Name: tmaterialprecio id_materialprecio; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialprecio ALTER COLUMN id_materialprecio SET DEFAULT nextval('snx.tmaterialprecio_id_materialprecio_seq'::regclass);


--
-- TOC entry 6021 (class 2604 OID 164400)
-- Name: tmaterialpreciolt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialpreciolt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6022 (class 2604 OID 164401)
-- Name: tmaterialpreciolt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialpreciolt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6023 (class 2604 OID 164402)
-- Name: tmaterialpreciolt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialpreciolt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6024 (class 2604 OID 164403)
-- Name: tmaterialpreciolt id_materialpreciolt; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialpreciolt ALTER COLUMN id_materialpreciolt SET DEFAULT nextval('snx.tmaterialpreciolt_id_materialpreciolt_seq'::regclass);


--
-- TOC entry 6249 (class 2604 OID 4567536)
-- Name: tmcelecapantallamiento fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecapantallamiento ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6250 (class 2604 OID 4567537)
-- Name: tmcelecapantallamiento fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecapantallamiento ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6251 (class 2604 OID 4567538)
-- Name: tmcelecapantallamiento estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecapantallamiento ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6252 (class 2604 OID 4567539)
-- Name: tmcelecapantallamiento id_mcelecapantallamiento; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecapantallamiento ALTER COLUMN id_mcelecapantallamiento SET DEFAULT nextval('snx.tmcelecapantallamiento_id_mcelecapantallamiento_seq'::regclass);


--
-- TOC entry 6253 (class 2604 OID 4567547)
-- Name: tmceleciluminacion fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmceleciluminacion ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6254 (class 2604 OID 4567548)
-- Name: tmceleciluminacion fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmceleciluminacion ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6255 (class 2604 OID 4567549)
-- Name: tmceleciluminacion estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmceleciluminacion ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6256 (class 2604 OID 4567550)
-- Name: tmceleciluminacion id_meleciluminacion; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmceleciluminacion ALTER COLUMN id_meleciluminacion SET DEFAULT nextval('snx.tmeleciluminacion_id_meleciluminacion_seq'::regclass);


--
-- TOC entry 6245 (class 2604 OID 4567524)
-- Name: tmcelecmallatierra fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecmallatierra ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6246 (class 2604 OID 4567525)
-- Name: tmcelecmallatierra fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecmallatierra ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6247 (class 2604 OID 4567526)
-- Name: tmcelecmallatierra estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecmallatierra ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6248 (class 2604 OID 4567527)
-- Name: tmcelecmallatierra id_mcelecmallatierra; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecmallatierra ALTER COLUMN id_mcelecmallatierra SET DEFAULT nextval('snx.tmcelecmallatierra_id_mcelecmallatierra_seq'::regclass);


--
-- TOC entry 5920 (class 2604 OID 63615)
-- Name: tmes fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmes ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5921 (class 2604 OID 63616)
-- Name: tmes fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmes ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5922 (class 2604 OID 63617)
-- Name: tmes estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmes ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5923 (class 2604 OID 63618)
-- Name: tmes id_mes; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmes ALTER COLUMN id_mes SET DEFAULT nextval('snx.tmes_id_mes_seq'::regclass);


--
-- TOC entry 5896 (class 2604 OID 45448)
-- Name: tmoneda fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmoneda ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5897 (class 2604 OID 45449)
-- Name: tmoneda fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmoneda ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5898 (class 2604 OID 45450)
-- Name: tmoneda estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmoneda ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5899 (class 2604 OID 45451)
-- Name: tmoneda id_moneda; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmoneda ALTER COLUMN id_moneda SET DEFAULT nextval('snx.tmoneda_id_moneda_seq'::regclass);


--
-- TOC entry 6033 (class 2604 OID 166546)
-- Name: tmontajecantidadlt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6034 (class 2604 OID 166547)
-- Name: tmontajecantidadlt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6035 (class 2604 OID 166548)
-- Name: tmontajecantidadlt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6036 (class 2604 OID 166549)
-- Name: tmontajecantidadlt id_montajecantidadlt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt ALTER COLUMN id_montajecantidadlt SET DEFAULT nextval('snx.tmontajecantidadlt_id_montajecantidadlt_seq'::regclass);


--
-- TOC entry 6005 (class 2604 OID 160422)
-- Name: tmontajelt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajelt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6006 (class 2604 OID 160423)
-- Name: tmontajelt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajelt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6007 (class 2604 OID 160424)
-- Name: tmontajelt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajelt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6008 (class 2604 OID 160425)
-- Name: tmontajelt id_montajelt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajelt ALTER COLUMN id_montajelt SET DEFAULT nextval('snx.tmontajelt_id_montajelt_seq'::regclass);


--
-- TOC entry 6009 (class 2604 OID 161887)
-- Name: tmontajepreciolt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajepreciolt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6010 (class 2604 OID 161888)
-- Name: tmontajepreciolt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajepreciolt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6011 (class 2604 OID 161889)
-- Name: tmontajepreciolt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajepreciolt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6012 (class 2604 OID 161890)
-- Name: tmontajepreciolt id_montajepreciolt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajepreciolt ALTER COLUMN id_montajepreciolt SET DEFAULT nextval('snx.tmontajepreciolt_id_montajepreciolt_seq'::regclass);


--
-- TOC entry 6197 (class 2604 OID 478111)
-- Name: tnivelcontaminacionlt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tnivelcontaminacionlt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6198 (class 2604 OID 478112)
-- Name: tnivelcontaminacionlt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tnivelcontaminacionlt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6199 (class 2604 OID 478113)
-- Name: tnivelcontaminacionlt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tnivelcontaminacionlt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6200 (class 2604 OID 478114)
-- Name: tnivelcontaminacionlt id_nivelcontaminacionlt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tnivelcontaminacionlt ALTER COLUMN id_nivelcontaminacionlt SET DEFAULT nextval('snx.tnivelcontaminacionlt_id_nivelcontaminacionlt_seq'::regclass);


--
-- TOC entry 5988 (class 2604 OID 122852)
-- Name: tobracivil id_obracivil; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivil ALTER COLUMN id_obracivil SET DEFAULT nextval('snx.tobracivil_id_obracivil_seq'::regclass);


--
-- TOC entry 6081 (class 2604 OID 195581)
-- Name: tobracivilcantidadlt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6082 (class 2604 OID 195582)
-- Name: tobracivilcantidadlt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6083 (class 2604 OID 195583)
-- Name: tobracivilcantidadlt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6084 (class 2604 OID 195584)
-- Name: tobracivilcantidadlt id_obracivilcantidadlt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt ALTER COLUMN id_obracivilcantidadlt SET DEFAULT nextval('snx.tobracivilcantidadlt_id_obracivilcantidadlt_seq'::regclass);


--
-- TOC entry 6001 (class 2604 OID 157948)
-- Name: tobraciviles fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobraciviles ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6002 (class 2604 OID 157949)
-- Name: tobraciviles fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobraciviles ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6003 (class 2604 OID 157950)
-- Name: tobraciviles estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobraciviles ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6004 (class 2604 OID 157951)
-- Name: tobraciviles id_obrasciviles; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobraciviles ALTER COLUMN id_obrasciviles SET DEFAULT nextval('snx.tobraciviles_id_obrasciviles_seq'::regclass);


--
-- TOC entry 6073 (class 2604 OID 191508)
-- Name: tobracivillt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivillt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6074 (class 2604 OID 191509)
-- Name: tobracivillt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivillt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6075 (class 2604 OID 191510)
-- Name: tobracivillt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivillt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6076 (class 2604 OID 191511)
-- Name: tobracivillt id_obracivillt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivillt ALTER COLUMN id_obracivillt SET DEFAULT nextval('snx.tobracivillt_id_obracivillt_seq'::regclass);


--
-- TOC entry 6101 (class 2604 OID 220738)
-- Name: tobracivilmoe fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobracivilmoe ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6102 (class 2604 OID 220739)
-- Name: tobracivilmoe fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobracivilmoe ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6103 (class 2604 OID 220740)
-- Name: tobracivilmoe estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobracivilmoe ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6104 (class 2604 OID 220741)
-- Name: tobracivilmoe id_obracivilmoe; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobracivilmoe ALTER COLUMN id_obracivilmoe SET DEFAULT nextval('snx.tobracivilmoe_id_obracivilmoe_seq'::regclass);


--
-- TOC entry 6077 (class 2604 OID 192613)
-- Name: tobracivilpreciolt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilpreciolt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6078 (class 2604 OID 192614)
-- Name: tobracivilpreciolt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilpreciolt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6079 (class 2604 OID 192615)
-- Name: tobracivilpreciolt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilpreciolt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6080 (class 2604 OID 192616)
-- Name: tobracivilpreciolt id_obracivilpreciolt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilpreciolt ALTER COLUMN id_obracivilpreciolt SET DEFAULT nextval('snx.tobracivilpreciolt_id_obracivilpreciolt_seq'::regclass);


--
-- TOC entry 6181 (class 2604 OID 412594)
-- Name: tocmanoobramoe fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmanoobramoe ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6182 (class 2604 OID 412595)
-- Name: tocmanoobramoe fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmanoobramoe ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6183 (class 2604 OID 412596)
-- Name: tocmanoobramoe estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmanoobramoe ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6184 (class 2604 OID 412597)
-- Name: tocmanoobramoe id_ocmanoobramoe; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmanoobramoe ALTER COLUMN id_ocmanoobramoe SET DEFAULT nextval('snx.tocmanoobramoe_id_ocmanoobramoe_seq'::regclass);


--
-- TOC entry 6177 (class 2604 OID 412583)
-- Name: tocmaquinariamoe fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaquinariamoe ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6178 (class 2604 OID 412584)
-- Name: tocmaquinariamoe fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaquinariamoe ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6179 (class 2604 OID 412585)
-- Name: tocmaquinariamoe estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaquinariamoe ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6180 (class 2604 OID 412586)
-- Name: tocmaquinariamoe id_ocmaquinariamoe; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaquinariamoe ALTER COLUMN id_ocmaquinariamoe SET DEFAULT nextval('snx.tocmaquinariamoe_id_ocmaquinariamoe_seq'::regclass);


--
-- TOC entry 6173 (class 2604 OID 412572)
-- Name: tocmaterialmoe fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaterialmoe ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6174 (class 2604 OID 412573)
-- Name: tocmaterialmoe fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaterialmoe ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6175 (class 2604 OID 412574)
-- Name: tocmaterialmoe estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaterialmoe ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6176 (class 2604 OID 412575)
-- Name: tocmaterialmoe id_ocmaterialmoe; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaterialmoe ALTER COLUMN id_ocmaterialmoe SET DEFAULT nextval('snx.tocmaterialmoe_id_ocmaterialmoe_seq'::regclass);


--
-- TOC entry 5952 (class 2604 OID 85851)
-- Name: tpararrayatolinea fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpararrayatolinea ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5953 (class 2604 OID 85852)
-- Name: tpararrayatolinea fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpararrayatolinea ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5954 (class 2604 OID 85853)
-- Name: tpararrayatolinea estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpararrayatolinea ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5955 (class 2604 OID 85854)
-- Name: tpararrayatolinea id_pararrayolinea; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpararrayatolinea ALTER COLUMN id_pararrayolinea SET DEFAULT nextval('snx.tpararrayatolinea_id_pararrayolinea_seq'::regclass);


--
-- TOC entry 6129 (class 2604 OID 253297)
-- Name: tpcu335311335311 fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335311335311 ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6130 (class 2604 OID 253298)
-- Name: tpcu335311335311 fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335311335311 ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6131 (class 2604 OID 253299)
-- Name: tpcu335311335311 estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335311335311 ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6132 (class 2604 OID 253300)
-- Name: tpcu335311335311 id_pcu335311335311; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335311335311 ALTER COLUMN id_pcu335311335311 SET DEFAULT nextval('snx.tpcu335311335311_id_pcu335311335311_seq'::regclass);


--
-- TOC entry 6125 (class 2604 OID 253286)
-- Name: tpcu335313335313 fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335313335313 ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6126 (class 2604 OID 253287)
-- Name: tpcu335313335313 fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335313335313 ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6127 (class 2604 OID 253288)
-- Name: tpcu335313335313 estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335313335313 ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6128 (class 2604 OID 253289)
-- Name: tpcu335313335313 id_pcu335313335313; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335313335313 ALTER COLUMN id_pcu335313335313 SET DEFAULT nextval('snx.tpcu335313335313_id_pcu335313335313_seq'::regclass);


--
-- TOC entry 6117 (class 2604 OID 253264)
-- Name: tpuc33123312 fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc33123312 ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6118 (class 2604 OID 253265)
-- Name: tpuc33123312 fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc33123312 ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6119 (class 2604 OID 253266)
-- Name: tpuc33123312 estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc33123312 ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6120 (class 2604 OID 253267)
-- Name: tpuc33123312 id_pcu33123312; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc33123312 ALTER COLUMN id_pcu33123312 SET DEFAULT nextval('snx.tpuc33123312_id_pcu33123312_seq'::regclass);


--
-- TOC entry 6121 (class 2604 OID 253275)
-- Name: tpuc3359293359291 fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc3359293359291 ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6122 (class 2604 OID 253276)
-- Name: tpuc3359293359291 fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc3359293359291 ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6123 (class 2604 OID 253277)
-- Name: tpuc3359293359291 estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc3359293359291 ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6124 (class 2604 OID 253278)
-- Name: tpuc3359293359291 id_puc3359293359291; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc3359293359291 ALTER COLUMN id_puc3359293359291 SET DEFAULT nextval('snx.tpuc3359293359291_id_puc3359293359291_seq'::regclass);


--
-- TOC entry 6213 (class 2604 OID 1517651)
-- Name: trevista fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.trevista ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6214 (class 2604 OID 1517652)
-- Name: trevista fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.trevista ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6215 (class 2604 OID 1517653)
-- Name: trevista estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.trevista ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6216 (class 2604 OID 1517654)
-- Name: trevista id_revista; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.trevista ALTER COLUMN id_revista SET DEFAULT nextval('snx.trevista_id_revista_seq'::regclass);


--
-- TOC entry 6057 (class 2604 OID 188994)
-- Name: tspuestatierra fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tspuestatierra ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6058 (class 2604 OID 188995)
-- Name: tspuestatierra fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tspuestatierra ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6059 (class 2604 OID 188996)
-- Name: tspuestatierra estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tspuestatierra ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6060 (class 2604 OID 188997)
-- Name: tspuestatierra id_puestatierra; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tspuestatierra ALTER COLUMN id_puestatierra SET DEFAULT nextval('snx.tspuestatierra_id_puestatierra_seq'::regclass);


--
-- TOC entry 6329 (class 2604 OID 9929214)
-- Name: ttarifaingsb fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttarifaingsb ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6330 (class 2604 OID 9929215)
-- Name: ttarifaingsb fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttarifaingsb ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6331 (class 2604 OID 9929216)
-- Name: ttarifaingsb estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttarifaingsb ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6332 (class 2604 OID 9929217)
-- Name: ttarifaingsb id_tarifaingsb; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttarifaingsb ALTER COLUMN id_tarifaingsb SET DEFAULT nextval('snx.ttarifaingsb_id_tarifaingsb_seq'::regclass);


--
-- TOC entry 6137 (class 2604 OID 279304)
-- Name: ttarifassb fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttarifassb ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6138 (class 2604 OID 279305)
-- Name: ttarifassb fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttarifassb ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6139 (class 2604 OID 279306)
-- Name: ttarifassb estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttarifassb ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6140 (class 2604 OID 279307)
-- Name: ttarifassb id_tarifasb; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttarifassb ALTER COLUMN id_tarifasb SET DEFAULT nextval('snx.ttarifassb_id_tarifasb_seq'::regclass);


--
-- TOC entry 5924 (class 2604 OID 66774)
-- Name: ttasacambio fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttasacambio ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5925 (class 2604 OID 66775)
-- Name: ttasacambio fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttasacambio ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5926 (class 2604 OID 66776)
-- Name: ttasacambio estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttasacambio ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5927 (class 2604 OID 66777)
-- Name: ttasacambio id_tasacambio; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttasacambio ALTER COLUMN id_tasacambio SET DEFAULT nextval('snx.ttasacambio_id_tasacambio_seq'::regclass);


--
-- TOC entry 5888 (class 2604 OID 42291)
-- Name: ttensionservicio fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttensionservicio ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5889 (class 2604 OID 42292)
-- Name: ttensionservicio fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttensionservicio ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5890 (class 2604 OID 42293)
-- Name: ttensionservicio estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttensionservicio ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5891 (class 2604 OID 42294)
-- Name: ttensionservicio id_tensionservicio; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttensionservicio ALTER COLUMN id_tensionservicio SET DEFAULT nextval('snx.ttensionservicio_id_tensionservicio_seq'::regclass);


--
-- TOC entry 6149 (class 2604 OID 291224)
-- Name: tterrenolt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenolt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6150 (class 2604 OID 291225)
-- Name: tterrenolt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenolt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6151 (class 2604 OID 291226)
-- Name: tterrenolt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenolt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6152 (class 2604 OID 291227)
-- Name: tterrenolt id_terrenolt; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenolt ALTER COLUMN id_terrenolt SET DEFAULT nextval('snx.tterrenolt_id_terrenolt_seq'::regclass);


--
-- TOC entry 6145 (class 2604 OID 291213)
-- Name: tterrenosb fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenosb ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6146 (class 2604 OID 291214)
-- Name: tterrenosb fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenosb ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6147 (class 2604 OID 291215)
-- Name: tterrenosb estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenosb ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6148 (class 2604 OID 291216)
-- Name: tterrenosb id_terrenosb; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenosb ALTER COLUMN id_terrenosb SET DEFAULT nextval('snx.tterrenosb_id_terrenosb_seq'::regclass);


--
-- TOC entry 6069 (class 2604 OID 191497)
-- Name: ttipocanalizacion fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocanalizacion ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6070 (class 2604 OID 191498)
-- Name: ttipocanalizacion fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocanalizacion ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6071 (class 2604 OID 191499)
-- Name: ttipocanalizacion estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocanalizacion ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6072 (class 2604 OID 191500)
-- Name: ttipocanalizacion id_tipocanalizacion; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocanalizacion ALTER COLUMN id_tipocanalizacion SET DEFAULT nextval('snx.ttipocanalizacion_id_tipocanalizacion_seq'::regclass);


--
-- TOC entry 6065 (class 2604 OID 191486)
-- Name: ttipocimentacion fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocimentacion ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6066 (class 2604 OID 191487)
-- Name: ttipocimentacion fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocimentacion ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6067 (class 2604 OID 191488)
-- Name: ttipocimentacion estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocimentacion ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6068 (class 2604 OID 191489)
-- Name: ttipocimentacion id_tipocimentacion; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocimentacion ALTER COLUMN id_tipocimentacion SET DEFAULT nextval('snx.ttipocimentacion_id_tipocimentacion_seq'::regclass);


--
-- TOC entry 5936 (class 2604 OID 85807)
-- Name: ttipoconductor fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoconductor ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5937 (class 2604 OID 85808)
-- Name: ttipoconductor fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoconductor ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5938 (class 2604 OID 85809)
-- Name: ttipoconductor estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoconductor ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5939 (class 2604 OID 85810)
-- Name: ttipoconductor id_tipoconductor; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoconductor ALTER COLUMN id_tipoconductor SET DEFAULT nextval('snx.ttipoconductor_id_tipoconductor_seq'::regclass);


--
-- TOC entry 5932 (class 2604 OID 85796)
-- Name: ttipoestructura fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoestructura ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5933 (class 2604 OID 85797)
-- Name: ttipoestructura fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoestructura ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5934 (class 2604 OID 85798)
-- Name: ttipoestructura estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoestructura ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5935 (class 2604 OID 85799)
-- Name: ttipoestructura id_tipoestructura; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoestructura ALTER COLUMN id_tipoestructura SET DEFAULT nextval('snx.ttipoestructura_id_tipoestructura_seq'::regclass);


--
-- TOC entry 6013 (class 2604 OID 162900)
-- Name: ttipolinea fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipolinea ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6014 (class 2604 OID 162901)
-- Name: ttipolinea fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipolinea ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6015 (class 2604 OID 162902)
-- Name: ttipolinea estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipolinea ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6016 (class 2604 OID 162903)
-- Name: ttipolinea id_tipolinea; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipolinea ALTER COLUMN id_tipolinea SET DEFAULT nextval('snx.ttipolinea_id_tipolinea_seq'::regclass);


--
-- TOC entry 6321 (class 2604 OID 9457619)
-- Name: ttipopreciomaquinaria fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipopreciomaquinaria ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6322 (class 2604 OID 9457620)
-- Name: ttipopreciomaquinaria fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipopreciomaquinaria ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6323 (class 2604 OID 9457621)
-- Name: ttipopreciomaquinaria estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipopreciomaquinaria ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6324 (class 2604 OID 9457622)
-- Name: ttipopreciomaquinaria id_tipopreciomaquinaria; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipopreciomaquinaria ALTER COLUMN id_tipopreciomaquinaria SET DEFAULT nextval('snx.ttipopreciomaquinaria_id_tipopreciomaquinaria_seq'::regclass);


--
-- TOC entry 5892 (class 2604 OID 42302)
-- Name: tubicacion fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tubicacion ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5893 (class 2604 OID 42303)
-- Name: tubicacion fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tubicacion ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5894 (class 2604 OID 42304)
-- Name: tubicacion estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tubicacion ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5895 (class 2604 OID 42305)
-- Name: tubicacion id_ubicacion; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tubicacion ALTER COLUMN id_ubicacion SET DEFAULT nextval('snx.tubicacion_id_ubicacion_seq'::regclass);


--
-- TOC entry 6089 (class 2604 OID 219574)
-- Name: tucedifgrupo fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifgrupo ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6090 (class 2604 OID 219575)
-- Name: tucedifgrupo fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifgrupo ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6091 (class 2604 OID 219576)
-- Name: tucedifgrupo estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifgrupo ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6092 (class 2604 OID 219577)
-- Name: tucedifgrupo id_ucedifgrupo; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifgrupo ALTER COLUMN id_ucedifgrupo SET DEFAULT nextval('snx.tucedifgrupo_id_ucedifgrupo_seq'::regclass);


--
-- TOC entry 6097 (class 2604 OID 219599)
-- Name: tucedifobracivil fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifobracivil ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6098 (class 2604 OID 219600)
-- Name: tucedifobracivil fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifobracivil ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6099 (class 2604 OID 219601)
-- Name: tucedifobracivil estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifobracivil ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6100 (class 2604 OID 219602)
-- Name: tucedifobracivil id_ucedifobracivil; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifobracivil ALTER COLUMN id_ucedifobracivil SET DEFAULT nextval('snx.tucedifobracivil_id_ucedifobracivil_seq'::regclass);


--
-- TOC entry 6093 (class 2604 OID 219585)
-- Name: tucedifsubgrupo fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifsubgrupo ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6094 (class 2604 OID 219586)
-- Name: tucedifsubgrupo fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifsubgrupo ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6095 (class 2604 OID 219587)
-- Name: tucedifsubgrupo estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifsubgrupo ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6096 (class 2604 OID 219588)
-- Name: tucedifsubgrupo id_ucedifsubgrupo; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifsubgrupo ALTER COLUMN id_ucedifsubgrupo SET DEFAULT nextval('snx.tucedifsubgrupo_id_ucedifsubgrupo_seq'::regclass);


--
-- TOC entry 6237 (class 2604 OID 3668608)
-- Name: tuceepitem fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tuceepitem ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6238 (class 2604 OID 3668609)
-- Name: tuceepitem fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tuceepitem ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6239 (class 2604 OID 3668610)
-- Name: tuceepitem estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tuceepitem ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6240 (class 2604 OID 3668611)
-- Name: tuceepitem id_uceepitem; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tuceepitem ALTER COLUMN id_uceepitem SET DEFAULT nextval('snx.tuceepitem_id_uceepitem_seq'::regclass);


--
-- TOC entry 6185 (class 2604 OID 477293)
-- Name: tucltmaestragrupo fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestragrupo ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6186 (class 2604 OID 477294)
-- Name: tucltmaestragrupo fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestragrupo ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6187 (class 2604 OID 477295)
-- Name: tucltmaestragrupo estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestragrupo ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6188 (class 2604 OID 477296)
-- Name: tucltmaestragrupo id_grupo; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestragrupo ALTER COLUMN id_grupo SET DEFAULT nextval('snx.tucltmaestragrupo_id_grupo_seq'::regclass);


--
-- TOC entry 6189 (class 2604 OID 477304)
-- Name: tucltmaestraitem fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestraitem ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6190 (class 2604 OID 477305)
-- Name: tucltmaestraitem fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestraitem ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6191 (class 2604 OID 477306)
-- Name: tucltmaestraitem estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestraitem ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6192 (class 2604 OID 477307)
-- Name: tucltmaestraitem id_item; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestraitem ALTER COLUMN id_item SET DEFAULT nextval('snx.tucltmaestraitem_id_item_seq'::regclass);


--
-- TOC entry 6269 (class 2604 OID 7041136)
-- Name: tucltvalorar fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorar ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6270 (class 2604 OID 7041137)
-- Name: tucltvalorar fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorar ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6271 (class 2604 OID 7041138)
-- Name: tucltvalorar estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorar ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6272 (class 2604 OID 7041139)
-- Name: tucltvalorar id_ucltvalorar; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorar ALTER COLUMN id_ucltvalorar SET DEFAULT nextval('snx.tucltvalorar_id_ucltvalorar_seq'::regclass);


--
-- TOC entry 6273 (class 2604 OID 7041147)
-- Name: tucltvaloraruc fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvaloraruc ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6274 (class 2604 OID 7041148)
-- Name: tucltvaloraruc fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvaloraruc ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6275 (class 2604 OID 7041149)
-- Name: tucltvaloraruc estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvaloraruc ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6276 (class 2604 OID 7041150)
-- Name: tucltvaloraruc id_ucltvaloraruc; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvaloraruc ALTER COLUMN id_ucltvaloraruc SET DEFAULT nextval('snx.tucltvaloraruc_id_ucltvaloraruc_seq'::regclass);


--
-- TOC entry 6277 (class 2604 OID 7041176)
-- Name: tucltvalorarucem fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucem ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6278 (class 2604 OID 7041177)
-- Name: tucltvalorarucem fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucem ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6279 (class 2604 OID 7041178)
-- Name: tucltvalorarucem estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucem ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6280 (class 2604 OID 7041179)
-- Name: tucltvalorarucem id_ucltvalorarucem; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucem ALTER COLUMN id_ucltvalorarucem SET DEFAULT nextval('snx.tucltvalorarucem_id_ucltvalorarucem_seq'::regclass);


--
-- TOC entry 6289 (class 2604 OID 7041233)
-- Name: tucltvalorarucgc fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucgc ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6290 (class 2604 OID 7041234)
-- Name: tucltvalorarucgc fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucgc ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6291 (class 2604 OID 7041235)
-- Name: tucltvalorarucgc estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucgc ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6292 (class 2604 OID 7041236)
-- Name: tucltvalorarucgc id_ucltvalorarucgc; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucgc ALTER COLUMN id_ucltvalorarucgc SET DEFAULT nextval('snx.tucltvalorarucgc_id_ucltvalorarucgc_seq'::regclass);


--
-- TOC entry 6285 (class 2604 OID 7041214)
-- Name: tucltvalorarucmon fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucmon ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6286 (class 2604 OID 7041215)
-- Name: tucltvalorarucmon fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucmon ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6287 (class 2604 OID 7041216)
-- Name: tucltvalorarucmon estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucmon ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6288 (class 2604 OID 7041217)
-- Name: tucltvalorarucmon id_ucltvalorarucmon; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucmon ALTER COLUMN id_ucltvalorarucmon SET DEFAULT nextval('snx.tucltvalorarucmon_id_ucltvalorarucmon_seq'::regclass);


--
-- TOC entry 6281 (class 2604 OID 7041195)
-- Name: tucltvalorarucoc fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucoc ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6282 (class 2604 OID 7041196)
-- Name: tucltvalorarucoc fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucoc ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6283 (class 2604 OID 7041197)
-- Name: tucltvalorarucoc estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucoc ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6284 (class 2604 OID 7041198)
-- Name: tucltvalorarucoc id_ucltvalorarucoc; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucoc ALTER COLUMN id_ucltvalorarucoc SET DEFAULT nextval('snx.tucltvalorarucoc_id_ucltvalorarucoc_seq'::regclass);


--
-- TOC entry 6293 (class 2604 OID 7041252)
-- Name: tucltvalorarucogrg fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucogrg ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6294 (class 2604 OID 7041253)
-- Name: tucltvalorarucogrg fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucogrg ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6295 (class 2604 OID 7041254)
-- Name: tucltvalorarucogrg estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucogrg ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6296 (class 2604 OID 7041255)
-- Name: tucltvalorarucogrg id_ucltvalorarucogrg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucogrg ALTER COLUMN id_ucltvalorarucogrg SET DEFAULT nextval('snx.tucltvalorarucogrg_id_ucltvalorarucogrg_seq'::regclass);


--
-- TOC entry 6261 (class 2604 OID 4567572)
-- Name: tucmceitem fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmceitem ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6262 (class 2604 OID 4567573)
-- Name: tucmceitem fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmceitem ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6263 (class 2604 OID 4567574)
-- Name: tucmceitem estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmceitem ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6264 (class 2604 OID 4567575)
-- Name: tucmceitem id_ucmeitem; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmceitem ALTER COLUMN id_ucmeitem SET DEFAULT nextval('snx.tucmceitem_id_ucmeitem_seq'::regclass);


--
-- TOC entry 6109 (class 2604 OID 224540)
-- Name: tucmogrupo fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmogrupo ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6110 (class 2604 OID 224541)
-- Name: tucmogrupo fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmogrupo ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6111 (class 2604 OID 224542)
-- Name: tucmogrupo estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmogrupo ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6112 (class 2604 OID 224543)
-- Name: tucmogrupo id_ucmogrupo; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmogrupo ALTER COLUMN id_ucmogrupo SET DEFAULT nextval('snx.tucmogrupo_id_ucmogrupo_seq'::regclass);


--
-- TOC entry 6113 (class 2604 OID 224551)
-- Name: tucmoobracivil fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmoobracivil ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6114 (class 2604 OID 224552)
-- Name: tucmoobracivil fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmoobracivil ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6115 (class 2604 OID 224553)
-- Name: tucmoobracivil estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmoobracivil ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6116 (class 2604 OID 224554)
-- Name: tucmoobracivil id_ucmoobracivil; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmoobracivil ALTER COLUMN id_ucmoobracivil SET DEFAULT nextval('snx.tucmoobracivil_id_ucmoobracivil_seq'::regclass);


--
-- TOC entry 5984 (class 2604 OID 117615)
-- Name: tucsbequipo fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipo ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5985 (class 2604 OID 117616)
-- Name: tucsbequipo fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipo ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5986 (class 2604 OID 117617)
-- Name: tucsbequipo estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipo ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5987 (class 2604 OID 117618)
-- Name: tucsbequipo id_ucsbequipo; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipo ALTER COLUMN id_ucsbequipo SET DEFAULT nextval('snx.tucsbequipo_id_ucsbequipo_seq'::regclass);


--
-- TOC entry 6349 (class 2604 OID 15283485)
-- Name: tucsbequipotemp id_ucsbequipotemp; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipotemp ALTER COLUMN id_ucsbequipotemp SET DEFAULT nextval('snx.tucsbequipotemp_id_ucsbequipotemp_seq'::regclass);


--
-- TOC entry 5980 (class 2604 OID 112951)
-- Name: tucsbmaquinaria fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbmaquinaria ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5981 (class 2604 OID 112952)
-- Name: tucsbmaquinaria fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbmaquinaria ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5982 (class 2604 OID 112953)
-- Name: tucsbmaquinaria estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbmaquinaria ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5983 (class 2604 OID 112954)
-- Name: tucsbmaquinaria id_ucsbmaquinaria; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbmaquinaria ALTER COLUMN id_ucsbmaquinaria SET DEFAULT nextval('snx.tucsbmaquinaria_id_ucsbmaquinaria_seq'::regclass);


--
-- TOC entry 6317 (class 2604 OID 9125443)
-- Name: tucsbvalorar fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorar ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6318 (class 2604 OID 9125444)
-- Name: tucsbvalorar fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorar ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6319 (class 2604 OID 9125445)
-- Name: tucsbvalorar estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorar ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6320 (class 2604 OID 9125446)
-- Name: tucsbvalorar id_ucsbvalorar; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorar ALTER COLUMN id_ucsbvalorar SET DEFAULT nextval('snx.tucsbvalorar_id_ucsbvalorar_seq'::regclass);


--
-- TOC entry 6157 (class 2604 OID 295838)
-- Name: tucsbvalorarcuc fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvalorarcuc ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6158 (class 2604 OID 295839)
-- Name: tucsbvalorarcuc fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvalorarcuc ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6159 (class 2604 OID 295840)
-- Name: tucsbvalorarcuc estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvalorarcuc ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6160 (class 2604 OID 295841)
-- Name: tucsbvalorarcuc id_ucsvalorarcuc; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvalorarcuc ALTER COLUMN id_ucsvalorarcuc SET DEFAULT nextval('snx.tucsbvalorarcuc_id_ucsvalorarcuc_seq'::regclass);


--
-- TOC entry 6309 (class 2604 OID 9125001)
-- Name: tucsbvalorarcuccont fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuccont ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6310 (class 2604 OID 9125002)
-- Name: tucsbvalorarcuccont fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuccont ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6311 (class 2604 OID 9125003)
-- Name: tucsbvalorarcuccont estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuccont ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6312 (class 2604 OID 9125004)
-- Name: tucsbvalorarcuccont id_ucsbvalorarcuccont; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuccont ALTER COLUMN id_ucsbvalorarcuccont SET DEFAULT nextval('snx.tucsbvalorarcuccant_id_ucsbvalorarcuccant_seq'::regclass);


--
-- TOC entry 6297 (class 2604 OID 9124858)
-- Name: tucsbvalorarcuce fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuce ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6298 (class 2604 OID 9124859)
-- Name: tucsbvalorarcuce fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuce ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6299 (class 2604 OID 9124860)
-- Name: tucsbvalorarcuce estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuce ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6300 (class 2604 OID 9124861)
-- Name: tucsbvalorarcuce id_ucsbvalorarcuce; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuce ALTER COLUMN id_ucsbvalorarcuce SET DEFAULT nextval('snx.tucsbvalorarcuce_id_ucsbvalorarcuce_seq'::regclass);


--
-- TOC entry 6301 (class 2604 OID 9124949)
-- Name: tucsbvalorarcucm fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucm ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6302 (class 2604 OID 9124950)
-- Name: tucsbvalorarcucm fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucm ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6303 (class 2604 OID 9124951)
-- Name: tucsbvalorarcucm estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucm ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6304 (class 2604 OID 9124952)
-- Name: tucsbvalorarcucm id_ucsbvalorarcucm; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucm ALTER COLUMN id_ucsbvalorarcucm SET DEFAULT nextval('snx.tucsbvalorarcucm_id_ucsbvalorarcucm_seq'::regclass);


--
-- TOC entry 6305 (class 2604 OID 9124992)
-- Name: tucsbvalorarcucmate fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucmate ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6306 (class 2604 OID 9124993)
-- Name: tucsbvalorarcucmate fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucmate ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6307 (class 2604 OID 9124994)
-- Name: tucsbvalorarcucmate estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucmate ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6308 (class 2604 OID 9124995)
-- Name: tucsbvalorarcucmate id_ucsbnalorarcucmate; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucmate ALTER COLUMN id_ucsbnalorarcucmate SET DEFAULT nextval('snx.tucsbvalorarcucmate_id_ucsbnalorarcucmate_seq'::regclass);


--
-- TOC entry 6325 (class 2604 OID 9530291)
-- Name: tucsbvalorarcucog fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucog ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6326 (class 2604 OID 9530292)
-- Name: tucsbvalorarcucog fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucog ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6327 (class 2604 OID 9530293)
-- Name: tucsbvalorarcucog estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucog ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6328 (class 2604 OID 9530294)
-- Name: tucsbvalorarcucog id_ucsbvalorarcucog; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucog ALTER COLUMN id_ucsbvalorarcucog SET DEFAULT nextval('snx.tucsbvalorarcucog_id_ucsbvalorarcucog_seq'::regclass);


--
-- TOC entry 6313 (class 2604 OID 9125043)
-- Name: tucsbvalorarouc fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarouc ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6314 (class 2604 OID 9125044)
-- Name: tucsbvalorarouc fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarouc ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6315 (class 2604 OID 9125045)
-- Name: tucsbvalorarouc estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarouc ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6316 (class 2604 OID 9125046)
-- Name: tucsbvalorarouc id_ucsbvalorarouc; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarouc ALTER COLUMN id_ucsbvalorarouc SET DEFAULT nextval('snx.tucsbvalorarouc_id_ucsbvalorarouc_seq'::regclass);


--
-- TOC entry 6354 (class 2604 OID 20095719)
-- Name: tucsbvaloraroucdet id_ucsbvaloraroucdet; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvaloraroucdet ALTER COLUMN id_ucsbvaloraroucdet SET DEFAULT nextval('snx.tucsbvaloraroucdet_id_ucsbvaloraroucdet_seq'::regclass);


--
-- TOC entry 6355 (class 2604 OID 20095730)
-- Name: tucsbvaloraroucog id_ucsbvaloraroucog; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvaloraroucog ALTER COLUMN id_ucsbvaloraroucog SET DEFAULT nextval('snx.tucsbvaloraroucog_id_ucsbvaloraroucog_seq'::regclass);


--
-- TOC entry 6241 (class 2604 OID 4341899)
-- Name: tueepotros fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tueepotros ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6242 (class 2604 OID 4341900)
-- Name: tueepotros fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tueepotros ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6243 (class 2604 OID 4341901)
-- Name: tueepotros estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tueepotros ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6244 (class 2604 OID 4341902)
-- Name: tueepotros id_uceepotros; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tueepotros ALTER COLUMN id_uceepotros SET DEFAULT nextval('snx.tueepotros_id_uceepotros_seq'::regclass);


--
-- TOC entry 5884 (class 2604 OID 42280)
-- Name: tunidad fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidad ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5885 (class 2604 OID 42281)
-- Name: tunidad fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidad ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5886 (class 2604 OID 42282)
-- Name: tunidad estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidad ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5887 (class 2604 OID 42283)
-- Name: tunidad id_unidad; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidad ALTER COLUMN id_unidad SET DEFAULT nextval('snx.tunidad_id_unidad_seq'::regclass);


--
-- TOC entry 6221 (class 2604 OID 3661010)
-- Name: tunidadconstructivacomp fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomp ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6222 (class 2604 OID 3661011)
-- Name: tunidadconstructivacomp fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomp ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6223 (class 2604 OID 3661012)
-- Name: tunidadconstructivacomp estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomp ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6224 (class 2604 OID 3661013)
-- Name: tunidadconstructivacomp id_unidadconstructivacomp; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomp ALTER COLUMN id_unidadconstructivacomp SET DEFAULT nextval('snx.tunidadconstructivacomp_id_unidadconstructivacomp_seq'::regclass);


--
-- TOC entry 6225 (class 2604 OID 3661208)
-- Name: tunidadconstructivacomun fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomun ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6226 (class 2604 OID 3661209)
-- Name: tunidadconstructivacomun fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomun ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6227 (class 2604 OID 3661210)
-- Name: tunidadconstructivacomun estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomun ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6228 (class 2604 OID 3661211)
-- Name: tunidadconstructivacomun id_unidadconstructivacomun; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomun ALTER COLUMN id_unidadconstructivacomun SET DEFAULT nextval('snx.tunidadconstructivacomun_id_unidadconstructivacomun_seq'::regclass);


--
-- TOC entry 6085 (class 2604 OID 219563)
-- Name: tunidadconstructivaedif fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaedif ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6086 (class 2604 OID 219564)
-- Name: tunidadconstructivaedif fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaedif ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6087 (class 2604 OID 219565)
-- Name: tunidadconstructivaedif estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaedif ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6088 (class 2604 OID 219566)
-- Name: tunidadconstructivaedif id_unidadconstructivaedif; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaedif ALTER COLUMN id_unidadconstructivaedif SET DEFAULT nextval('snx.tunidadconstructivaedif_id_unidadconstructivaedif_seq'::regclass);


--
-- TOC entry 6229 (class 2604 OID 3661341)
-- Name: tunidadconstructivaeep fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaeep ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6230 (class 2604 OID 3661342)
-- Name: tunidadconstructivaeep fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaeep ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6231 (class 2604 OID 3661343)
-- Name: tunidadconstructivaeep estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaeep ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6232 (class 2604 OID 3661344)
-- Name: tunidadconstructivaeep id_unidadconstructivaeep; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaeep ALTER COLUMN id_unidadconstructivaeep SET DEFAULT nextval('snx.tunidadconstructivaeep_id_unidadconstructivaeep_seq'::regclass);


--
-- TOC entry 6337 (class 2604 OID 10771038)
-- Name: tunidadconstructivaenccomun fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenccomun ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6338 (class 2604 OID 10771039)
-- Name: tunidadconstructivaenccomun fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenccomun ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6339 (class 2604 OID 10771040)
-- Name: tunidadconstructivaenccomun estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenccomun ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6340 (class 2604 OID 10771041)
-- Name: tunidadconstructivaenccomun id_unidadconstructivaenccomun; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenccomun ALTER COLUMN id_unidadconstructivaenccomun SET DEFAULT nextval('snx.tunidadconstructivaenccomun_id_unidadconstructivaenccomun_seq'::regclass);


--
-- TOC entry 6333 (class 2604 OID 10282062)
-- Name: tunidadconstructivaencseraux fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaencseraux ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6334 (class 2604 OID 10282063)
-- Name: tunidadconstructivaencseraux fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaencseraux ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6335 (class 2604 OID 10282064)
-- Name: tunidadconstructivaencseraux estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaencseraux ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6336 (class 2604 OID 10282065)
-- Name: tunidadconstructivaencseraux unidadconstructivaencseraux; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaencseraux ALTER COLUMN unidadconstructivaencseraux SET DEFAULT nextval('snx.tunidadconstructivaencseraux_unidadconstructivaencseraux_seq'::regclass);


--
-- TOC entry 6341 (class 2604 OID 10821234)
-- Name: tunidadconstructivaenctablerocp fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenctablerocp ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6342 (class 2604 OID 10821235)
-- Name: tunidadconstructivaenctablerocp fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenctablerocp ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6343 (class 2604 OID 10821236)
-- Name: tunidadconstructivaenctablerocp estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenctablerocp ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6344 (class 2604 OID 10821237)
-- Name: tunidadconstructivaenctablerocp id_unidadconstructivaenctablerocp; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenctablerocp ALTER COLUMN id_unidadconstructivaenctablerocp SET DEFAULT nextval('snx.tunidadconstructivaenctablero_id_unidadconstructivaenctable_seq'::regclass);


--
-- TOC entry 6037 (class 2604 OID 173772)
-- Name: tunidadconstructivalt fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6038 (class 2604 OID 173773)
-- Name: tunidadconstructivalt fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6039 (class 2604 OID 173774)
-- Name: tunidadconstructivalt estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6040 (class 2604 OID 173775)
-- Name: tunidadconstructivalt id_unidadconstructivalt; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt ALTER COLUMN id_unidadconstructivalt SET DEFAULT nextval('snx.tunidadconstructivalt_id_unidadconstructivalt_seq'::regclass);


--
-- TOC entry 6193 (class 2604 OID 477326)
-- Name: tunidadconstructivalteqmate fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6194 (class 2604 OID 477327)
-- Name: tunidadconstructivalteqmate fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6195 (class 2604 OID 477328)
-- Name: tunidadconstructivalteqmate estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6196 (class 2604 OID 477329)
-- Name: tunidadconstructivalteqmate id_unidadconstructivalteqmate; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate ALTER COLUMN id_unidadconstructivalteqmate SET DEFAULT nextval('snx.tunidadconstructivalteqmate_id_unidadconstructivalteqmate_seq'::regclass);


--
-- TOC entry 6201 (class 2604 OID 642068)
-- Name: tunidadconstructivaltmontaje fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaltmontaje ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6202 (class 2604 OID 642069)
-- Name: tunidadconstructivaltmontaje fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaltmontaje ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6203 (class 2604 OID 642070)
-- Name: tunidadconstructivaltmontaje estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaltmontaje ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6204 (class 2604 OID 642071)
-- Name: tunidadconstructivaltmontaje id_unidadconstructivaltmontaje; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaltmontaje ALTER COLUMN id_unidadconstructivaltmontaje SET DEFAULT nextval('snx.tunidadconstructivaltmontaje_id_unidadconstructivaltmontaje_seq'::regclass);


--
-- TOC entry 6257 (class 2604 OID 4567558)
-- Name: tunidadconstructivamcelec fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamcelec ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6258 (class 2604 OID 4567559)
-- Name: tunidadconstructivamcelec fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamcelec ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6259 (class 2604 OID 4567560)
-- Name: tunidadconstructivamcelec estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamcelec ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6260 (class 2604 OID 4567561)
-- Name: tunidadconstructivamcelec id_unidadconstructivamcelec; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamcelec ALTER COLUMN id_unidadconstructivamcelec SET DEFAULT nextval('snx.tunidadconstructivamcelec_id_unidadconstructivamcelec_seq'::regclass);


--
-- TOC entry 6105 (class 2604 OID 223416)
-- Name: tunidadconstructivamo fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamo ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6106 (class 2604 OID 223417)
-- Name: tunidadconstructivamo fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamo ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6107 (class 2604 OID 223418)
-- Name: tunidadconstructivamo estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamo ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6108 (class 2604 OID 223419)
-- Name: tunidadconstructivamo id_unidadconstructivamo; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamo ALTER COLUMN id_unidadconstructivamo SET DEFAULT nextval('snx.tunidadconstructivamo_id_unidadconstructivamo_seq'::regclass);


--
-- TOC entry 5928 (class 2604 OID 84561)
-- Name: tunidadconstructivasb fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 5929 (class 2604 OID 84562)
-- Name: tunidadconstructivasb fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 5930 (class 2604 OID 84563)
-- Name: tunidadconstructivasb estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 5931 (class 2604 OID 84564)
-- Name: tunidadconstructivasb id_unidadconstructivasb; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb ALTER COLUMN id_unidadconstructivasb SET DEFAULT nextval('snx.tunidadconstructivasb_id_unidadconstructivasb_seq'::regclass);


--
-- TOC entry 6217 (class 2604 OID 3660996)
-- Name: tunidadconstructivaseraux fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaseraux ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6218 (class 2604 OID 3660997)
-- Name: tunidadconstructivaseraux fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaseraux ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6219 (class 2604 OID 3660998)
-- Name: tunidadconstructivaseraux estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaseraux ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6220 (class 2604 OID 3660999)
-- Name: tunidadconstructivaseraux id_unidadconstructivaseraux; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaseraux ALTER COLUMN id_unidadconstructivaseraux SET DEFAULT nextval('snx.tunidadconstructivaseraux_id_unidadconstructivaseraux_seq'::regclass);


--
-- TOC entry 6233 (class 2604 OID 3661406)
-- Name: tunidadconstructivatablerocp fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocp ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6234 (class 2604 OID 3661407)
-- Name: tunidadconstructivatablerocp fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocp ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6235 (class 2604 OID 3661408)
-- Name: tunidadconstructivatablerocp estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocp ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6236 (class 2604 OID 3661409)
-- Name: tunidadconstructivatablerocp id_unidadconstructivatablerocp; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocp ALTER COLUMN id_unidadconstructivatablerocp SET DEFAULT nextval('snx.tunidadconstructivatablerocp_id_unidadconstructivatablerocp_seq'::regclass);


--
-- TOC entry 6345 (class 2604 OID 10968019)
-- Name: tunidadconstructivatablerocpserv fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocpserv ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6346 (class 2604 OID 10968020)
-- Name: tunidadconstructivatablerocpserv fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocpserv ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6347 (class 2604 OID 10968021)
-- Name: tunidadconstructivatablerocpserv estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocpserv ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6348 (class 2604 OID 10968022)
-- Name: tunidadconstructivatablerocpserv id_unidadconstructivatablerocpserv; Type: DEFAULT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocpserv ALTER COLUMN id_unidadconstructivatablerocpserv SET DEFAULT nextval('snx.tunidadconstructivatablerocps_id_unidadconstructivatableroc_seq'::regclass);


--
-- TOC entry 6053 (class 2604 OID 186479)
-- Name: tvegetacion fecha_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tvegetacion ALTER COLUMN fecha_reg SET DEFAULT now();


--
-- TOC entry 6054 (class 2604 OID 186480)
-- Name: tvegetacion fecha_mod; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tvegetacion ALTER COLUMN fecha_mod SET DEFAULT now();


--
-- TOC entry 6055 (class 2604 OID 186481)
-- Name: tvegetacion estado_reg; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tvegetacion ALTER COLUMN estado_reg SET DEFAULT 'activo'::character varying;


--
-- TOC entry 6056 (class 2604 OID 186482)
-- Name: tvegetacion id_vegetacion; Type: DEFAULT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tvegetacion ALTER COLUMN id_vegetacion SET DEFAULT nextval('snx.tvegetacion_id_vegetacion_seq'::regclass);


--
-- TOC entry 6385 (class 2606 OID 85823)
-- Name: taislador taislador_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.taislador
    ADD CONSTRAINT taislador_pkey PRIMARY KEY (id_aislador);


--
-- TOC entry 6437 (class 2606 OID 179352)
-- Name: tambitoprecio tambitoprecio_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tambitoprecio
    ADD CONSTRAINT tambitoprecio_pkey PRIMARY KEY (id_ambitoprecio);


--
-- TOC entry 6521 (class 2606 OID 689139)
-- Name: tareaprotegida tareaprotegida_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tareaprotegida
    ADD CONSTRAINT tareaprotegida_pkey PRIMARY KEY (id_areaprotegida);


--
-- TOC entry 6387 (class 2606 OID 85834)
-- Name: tcable tcable_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tcable
    ADD CONSTRAINT tcable_pkey PRIMARY KEY (id_cable);


--
-- TOC entry 6365 (class 2606 OID 46979)
-- Name: tclaseaislacion tclaseaislacion_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclaseaislacion
    ADD CONSTRAINT tclaseaislacion_pkey PRIMARY KEY (id_claseaislacion);


--
-- TOC entry 6395 (class 2606 OID 90439)
-- Name: tclasificacionaltura tclasificacionaltura_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tclasificacionaltura
    ADD CONSTRAINT tclasificacionaltura_pkey PRIMARY KEY (id_clasificacionaltura);


--
-- TOC entry 6431 (class 2606 OID 164606)
-- Name: tconfiguracionlt tconfiguracionlt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tconfiguracionlt
    ADD CONSTRAINT tconfiguracionlt_pkey PRIMARY KEY (id_configuracionlt);


--
-- TOC entry 6367 (class 2606 OID 46990)
-- Name: tequipo tequipo_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipo
    ADD CONSTRAINT tequipo_pkey PRIMARY KEY (id_equipo);


--
-- TOC entry 6403 (class 2606 OID 103185)
-- Name: tequipomaterial tequipomaterial_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipomaterial
    ADD CONSTRAINT tequipomaterial_pkey PRIMARY KEY (id_equipomaterial);


--
-- TOC entry 6411 (class 2606 OID 123224)
-- Name: tequipoobracivil tequipoobracivil_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tequipoobracivil
    ADD CONSTRAINT tequipoobracivil_pkey PRIMARY KEY (id_equipoobracivil);


--
-- TOC entry 6369 (class 2606 OID 47001)
-- Name: tequipoprecio tequipoprecio_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipoprecio
    ADD CONSTRAINT tequipoprecio_pkey PRIMARY KEY (id_equipoprecio);


--
-- TOC entry 6487 (class 2606 OID 1492516)
-- Name: textraslt textraslt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.textraslt
    ADD CONSTRAINT textraslt_pkey PRIMARY KEY (id_extraslt);


--
-- TOC entry 6519 (class 2606 OID 688631)
-- Name: tfactorambiental tfactorambiental_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tfactorambiental
    ADD CONSTRAINT tfactorambiental_pkey PRIMARY KEY (id_factorambiental);


--
-- TOC entry 6393 (class 2606 OID 90428)
-- Name: tfactorzona tfactorzona_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfactorzona
    ADD CONSTRAINT tfactorzona_pkey PRIMARY KEY (id_factorzona);


--
-- TOC entry 6447 (class 2606 OID 191159)
-- Name: tfuncionestructura tfuncionestructura_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tfuncionestructura
    ADD CONSTRAINT tfuncionestructura_pkey PRIMARY KEY (id_funcionestructura);


--
-- TOC entry 6389 (class 2606 OID 85845)
-- Name: therrajeaccesorio therrajeaccesorio_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.therrajeaccesorio
    ADD CONSTRAINT therrajeaccesorio_pkey PRIMARY KEY (id_herrajeaccesorio);


--
-- TOC entry 6549 (class 2606 OID 4769191)
-- Name: thilosguarda thilosguarda_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.thilosguarda
    ADD CONSTRAINT thilosguarda_pkey PRIMARY KEY (id_hilosguarda);


--
-- TOC entry 6439 (class 2606 OID 179459)
-- Name: tindiceslt tindiceslt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindiceslt
    ADD CONSTRAINT tindiceslt_pkey PRIMARY KEY (id_indicelt);


--
-- TOC entry 6441 (class 2606 OID 180617)
-- Name: tindicetipo tindicetipo_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindicetipo
    ADD CONSTRAINT tindicetipo_pkey PRIMARY KEY (id_indicetipo);


--
-- TOC entry 6493 (class 2606 OID 291854)
-- Name: tingenierialt tingenierialt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tingenierialt
    ADD CONSTRAINT tingenierialt_pkey PRIMARY KEY (id_ingenierialt);


--
-- TOC entry 6483 (class 2606 OID 257782)
-- Name: tlistafactoresindexacion tlistafactoresindexacion_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tlistafactoresindexacion
    ADD CONSTRAINT tlistafactoresindexacion_pkey PRIMARY KEY (id_factorindexacion);


--
-- TOC entry 6501 (class 2606 OID 412337)
-- Name: tmanoobramoe tmanoobramoe_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmanoobramoe
    ADD CONSTRAINT tmanoobramoe_pkey PRIMARY KEY (id_manoobramoe);


--
-- TOC entry 6371 (class 2606 OID 56606)
-- Name: tmaquinaria tmaquinaria_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinaria
    ADD CONSTRAINT tmaquinaria_pkey PRIMARY KEY (id_maquinaria);


--
-- TOC entry 6587 (class 2606 OID 15412954)
-- Name: tmaquinariafactor tmaquinariafactor_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariafactor
    ADD CONSTRAINT tmaquinariafactor_pkey PRIMARY KEY (id_maquinariafactor);


--
-- TOC entry 6401 (class 2606 OID 103174)
-- Name: tmaquinariamaterial tmaquinariamaterial_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariamaterial
    ADD CONSTRAINT tmaquinariamaterial_pkey PRIMARY KEY (id_maquinariamaterial);


--
-- TOC entry 6499 (class 2606 OID 412323)
-- Name: tmaquinariamoe tmaquinariamoe_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariamoe
    ADD CONSTRAINT tmaquinariamoe_pkey PRIMARY KEY (id_maquinariamoe);


--
-- TOC entry 6413 (class 2606 OID 123235)
-- Name: tmaquinariaobracivil tmaquinariaobracivil_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariaobracivil
    ADD CONSTRAINT tmaquinariaobracivil_pkey PRIMARY KEY (id_maquinariaobracivil);


--
-- TOC entry 6373 (class 2606 OID 56617)
-- Name: tmaquinariaprecio tmaquinariaprecio_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariaprecio
    ADD CONSTRAINT tmaquinariaprecio_pkey PRIMARY KEY (id_maquinariaprecio);


--
-- TOC entry 6397 (class 2606 OID 95467)
-- Name: tmaterial tmaterial_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterial
    ADD CONSTRAINT tmaterial_pkey PRIMARY KEY (id_material);


--
-- TOC entry 6429 (class 2606 OID 164419)
-- Name: tmaterialcantidadlt tmaterialcantidadlt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT tmaterialcantidadlt_pkey PRIMARY KEY (id_materialcantidadlt);


--
-- TOC entry 6415 (class 2606 OID 150791)
-- Name: tmateriales tmateriales_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriales
    ADD CONSTRAINT tmateriales_pkey PRIMARY KEY (id_materiales);


--
-- TOC entry 6425 (class 2606 OID 164392)
-- Name: tmateriallt tmateriallt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt
    ADD CONSTRAINT tmateriallt_pkey PRIMARY KEY (id_materiallt);


--
-- TOC entry 6497 (class 2606 OID 412309)
-- Name: tmaterialmoe tmaterialmoe_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaterialmoe
    ADD CONSTRAINT tmaterialmoe_pkey PRIMARY KEY (id_materialmoe);


--
-- TOC entry 6399 (class 2606 OID 95478)
-- Name: tmaterialprecio tmaterialprecio_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialprecio
    ADD CONSTRAINT tmaterialprecio_pkey PRIMARY KEY (id_materialprecio);


--
-- TOC entry 6427 (class 2606 OID 164405)
-- Name: tmaterialpreciolt tmaterialpreciolt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialpreciolt
    ADD CONSTRAINT tmaterialpreciolt_pkey PRIMARY KEY (id_materialpreciolt);


--
-- TOC entry 6541 (class 2606 OID 4567541)
-- Name: tmcelecapantallamiento tmcelecapantallamiento_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecapantallamiento
    ADD CONSTRAINT tmcelecapantallamiento_pkey PRIMARY KEY (id_mcelecapantallamiento);


--
-- TOC entry 6539 (class 2606 OID 4567529)
-- Name: tmcelecmallatierra tmcelecmallatierra_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmcelecmallatierra
    ADD CONSTRAINT tmcelecmallatierra_pkey PRIMARY KEY (id_mcelecmallatierra);


--
-- TOC entry 6543 (class 2606 OID 4567552)
-- Name: tmceleciluminacion tmeleciluminacion_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmceleciluminacion
    ADD CONSTRAINT tmeleciluminacion_pkey PRIMARY KEY (id_meleciluminacion);


--
-- TOC entry 6375 (class 2606 OID 63620)
-- Name: tmes tmes_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmes
    ADD CONSTRAINT tmes_pkey PRIMARY KEY (id_mes);


--
-- TOC entry 6363 (class 2606 OID 45453)
-- Name: tmoneda tmoneda_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmoneda
    ADD CONSTRAINT tmoneda_pkey PRIMARY KEY (id_moneda);


--
-- TOC entry 6433 (class 2606 OID 166551)
-- Name: tmontajecantidadlt tmontajecantidadlt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt
    ADD CONSTRAINT tmontajecantidadlt_pkey PRIMARY KEY (id_montajecantidadlt);


--
-- TOC entry 6419 (class 2606 OID 160430)
-- Name: tmontajelt tmontajelt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajelt
    ADD CONSTRAINT tmontajelt_pkey PRIMARY KEY (id_montajelt);


--
-- TOC entry 6421 (class 2606 OID 161892)
-- Name: tmontajepreciolt tmontajepreciolt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajepreciolt
    ADD CONSTRAINT tmontajepreciolt_pkey PRIMARY KEY (id_montajepreciolt);


--
-- TOC entry 6515 (class 2606 OID 478116)
-- Name: tnivelcontaminacionlt tnivelcontaminacionlt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tnivelcontaminacionlt
    ADD CONSTRAINT tnivelcontaminacionlt_pkey PRIMARY KEY (id_nivelcontaminacionlt);


--
-- TOC entry 6409 (class 2606 OID 122854)
-- Name: tobracivil tobracivil_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivil
    ADD CONSTRAINT tobracivil_pkey PRIMARY KEY (id_obracivil);


--
-- TOC entry 6457 (class 2606 OID 195586)
-- Name: tobracivilcantidadlt tobracivilcantidadlt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT tobracivilcantidadlt_pkey PRIMARY KEY (id_obracivilcantidadlt);


--
-- TOC entry 6417 (class 2606 OID 157956)
-- Name: tobraciviles tobraciviles_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobraciviles
    ADD CONSTRAINT tobraciviles_pkey PRIMARY KEY (id_obrasciviles);


--
-- TOC entry 6453 (class 2606 OID 191513)
-- Name: tobracivillt tobracivillt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivillt
    ADD CONSTRAINT tobracivillt_pkey PRIMARY KEY (id_obracivillt);


--
-- TOC entry 6467 (class 2606 OID 220746)
-- Name: tobracivilmoe tobracivilmoe_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobracivilmoe
    ADD CONSTRAINT tobracivilmoe_pkey PRIMARY KEY (id_obracivilmoe);


--
-- TOC entry 6455 (class 2606 OID 192618)
-- Name: tobracivilpreciolt tobracivilpreciolt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilpreciolt
    ADD CONSTRAINT tobracivilpreciolt_pkey PRIMARY KEY (id_obracivilpreciolt);


--
-- TOC entry 6507 (class 2606 OID 412599)
-- Name: tocmanoobramoe tocmanoobramoe_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmanoobramoe
    ADD CONSTRAINT tocmanoobramoe_pkey PRIMARY KEY (id_ocmanoobramoe);


--
-- TOC entry 6505 (class 2606 OID 412588)
-- Name: tocmaquinariamoe tocmaquinariamoe_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaquinariamoe
    ADD CONSTRAINT tocmaquinariamoe_pkey PRIMARY KEY (id_ocmaquinariamoe);


--
-- TOC entry 6503 (class 2606 OID 412577)
-- Name: tocmaterialmoe tocmaterialmoe_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaterialmoe
    ADD CONSTRAINT tocmaterialmoe_pkey PRIMARY KEY (id_ocmaterialmoe);


--
-- TOC entry 6391 (class 2606 OID 85856)
-- Name: tpararrayatolinea tpararrayatolinea_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpararrayatolinea
    ADD CONSTRAINT tpararrayatolinea_pkey PRIMARY KEY (id_pararrayolinea);


--
-- TOC entry 6481 (class 2606 OID 253302)
-- Name: tpcu335311335311 tpcu335311335311_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335311335311
    ADD CONSTRAINT tpcu335311335311_pkey PRIMARY KEY (id_pcu335311335311);


--
-- TOC entry 6479 (class 2606 OID 253291)
-- Name: tpcu335313335313 tpcu335313335313_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335313335313
    ADD CONSTRAINT tpcu335313335313_pkey PRIMARY KEY (id_pcu335313335313);


--
-- TOC entry 6475 (class 2606 OID 253269)
-- Name: tpuc33123312 tpuc33123312_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc33123312
    ADD CONSTRAINT tpuc33123312_pkey PRIMARY KEY (id_pcu33123312);


--
-- TOC entry 6477 (class 2606 OID 253280)
-- Name: tpuc3359293359291 tpuc3359293359291_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc3359293359291
    ADD CONSTRAINT tpuc3359293359291_pkey PRIMARY KEY (id_puc3359293359291);


--
-- TOC entry 6523 (class 2606 OID 1517656)
-- Name: trevista trevista_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.trevista
    ADD CONSTRAINT trevista_pkey PRIMARY KEY (id_revista);


--
-- TOC entry 6445 (class 2606 OID 188999)
-- Name: tspuestatierra tspuestatierra_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tspuestatierra
    ADD CONSTRAINT tspuestatierra_pkey PRIMARY KEY (id_puestatierra);


--
-- TOC entry 6575 (class 2606 OID 9929219)
-- Name: ttarifaingsb ttarifaingsb_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttarifaingsb
    ADD CONSTRAINT ttarifaingsb_pkey PRIMARY KEY (id_tarifaingsb);


--
-- TOC entry 6485 (class 2606 OID 279309)
-- Name: ttarifassb ttarifassb_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttarifassb
    ADD CONSTRAINT ttarifassb_pkey PRIMARY KEY (id_tarifasb);


--
-- TOC entry 6377 (class 2606 OID 66779)
-- Name: ttasacambio ttasacambio_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttasacambio
    ADD CONSTRAINT ttasacambio_pkey PRIMARY KEY (id_tasacambio);


--
-- TOC entry 6359 (class 2606 OID 42296)
-- Name: ttensionservicio ttensionservicio_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttensionservicio
    ADD CONSTRAINT ttensionservicio_pkey PRIMARY KEY (id_tensionservicio);


--
-- TOC entry 6491 (class 2606 OID 291229)
-- Name: tterrenolt tterrenolt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenolt
    ADD CONSTRAINT tterrenolt_pkey PRIMARY KEY (id_terrenolt);


--
-- TOC entry 6489 (class 2606 OID 291218)
-- Name: tterrenosb tterrenosb_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tterrenosb
    ADD CONSTRAINT tterrenosb_pkey PRIMARY KEY (id_terrenosb);


--
-- TOC entry 6451 (class 2606 OID 191502)
-- Name: ttipocanalizacion ttipocanalizacion_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocanalizacion
    ADD CONSTRAINT ttipocanalizacion_pkey PRIMARY KEY (id_tipocanalizacion);


--
-- TOC entry 6449 (class 2606 OID 191491)
-- Name: ttipocimentacion ttipocimentacion_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipocimentacion
    ADD CONSTRAINT ttipocimentacion_pkey PRIMARY KEY (id_tipocimentacion);


--
-- TOC entry 6383 (class 2606 OID 85812)
-- Name: ttipoconductor ttipoconductor_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoconductor
    ADD CONSTRAINT ttipoconductor_pkey PRIMARY KEY (id_tipoconductor);


--
-- TOC entry 6381 (class 2606 OID 85801)
-- Name: ttipoestructura ttipoestructura_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoestructura
    ADD CONSTRAINT ttipoestructura_pkey PRIMARY KEY (id_tipoestructura);


--
-- TOC entry 6423 (class 2606 OID 162905)
-- Name: ttipolinea ttipolinea_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipolinea
    ADD CONSTRAINT ttipolinea_pkey PRIMARY KEY (id_tipolinea);


--
-- TOC entry 6571 (class 2606 OID 9457624)
-- Name: ttipopreciomaquinaria ttipopreciomaquinaria_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.ttipopreciomaquinaria
    ADD CONSTRAINT ttipopreciomaquinaria_pkey PRIMARY KEY (id_tipopreciomaquinaria);


--
-- TOC entry 6361 (class 2606 OID 42307)
-- Name: tubicacion tubicacion_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tubicacion
    ADD CONSTRAINT tubicacion_pkey PRIMARY KEY (id_ubicacion);


--
-- TOC entry 6461 (class 2606 OID 219579)
-- Name: tucedifgrupo tucedifgrupo_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifgrupo
    ADD CONSTRAINT tucedifgrupo_pkey PRIMARY KEY (id_ucedifgrupo);


--
-- TOC entry 6465 (class 2606 OID 219604)
-- Name: tucedifobracivil tucedifobracivil_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifobracivil
    ADD CONSTRAINT tucedifobracivil_pkey PRIMARY KEY (id_ucedifobracivil);


--
-- TOC entry 6463 (class 2606 OID 219590)
-- Name: tucedifsubgrupo tucedifsubgrupo_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifsubgrupo
    ADD CONSTRAINT tucedifsubgrupo_pkey PRIMARY KEY (id_ucedifsubgrupo);


--
-- TOC entry 6535 (class 2606 OID 3668619)
-- Name: tuceepitem tuceepitem_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tuceepitem
    ADD CONSTRAINT tuceepitem_pkey PRIMARY KEY (id_uceepitem);


--
-- TOC entry 6509 (class 2606 OID 477298)
-- Name: tucltmaestragrupo tucltmaestragrupo_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestragrupo
    ADD CONSTRAINT tucltmaestragrupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 6511 (class 2606 OID 477309)
-- Name: tucltmaestraitem tucltmaestraitem_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestraitem
    ADD CONSTRAINT tucltmaestraitem_pkey PRIMARY KEY (id_item);


--
-- TOC entry 6551 (class 2606 OID 7041141)
-- Name: tucltvalorar tucltvalorar_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorar
    ADD CONSTRAINT tucltvalorar_pkey PRIMARY KEY (id_ucltvalorar);


--
-- TOC entry 6553 (class 2606 OID 7041155)
-- Name: tucltvaloraruc tucltvaloraruc_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvaloraruc
    ADD CONSTRAINT tucltvaloraruc_pkey PRIMARY KEY (id_ucltvaloraruc);


--
-- TOC entry 6555 (class 2606 OID 7041184)
-- Name: tucltvalorarucem tucltvalorarucem_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucem
    ADD CONSTRAINT tucltvalorarucem_pkey PRIMARY KEY (id_ucltvalorarucem);


--
-- TOC entry 6561 (class 2606 OID 7041241)
-- Name: tucltvalorarucgc tucltvalorarucgc_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucgc
    ADD CONSTRAINT tucltvalorarucgc_pkey PRIMARY KEY (id_ucltvalorarucgc);


--
-- TOC entry 6559 (class 2606 OID 7041222)
-- Name: tucltvalorarucmon tucltvalorarucmon_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucmon
    ADD CONSTRAINT tucltvalorarucmon_pkey PRIMARY KEY (id_ucltvalorarucmon);


--
-- TOC entry 6557 (class 2606 OID 7041203)
-- Name: tucltvalorarucoc tucltvalorarucoc_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucoc
    ADD CONSTRAINT tucltvalorarucoc_pkey PRIMARY KEY (id_ucltvalorarucoc);


--
-- TOC entry 6563 (class 2606 OID 7041260)
-- Name: tucltvalorarucogrg tucltvalorarucogrg_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucogrg
    ADD CONSTRAINT tucltvalorarucogrg_pkey PRIMARY KEY (id_ucltvalorarucogrg);


--
-- TOC entry 6547 (class 2606 OID 4567580)
-- Name: tucmceitem tucmceitem_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmceitem
    ADD CONSTRAINT tucmceitem_pkey PRIMARY KEY (id_ucmeitem);


--
-- TOC entry 6471 (class 2606 OID 224545)
-- Name: tucmogrupo tucmogrupo_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmogrupo
    ADD CONSTRAINT tucmogrupo_pkey PRIMARY KEY (id_ucmogrupo);


--
-- TOC entry 6473 (class 2606 OID 224556)
-- Name: tucmoobracivil tucmoobracivil_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmoobracivil
    ADD CONSTRAINT tucmoobracivil_pkey PRIMARY KEY (id_ucmoobracivil);


--
-- TOC entry 6407 (class 2606 OID 117620)
-- Name: tucsbequipo tucsbequipo_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipo
    ADD CONSTRAINT tucsbequipo_pkey PRIMARY KEY (id_ucsbequipo);


--
-- TOC entry 6585 (class 2606 OID 15283487)
-- Name: tucsbequipotemp tucsbequipotemp_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipotemp
    ADD CONSTRAINT tucsbequipotemp_pkey PRIMARY KEY (id_ucsbequipotemp);


--
-- TOC entry 6405 (class 2606 OID 112956)
-- Name: tucsbmaquinaria tucsbmaquinaria_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbmaquinaria
    ADD CONSTRAINT tucsbmaquinaria_pkey PRIMARY KEY (id_ucsbmaquinaria);


--
-- TOC entry 6569 (class 2606 OID 9125448)
-- Name: tucsbvalorar tucsbvalorar_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorar
    ADD CONSTRAINT tucsbvalorar_pkey PRIMARY KEY (id_ucsbvalorar);


--
-- TOC entry 6495 (class 2606 OID 295843)
-- Name: tucsbvalorarcuc tucsbvalorarcuc_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvalorarcuc
    ADD CONSTRAINT tucsbvalorarcuc_pkey PRIMARY KEY (id_ucsvalorarcuc);


--
-- TOC entry 6565 (class 2606 OID 9124863)
-- Name: tucsbvalorarcuce tucsbvalorarcuce_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcuce
    ADD CONSTRAINT tucsbvalorarcuce_pkey PRIMARY KEY (id_ucsbvalorarcuce);


--
-- TOC entry 6573 (class 2606 OID 9530296)
-- Name: tucsbvalorarcucog tucsbvalorarcucog_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarcucog
    ADD CONSTRAINT tucsbvalorarcucog_pkey PRIMARY KEY (id_ucsbvalorarcucog);


--
-- TOC entry 6567 (class 2606 OID 9125048)
-- Name: tucsbvalorarouc tucsbvalorarouc_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucsbvalorarouc
    ADD CONSTRAINT tucsbvalorarouc_pkey PRIMARY KEY (id_ucsbvalorarouc);


--
-- TOC entry 6589 (class 2606 OID 20095724)
-- Name: tucsbvaloraroucdet tucsbvaloraroucdet_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvaloraroucdet
    ADD CONSTRAINT tucsbvaloraroucdet_pkey PRIMARY KEY (id_ucsbvaloraroucdet);


--
-- TOC entry 6591 (class 2606 OID 20095735)
-- Name: tucsbvaloraroucog tucsbvaloraroucog_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbvaloraroucog
    ADD CONSTRAINT tucsbvaloraroucog_pkey PRIMARY KEY (id_ucsbvaloraroucog);


--
-- TOC entry 6537 (class 2606 OID 4341907)
-- Name: tueepotros tueepotros_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tueepotros
    ADD CONSTRAINT tueepotros_pkey PRIMARY KEY (id_uceepotros);


--
-- TOC entry 6357 (class 2606 OID 42285)
-- Name: tunidad tunidad_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidad
    ADD CONSTRAINT tunidad_pkey PRIMARY KEY (id_unidad);


--
-- TOC entry 6527 (class 2606 OID 3661015)
-- Name: tunidadconstructivacomp tunidadconstructivacomp_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomp
    ADD CONSTRAINT tunidadconstructivacomp_pkey PRIMARY KEY (id_unidadconstructivacomp);


--
-- TOC entry 6529 (class 2606 OID 3661216)
-- Name: tunidadconstructivacomun tunidadconstructivacomun_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomun
    ADD CONSTRAINT tunidadconstructivacomun_pkey PRIMARY KEY (id_unidadconstructivacomun);


--
-- TOC entry 6459 (class 2606 OID 219568)
-- Name: tunidadconstructivaedif tunidadconstructivaedif_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaedif
    ADD CONSTRAINT tunidadconstructivaedif_pkey PRIMARY KEY (id_unidadconstructivaedif);


--
-- TOC entry 6531 (class 2606 OID 3661349)
-- Name: tunidadconstructivaeep tunidadconstructivaeep_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaeep
    ADD CONSTRAINT tunidadconstructivaeep_pkey PRIMARY KEY (id_unidadconstructivaeep);


--
-- TOC entry 6579 (class 2606 OID 10771043)
-- Name: tunidadconstructivaenccomun tunidadconstructivaenccomun_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenccomun
    ADD CONSTRAINT tunidadconstructivaenccomun_pkey PRIMARY KEY (id_unidadconstructivaenccomun);


--
-- TOC entry 6577 (class 2606 OID 10282067)
-- Name: tunidadconstructivaencseraux tunidadconstructivaencseraux_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaencseraux
    ADD CONSTRAINT tunidadconstructivaencseraux_pkey PRIMARY KEY (unidadconstructivaencseraux);


--
-- TOC entry 6581 (class 2606 OID 10821239)
-- Name: tunidadconstructivaenctablerocp tunidadconstructivaenctablerocp_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaenctablerocp
    ADD CONSTRAINT tunidadconstructivaenctablerocp_pkey PRIMARY KEY (id_unidadconstructivaenctablerocp);


--
-- TOC entry 6435 (class 2606 OID 173777)
-- Name: tunidadconstructivalt tunidadconstructivalt_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT tunidadconstructivalt_pkey PRIMARY KEY (id_unidadconstructivalt);


--
-- TOC entry 6513 (class 2606 OID 477331)
-- Name: tunidadconstructivalteqmate tunidadconstructivalteqmate_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate
    ADD CONSTRAINT tunidadconstructivalteqmate_pkey PRIMARY KEY (id_unidadconstructivalteqmate);


--
-- TOC entry 6517 (class 2606 OID 642073)
-- Name: tunidadconstructivaltmontaje tunidadconstructivaltmontaje_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaltmontaje
    ADD CONSTRAINT tunidadconstructivaltmontaje_pkey PRIMARY KEY (id_unidadconstructivaltmontaje);


--
-- TOC entry 6545 (class 2606 OID 4567566)
-- Name: tunidadconstructivamcelec tunidadconstructivamcelec_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamcelec
    ADD CONSTRAINT tunidadconstructivamcelec_pkey PRIMARY KEY (id_unidadconstructivamcelec);


--
-- TOC entry 6469 (class 2606 OID 223421)
-- Name: tunidadconstructivamo tunidadconstructivamo_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivamo
    ADD CONSTRAINT tunidadconstructivamo_pkey PRIMARY KEY (id_unidadconstructivamo);


--
-- TOC entry 6379 (class 2606 OID 84566)
-- Name: tunidadconstructivasb tunidadconstructivasb_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb
    ADD CONSTRAINT tunidadconstructivasb_pkey PRIMARY KEY (id_unidadconstructivasb);


--
-- TOC entry 6525 (class 2606 OID 3661004)
-- Name: tunidadconstructivaseraux tunidadconstructivaseraux_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaseraux
    ADD CONSTRAINT tunidadconstructivaseraux_pkey PRIMARY KEY (id_unidadconstructivaseraux);


--
-- TOC entry 6533 (class 2606 OID 3661414)
-- Name: tunidadconstructivatablerocp tunidadconstructivatablerocp_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocp
    ADD CONSTRAINT tunidadconstructivatablerocp_pkey PRIMARY KEY (id_unidadconstructivatablerocp);


--
-- TOC entry 6583 (class 2606 OID 10968027)
-- Name: tunidadconstructivatablerocpserv tunidadconstructivatablerocpserv_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocpserv
    ADD CONSTRAINT tunidadconstructivatablerocpserv_pkey PRIMARY KEY (id_unidadconstructivatablerocpserv);


--
-- TOC entry 6443 (class 2606 OID 186484)
-- Name: tvegetacion tvegetacion_pkey; Type: CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tvegetacion
    ADD CONSTRAINT tvegetacion_pkey PRIMARY KEY (id_vegetacion);


--
-- TOC entry 6731 (class 2620 OID 15413565)
-- Name: tmaquinaria trg_tmaquinariaoc1; Type: TRIGGER; Schema: snx; Owner: dbkerp_conexion
--

CREATE TRIGGER trg_tmaquinariaoc1 AFTER UPDATE ON snx.tmaquinaria FOR EACH STATEMENT EXECUTE PROCEDURE snx.ft_actualizarocmaquiria();


--
-- TOC entry 6734 (class 2620 OID 4766549)
-- Name: tobraciviles trg_tobraciviles; Type: TRIGGER; Schema: snx; Owner: dbkerp_conexion
--

CREATE TRIGGER trg_tobraciviles AFTER UPDATE ON snx.tobraciviles FOR EACH ROW EXECUTE PROCEDURE snx.ft_actualizarucsbobracivil();


--
-- TOC entry 6733 (class 2620 OID 4705652)
-- Name: tucsbequipo trg_tucsbequipo; Type: TRIGGER; Schema: snx; Owner: dbkerp_admin
--

CREATE TRIGGER trg_tucsbequipo AFTER UPDATE ON snx.tucsbequipo FOR EACH ROW EXECUTE PROCEDURE snx.ft_actualizarucsbequ();


--
-- TOC entry 6732 (class 2620 OID 4766547)
-- Name: tucsbmaquinaria trg_tucsbmaquinaria; Type: TRIGGER; Schema: snx; Owner: dbkerp_admin
--

CREATE TRIGGER trg_tucsbmaquinaria AFTER UPDATE ON snx.tucsbmaquinaria FOR EACH ROW EXECUTE PROCEDURE snx.ft_actualizarucsbmaq();


--
-- TOC entry 6612 (class 2606 OID 1483932)
-- Name: tmaterial 	id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterial
    ADD CONSTRAINT "	id_unidad" FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6726 (class 2606 OID 7041185)
-- Name: tucltvalorarucem fk_id_Ucltvaloraruc; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucem
    ADD CONSTRAINT "fk_id_Ucltvaloraruc" FOREIGN KEY (id_ucltvaloraruc) REFERENCES snx.tucltvaloraruc(id_ucltvaloraruc);


--
-- TOC entry 6723 (class 2606 OID 7041166)
-- Name: tucltvaloraruc fk_id_tensionservicio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvaloraruc
    ADD CONSTRAINT fk_id_tensionservicio FOREIGN KEY (id_tensionservicio) REFERENCES snx.ttensionservicio(id_tensionservicio);


--
-- TOC entry 6724 (class 2606 OID 7041161)
-- Name: tucltvaloraruc fk_id_tipolinea; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvaloraruc
    ADD CONSTRAINT fk_id_tipolinea FOREIGN KEY (id_tipolinea) REFERENCES snx.ttipolinea(id_tipolinea);


--
-- TOC entry 6725 (class 2606 OID 7041156)
-- Name: tucltvaloraruc fk_id_ucltvalorar; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvaloraruc
    ADD CONSTRAINT fk_id_ucltvalorar FOREIGN KEY (id_ucltvalorar) REFERENCES snx.tucltvalorar(id_ucltvalorar);


--
-- TOC entry 6727 (class 2606 OID 7041204)
-- Name: tucltvalorarucoc fk_id_ucltvaloraruc; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucoc
    ADD CONSTRAINT fk_id_ucltvaloraruc FOREIGN KEY (id_ucltvaloraruc) REFERENCES snx.tucltvaloraruc(id_ucltvaloraruc);


--
-- TOC entry 6728 (class 2606 OID 7041223)
-- Name: tucltvalorarucmon fk_id_ucltvaloraruc; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucmon
    ADD CONSTRAINT fk_id_ucltvaloraruc FOREIGN KEY (id_ucltvaloraruc) REFERENCES snx.tucltvaloraruc(id_ucltvaloraruc);


--
-- TOC entry 6730 (class 2606 OID 7041261)
-- Name: tucltvalorarucogrg fk_id_ucltvaloraruc; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucogrg
    ADD CONSTRAINT fk_id_ucltvaloraruc FOREIGN KEY (id_ucltvaloraruc) REFERENCES snx.tucltvaloraruc(id_ucltvaloraruc);


--
-- TOC entry 6729 (class 2606 OID 7041242)
-- Name: tucltvalorarucgc fk_id_udltvaloraruc; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltvalorarucgc
    ADD CONSTRAINT fk_id_udltvaloraruc FOREIGN KEY (id_ucltvaloraruc) REFERENCES snx.tucltvaloraruc(id_ucltvaloraruc);


--
-- TOC entry 6646 (class 2606 OID 1490712)
-- Name: tmaterialcantidadlt id_aislador; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_aislador FOREIGN KEY (id_aislador) REFERENCES snx.taislador(id_aislador);


--
-- TOC entry 6713 (class 2606 OID 1515330)
-- Name: tunidadconstructivalteqmate id_aislador; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate
    ADD CONSTRAINT id_aislador FOREIGN KEY (id_aislador) REFERENCES snx.taislador(id_aislador);


--
-- TOC entry 6592 (class 2606 OID 1468672)
-- Name: tequipo id_ambitoprecio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipo
    ADD CONSTRAINT id_ambitoprecio FOREIGN KEY (id_ambitoprecio) REFERENCES snx.tambitoprecio(id_ambitoprecio);


--
-- TOC entry 6671 (class 2606 OID 1474560)
-- Name: tindiceslt id_ambitoprecio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindiceslt
    ADD CONSTRAINT id_ambitoprecio FOREIGN KEY (id_ambitoprecio) REFERENCES snx.tambitoprecio(id_ambitoprecio);


--
-- TOC entry 6598 (class 2606 OID 1475215)
-- Name: tmaquinaria id_ambitoprecio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinaria
    ADD CONSTRAINT id_ambitoprecio FOREIGN KEY (id_ambitoprecio) REFERENCES snx.tambitoprecio(id_ambitoprecio);


--
-- TOC entry 6610 (class 2606 OID 1483942)
-- Name: tmaterial id_ambitoprecio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterial
    ADD CONSTRAINT id_ambitoprecio FOREIGN KEY (id_ambitoprecio) REFERENCES snx.tambitoprecio(id_ambitoprecio);


--
-- TOC entry 6637 (class 2606 OID 1496541)
-- Name: tmateriallt id_ambitoprecio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt
    ADD CONSTRAINT id_ambitoprecio FOREIGN KEY (id_ambitoprecio) REFERENCES snx.tambitoprecio(id_ambitoprecio);


--
-- TOC entry 6660 (class 2606 OID 1507638)
-- Name: tunidadconstructivalt id_areaprotegida; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_areaprotegida FOREIGN KEY (id_areaprotegida) REFERENCES snx.tareaprotegida(id_areaprotegida);


--
-- TOC entry 6594 (class 2606 OID 1468662)
-- Name: tequipo id_claseaislacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipo
    ADD CONSTRAINT id_claseaislacion FOREIGN KEY (id_claseaislacion) REFERENCES snx.tclaseaislacion(id_claseaislacion);


--
-- TOC entry 6606 (class 2606 OID 1515360)
-- Name: tunidadconstructivasb id_claseaislacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb
    ADD CONSTRAINT id_claseaislacion FOREIGN KEY (id_claseaislacion) REFERENCES snx.tclaseaislacion(id_claseaislacion);


--
-- TOC entry 6663 (class 2606 OID 1507623)
-- Name: tunidadconstructivalt id_clasificacionaltura; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_clasificacionaltura FOREIGN KEY (id_clasificacionaltura) REFERENCES snx.tclasificacionaltura(id_clasificacionaltura);


--
-- TOC entry 6650 (class 2606 OID 1490692)
-- Name: tmaterialcantidadlt id_configuracionlt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_configuracionlt FOREIGN KEY (id_configuracionlt) REFERENCES snx.tconfiguracionlt(id_configuracionlt);


--
-- TOC entry 6655 (class 2606 OID 1497630)
-- Name: tmontajecantidadlt id_configuracionlt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt
    ADD CONSTRAINT id_configuracionlt FOREIGN KEY (id_configuracionlt) REFERENCES snx.tconfiguracionlt(id_configuracionlt);


--
-- TOC entry 6680 (class 2606 OID 1502330)
-- Name: tobracivilcantidadlt id_configuracionlt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_configuracionlt FOREIGN KEY (id_configuracionlt) REFERENCES snx.tconfiguracionlt(id_configuracionlt);


--
-- TOC entry 6664 (class 2606 OID 1507618)
-- Name: tunidadconstructivalt id_configuracionlt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_configuracionlt FOREIGN KEY (id_configuracionlt) REFERENCES snx.tconfiguracionlt(id_configuracionlt);


--
-- TOC entry 6618 (class 2606 OID 1468787)
-- Name: tequipomaterial id_equipo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipomaterial
    ADD CONSTRAINT id_equipo FOREIGN KEY (id_equipo) REFERENCES snx.tequipo(id_equipo);


--
-- TOC entry 6624 (class 2606 OID 1468802)
-- Name: tequipoobracivil id_equipo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tequipoobracivil
    ADD CONSTRAINT id_equipo FOREIGN KEY (id_equipo) REFERENCES snx.tequipo(id_equipo);


--
-- TOC entry 6596 (class 2606 OID 1468807)
-- Name: tequipoprecio id_equipo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipoprecio
    ADD CONSTRAINT id_equipo FOREIGN KEY (id_equipo) REFERENCES snx.tequipo(id_equipo);


--
-- TOC entry 6621 (class 2606 OID 1507558)
-- Name: tucsbequipo id_equipo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipo
    ADD CONSTRAINT id_equipo FOREIGN KEY (id_equipo) REFERENCES snx.tequipo(id_equipo);


--
-- TOC entry 6643 (class 2606 OID 1492793)
-- Name: tmaterialcantidadlt id_extralt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_extralt FOREIGN KEY (id_extralt) REFERENCES snx.textraslt(id_extraslt);


--
-- TOC entry 6712 (class 2606 OID 1515335)
-- Name: tunidadconstructivalteqmate id_extralt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate
    ADD CONSTRAINT id_extralt FOREIGN KEY (id_extralt) REFERENCES snx.textraslt(id_extraslt);


--
-- TOC entry 6593 (class 2606 OID 1468667)
-- Name: tequipo id_factorindexacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipo
    ADD CONSTRAINT id_factorindexacion FOREIGN KEY (id_factorindexacion) REFERENCES snx.tlistafactoresindexacion(id_factorindexacion);


--
-- TOC entry 6599 (class 2606 OID 1475210)
-- Name: tmaquinaria id_factorindexacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinaria
    ADD CONSTRAINT id_factorindexacion FOREIGN KEY (id_factorindexacion) REFERENCES snx.tlistafactoresindexacion(id_factorindexacion);


--
-- TOC entry 6611 (class 2606 OID 1483937)
-- Name: tmaterial id_factorindexacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterial
    ADD CONSTRAINT id_factorindexacion FOREIGN KEY (id_factorindexacion) REFERENCES snx.tlistafactoresindexacion(id_factorindexacion);


--
-- TOC entry 6638 (class 2606 OID 1496536)
-- Name: tmateriallt id_factorindexacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt
    ADD CONSTRAINT id_factorindexacion FOREIGN KEY (id_factorindexacion) REFERENCES snx.tlistafactoresindexacion(id_factorindexacion);


--
-- TOC entry 6632 (class 2606 OID 1497863)
-- Name: tmontajelt id_factorindexacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajelt
    ADD CONSTRAINT id_factorindexacion FOREIGN KEY (id_factorindexacion) REFERENCES snx.tlistafactoresindexacion(id_factorindexacion);


--
-- TOC entry 6672 (class 2606 OID 1503017)
-- Name: tobracivillt id_factorindexacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivillt
    ADD CONSTRAINT id_factorindexacion FOREIGN KEY (id_factorindexacion) REFERENCES snx.tlistafactoresindexacion(id_factorindexacion);


--
-- TOC entry 6648 (class 2606 OID 1490702)
-- Name: tmaterialcantidadlt id_funcionestructura; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_funcionestructura FOREIGN KEY (id_funcionestructura) REFERENCES snx.tfuncionestructura(id_funcionestructura);


--
-- TOC entry 6653 (class 2606 OID 1497640)
-- Name: tmontajecantidadlt id_funcionestructura; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt
    ADD CONSTRAINT id_funcionestructura FOREIGN KEY (id_funcionestructura) REFERENCES snx.tfuncionestructura(id_funcionestructura);


--
-- TOC entry 6679 (class 2606 OID 1502335)
-- Name: tobracivilcantidadlt id_funcionestructura; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_funcionestructura FOREIGN KEY (id_funcionestructura) REFERENCES snx.tfuncionestructura(id_funcionestructura);


--
-- TOC entry 6711 (class 2606 OID 1507528)
-- Name: tucltmaestraitem id_grupo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestraitem
    ADD CONSTRAINT id_grupo FOREIGN KEY (id_grupo) REFERENCES snx.tucltmaestragrupo(id_grupo);


--
-- TOC entry 6642 (class 2606 OID 5563227)
-- Name: tmaterialcantidadlt id_hilosguarda; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_hilosguarda FOREIGN KEY (id_hilosguarda) REFERENCES snx.thilosguarda(id_hilosguarda);


--
-- TOC entry 6669 (class 2606 OID 1474570)
-- Name: tindiceslt id_indicetipo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindiceslt
    ADD CONSTRAINT id_indicetipo FOREIGN KEY (id_indicetipo) REFERENCES snx.tindicetipo(id_indicetipo);


--
-- TOC entry 6715 (class 2606 OID 1515320)
-- Name: tunidadconstructivalteqmate id_item; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate
    ADD CONSTRAINT id_item FOREIGN KEY (id_item) REFERENCES snx.tucltmaestraitem(id_item);


--
-- TOC entry 6717 (class 2606 OID 1515345)
-- Name: tunidadconstructivaltmontaje id_item; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaltmontaje
    ADD CONSTRAINT id_item FOREIGN KEY (id_item) REFERENCES snx.tucltmaestraitem(id_item);


--
-- TOC entry 6708 (class 2606 OID 1504368)
-- Name: tocmanoobramoe id_manoobramoe; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmanoobramoe
    ADD CONSTRAINT id_manoobramoe FOREIGN KEY (id_manoobramoe) REFERENCES snx.tmanoobramoe(id_manoobramoe);


--
-- TOC entry 6616 (class 2606 OID 1475531)
-- Name: tmaquinariamaterial id_maquinaria; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariamaterial
    ADD CONSTRAINT id_maquinaria FOREIGN KEY (id_maquinaria) REFERENCES snx.tmaquinaria(id_maquinaria);


--
-- TOC entry 6626 (class 2606 OID 1475594)
-- Name: tmaquinariaobracivil id_maquinaria; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariaobracivil
    ADD CONSTRAINT id_maquinaria FOREIGN KEY (id_maquinaria) REFERENCES snx.tmaquinaria(id_maquinaria);


--
-- TOC entry 6601 (class 2606 OID 1483794)
-- Name: tmaquinariaprecio id_maquinaria; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariaprecio
    ADD CONSTRAINT id_maquinaria FOREIGN KEY (id_maquinaria) REFERENCES snx.tmaquinaria(id_maquinaria);


--
-- TOC entry 6619 (class 2606 OID 1507568)
-- Name: tucsbmaquinaria id_maquinaria; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbmaquinaria
    ADD CONSTRAINT id_maquinaria FOREIGN KEY (id_maquinaria) REFERENCES snx.tmaquinaria(id_maquinaria);


--
-- TOC entry 6706 (class 2606 OID 1507457)
-- Name: tocmaquinariamoe id_maquinariamoe; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaquinariamoe
    ADD CONSTRAINT id_maquinariamoe FOREIGN KEY (id_maquinariamoe) REFERENCES snx.tmaquinariamoe(id_maquinariamoe);


--
-- TOC entry 6614 (class 2606 OID 1462176)
-- Name: tmaterialprecio id_material; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialprecio
    ADD CONSTRAINT id_material FOREIGN KEY (id_material) REFERENCES snx.tmaterial(id_material);


--
-- TOC entry 6617 (class 2606 OID 1468792)
-- Name: tequipomaterial id_material; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipomaterial
    ADD CONSTRAINT id_material FOREIGN KEY (id_material) REFERENCES snx.tmaterial(id_material);


--
-- TOC entry 6615 (class 2606 OID 1475536)
-- Name: tmaquinariamaterial id_material; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariamaterial
    ADD CONSTRAINT id_material FOREIGN KEY (id_material) REFERENCES snx.tmaterial(id_material);


--
-- TOC entry 6628 (class 2606 OID 1493067)
-- Name: tmateriales id_material; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriales
    ADD CONSTRAINT id_material FOREIGN KEY (id_material) REFERENCES snx.tmaterial(id_material);


--
-- TOC entry 6652 (class 2606 OID 1490682)
-- Name: tmaterialcantidadlt id_materiallt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_materiallt FOREIGN KEY (id_materiallt) REFERENCES snx.tmateriallt(id_materiallt);


--
-- TOC entry 6641 (class 2606 OID 1497054)
-- Name: tmaterialpreciolt id_materiallt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialpreciolt
    ADD CONSTRAINT id_materiallt FOREIGN KEY (id_materiallt) REFERENCES snx.tmateriallt(id_materiallt);


--
-- TOC entry 6704 (class 2606 OID 1507467)
-- Name: tocmaterialmoe id_materialmoe; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaterialmoe
    ADD CONSTRAINT id_materialmoe FOREIGN KEY (id_materialmoe) REFERENCES snx.tmaterialmoe(id_materialmoe);


--
-- TOC entry 6602 (class 2606 OID 1463172)
-- Name: ttasacambio id_mes; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttasacambio
    ADD CONSTRAINT id_mes FOREIGN KEY (id_mes) REFERENCES snx.tmes(id_mes);


--
-- TOC entry 6693 (class 2606 OID 1468521)
-- Name: tpuc33123312 id_mes; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc33123312
    ADD CONSTRAINT id_mes FOREIGN KEY (id_mes) REFERENCES snx.tmes(id_mes);


--
-- TOC entry 6696 (class 2606 OID 1507472)
-- Name: tpcu335311335311 id_mes; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335311335311
    ADD CONSTRAINT id_mes FOREIGN KEY (id_mes) REFERENCES snx.tmes(id_mes);


--
-- TOC entry 6695 (class 2606 OID 1507477)
-- Name: tpcu335313335313 id_mes; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpcu335313335313
    ADD CONSTRAINT id_mes FOREIGN KEY (id_mes) REFERENCES snx.tmes(id_mes);


--
-- TOC entry 6694 (class 2606 OID 1507482)
-- Name: tpuc3359293359291 id_mes; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tpuc3359293359291
    ADD CONSTRAINT id_mes FOREIGN KEY (id_mes) REFERENCES snx.tmes(id_mes);


--
-- TOC entry 6595 (class 2606 OID 1468812)
-- Name: tequipoprecio id_moneda; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tequipoprecio
    ADD CONSTRAINT id_moneda FOREIGN KEY (id_moneda) REFERENCES snx.tmoneda(id_moneda);


--
-- TOC entry 6613 (class 2606 OID 1496836)
-- Name: tmaterialprecio id_moneda; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialprecio
    ADD CONSTRAINT id_moneda FOREIGN KEY (id_moneda) REFERENCES snx.tmoneda(id_moneda);


--
-- TOC entry 6640 (class 2606 OID 1497059)
-- Name: tmaterialpreciolt id_moneda; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialpreciolt
    ADD CONSTRAINT id_moneda FOREIGN KEY (id_moneda) REFERENCES snx.tmoneda(id_moneda);


--
-- TOC entry 6634 (class 2606 OID 1498012)
-- Name: tmontajepreciolt id_moneda; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajepreciolt
    ADD CONSTRAINT id_moneda FOREIGN KEY (id_moneda) REFERENCES snx.tmoneda(id_moneda);


--
-- TOC entry 6674 (class 2606 OID 1504105)
-- Name: tobracivilpreciolt id_moneda; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilpreciolt
    ADD CONSTRAINT id_moneda FOREIGN KEY (id_moneda) REFERENCES snx.tmoneda(id_moneda);


--
-- TOC entry 6603 (class 2606 OID 1463167)
-- Name: ttasacambio id_monedadestino; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttasacambio
    ADD CONSTRAINT id_monedadestino FOREIGN KEY (id_monedadestino) REFERENCES snx.tmoneda(id_moneda);


--
-- TOC entry 6604 (class 2606 OID 1463162)
-- Name: ttasacambio id_monedaorigen; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttasacambio
    ADD CONSTRAINT id_monedaorigen FOREIGN KEY (id_monedaorigen) REFERENCES snx.tmoneda(id_moneda);


--
-- TOC entry 6658 (class 2606 OID 1497615)
-- Name: tmontajecantidadlt id_montajelt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt
    ADD CONSTRAINT id_montajelt FOREIGN KEY (id_montajelt) REFERENCES snx.tmontajelt(id_montajelt);


--
-- TOC entry 6635 (class 2606 OID 1498007)
-- Name: tmontajepreciolt id_montajelt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajepreciolt
    ADD CONSTRAINT id_montajelt FOREIGN KEY (id_montajelt) REFERENCES snx.tmontajelt(id_montajelt);


--
-- TOC entry 6661 (class 2606 OID 1507633)
-- Name: tunidadconstructivalt id_nivelcontaminacionlt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_nivelcontaminacionlt FOREIGN KEY (id_nivelcontaminacionlt) REFERENCES snx.tnivelcontaminacionlt(id_nivelcontaminacionlt);


--
-- TOC entry 6625 (class 2606 OID 1468797)
-- Name: tequipoobracivil id_obracivil; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tequipoobracivil
    ADD CONSTRAINT id_obracivil FOREIGN KEY (id_obracivil) REFERENCES snx.tobracivil(id_obracivil);


--
-- TOC entry 6627 (class 2606 OID 1475589)
-- Name: tmaquinariaobracivil id_obracivil; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariaobracivil
    ADD CONSTRAINT id_obracivil FOREIGN KEY (id_obracivil) REFERENCES snx.tobracivil(id_obracivil);


--
-- TOC entry 6630 (class 2606 OID 1502792)
-- Name: tobraciviles id_obracivil; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobraciviles
    ADD CONSTRAINT id_obracivil FOREIGN KEY (id_obracivil) REFERENCES snx.tobracivil(id_obracivil);


--
-- TOC entry 6684 (class 2606 OID 1502310)
-- Name: tobracivilcantidadlt id_obracivillt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_obracivillt FOREIGN KEY (id_obracivillt) REFERENCES snx.tobracivillt(id_obracivillt);


--
-- TOC entry 6675 (class 2606 OID 1504100)
-- Name: tobracivilpreciolt id_obracivillt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilpreciolt
    ADD CONSTRAINT id_obracivillt FOREIGN KEY (id_obracivillt) REFERENCES snx.tobracivillt(id_obracivillt);


--
-- TOC entry 6709 (class 2606 OID 1504363)
-- Name: tocmanoobramoe id_obracivilmoe; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmanoobramoe
    ADD CONSTRAINT id_obracivilmoe FOREIGN KEY (id_obracivilmoe) REFERENCES snx.tobracivilmoe(id_obracivilmoe);


--
-- TOC entry 6707 (class 2606 OID 1507452)
-- Name: tocmaquinariamoe id_obracivilmoe; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaquinariamoe
    ADD CONSTRAINT id_obracivilmoe FOREIGN KEY (id_obracivilmoe) REFERENCES snx.tobracivilmoe(id_obracivilmoe);


--
-- TOC entry 6705 (class 2606 OID 1507462)
-- Name: tocmaterialmoe id_obracivilmoe; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tocmaterialmoe
    ADD CONSTRAINT id_obracivilmoe FOREIGN KEY (id_obracivilmoe) REFERENCES snx.tobracivilmoe(id_obracivilmoe);


--
-- TOC entry 6687 (class 2606 OID 1507517)
-- Name: tucedifobracivil id_obracivilmoe; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifobracivil
    ADD CONSTRAINT id_obracivilmoe FOREIGN KEY (id_obracivilmoe) REFERENCES snx.tobracivilmoe(id_obracivilmoe);


--
-- TOC entry 6691 (class 2606 OID 1507548)
-- Name: tucmoobracivil id_obracivilmoe; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmoobracivil
    ADD CONSTRAINT id_obracivilmoe FOREIGN KEY (id_obracivilmoe) REFERENCES snx.tobracivilmoe(id_obracivilmoe);


--
-- TOC entry 6662 (class 2606 OID 1507628)
-- Name: tunidadconstructivalt id_pararrayolinea; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_pararrayolinea FOREIGN KEY (id_pararrayolinea) REFERENCES snx.tpararrayatolinea(id_pararrayolinea);


--
-- TOC entry 6647 (class 2606 OID 1490707)
-- Name: tmaterialcantidadlt id_puestatierra; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_puestatierra FOREIGN KEY (id_puestatierra) REFERENCES snx.tspuestatierra(id_puestatierra);


--
-- TOC entry 6714 (class 2606 OID 1515325)
-- Name: tunidadconstructivalteqmate id_puestatierra; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate
    ADD CONSTRAINT id_puestatierra FOREIGN KEY (id_puestatierra) REFERENCES snx.tspuestatierra(id_puestatierra);


--
-- TOC entry 6659 (class 2606 OID 1577163)
-- Name: tunidadconstructivalt id_revista; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_revista FOREIGN KEY (id_revista) REFERENCES snx.trevista(id_revista);


--
-- TOC entry 6699 (class 2606 OID 1475195)
-- Name: tingenierialt id_tensionservicio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tingenierialt
    ADD CONSTRAINT id_tensionservicio FOREIGN KEY (id_tensionservicio) REFERENCES snx.ttensionservicio(id_tensionservicio);


--
-- TOC entry 6649 (class 2606 OID 1490697)
-- Name: tmaterialcantidadlt id_tensionservicio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_tensionservicio FOREIGN KEY (id_tensionservicio) REFERENCES snx.ttensionservicio(id_tensionservicio);


--
-- TOC entry 6657 (class 2606 OID 1497620)
-- Name: tmontajecantidadlt id_tensionservicio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt
    ADD CONSTRAINT id_tensionservicio FOREIGN KEY (id_tensionservicio) REFERENCES snx.ttensionservicio(id_tensionservicio);


--
-- TOC entry 6682 (class 2606 OID 1502320)
-- Name: tobracivilcantidadlt id_tensionservicio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_tensionservicio FOREIGN KEY (id_tensionservicio) REFERENCES snx.ttensionservicio(id_tensionservicio);


--
-- TOC entry 6609 (class 2606 OID 1507492)
-- Name: ttipoconductor id_tensionservicio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttipoconductor
    ADD CONSTRAINT id_tensionservicio FOREIGN KEY (id_tensionservicio) REFERENCES snx.ttensionservicio(id_tensionservicio);


--
-- TOC entry 6667 (class 2606 OID 1507603)
-- Name: tunidadconstructivalt id_tensionservicio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_tensionservicio FOREIGN KEY (id_tensionservicio) REFERENCES snx.ttensionservicio(id_tensionservicio);


--
-- TOC entry 6608 (class 2606 OID 1515350)
-- Name: tunidadconstructivasb id_tensionservicio; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb
    ADD CONSTRAINT id_tensionservicio FOREIGN KEY (id_tensionservicio) REFERENCES snx.ttensionservicio(id_tensionservicio);


--
-- TOC entry 6678 (class 2606 OID 1502340)
-- Name: tobracivilcantidadlt id_terreno; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_terreno FOREIGN KEY (id_terreno) REFERENCES snx.tterrenolt(id_terrenolt);


--
-- TOC entry 6676 (class 2606 OID 1502350)
-- Name: tobracivilcantidadlt id_tipocanalizacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_tipocanalizacion FOREIGN KEY (id_tipocanalizacion) REFERENCES snx.ttipocanalizacion(id_tipocanalizacion);


--
-- TOC entry 6677 (class 2606 OID 1502345)
-- Name: tobracivilcantidadlt id_tipocimentacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_tipocimentacion FOREIGN KEY (id_tipocimentacion) REFERENCES snx.ttipocimentacion(id_tipocimentacion);


--
-- TOC entry 6651 (class 2606 OID 1490687)
-- Name: tmaterialcantidadlt id_tipoconductor; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_tipoconductor FOREIGN KEY (id_tipoconductor) REFERENCES snx.ttipoconductor(id_tipoconductor);


--
-- TOC entry 6665 (class 2606 OID 1507613)
-- Name: tunidadconstructivalt id_tipoconductor; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_tipoconductor FOREIGN KEY (id_tipoconductor) REFERENCES snx.ttipoconductor(id_tipoconductor);


--
-- TOC entry 6644 (class 2606 OID 1490722)
-- Name: tmaterialcantidadlt id_tipoestructura; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_tipoestructura FOREIGN KEY (id_tipoestructura) REFERENCES snx.ttipoestructura(id_tipoestructura);


--
-- TOC entry 6656 (class 2606 OID 1497625)
-- Name: tmontajecantidadlt id_tipoestructura; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt
    ADD CONSTRAINT id_tipoestructura FOREIGN KEY (id_tipoestructura) REFERENCES snx.ttipoestructura(id_tipoestructura);


--
-- TOC entry 6681 (class 2606 OID 1502325)
-- Name: tobracivilcantidadlt id_tipoestructura; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_tipoestructura FOREIGN KEY (id_tipoestructura) REFERENCES snx.ttipoestructura(id_tipoestructura);


--
-- TOC entry 6666 (class 2606 OID 1507608)
-- Name: tunidadconstructivalt id_tipoestructura; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_tipoestructura FOREIGN KEY (id_tipoestructura) REFERENCES snx.ttipoestructura(id_tipoestructura);


--
-- TOC entry 6700 (class 2606 OID 1475190)
-- Name: tingenierialt id_tipolinea; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tingenierialt
    ADD CONSTRAINT id_tipolinea FOREIGN KEY (id_tipolinea) REFERENCES snx.ttipolinea(id_tipolinea);


--
-- TOC entry 6645 (class 2606 OID 1490717)
-- Name: tmaterialcantidadlt id_tipolinea; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaterialcantidadlt
    ADD CONSTRAINT id_tipolinea FOREIGN KEY (id_tipolinea) REFERENCES snx.ttipolinea(id_tipolinea);


--
-- TOC entry 6636 (class 2606 OID 1496546)
-- Name: tmateriallt id_tipolinea; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt
    ADD CONSTRAINT id_tipolinea FOREIGN KEY (id_tipolinea) REFERENCES snx.ttipolinea(id_tipolinea);


--
-- TOC entry 6654 (class 2606 OID 1497635)
-- Name: tmontajecantidadlt id_tipolinea; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajecantidadlt
    ADD CONSTRAINT id_tipolinea FOREIGN KEY (id_tipolinea) REFERENCES snx.ttipolinea(id_tipolinea);


--
-- TOC entry 6683 (class 2606 OID 1502315)
-- Name: tobracivilcantidadlt id_tipolinea; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivilcantidadlt
    ADD CONSTRAINT id_tipolinea FOREIGN KEY (id_tipolinea) REFERENCES snx.ttipolinea(id_tipolinea);


--
-- TOC entry 6668 (class 2606 OID 1507598)
-- Name: tunidadconstructivalt id_tipolinea; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivalt
    ADD CONSTRAINT id_tipolinea FOREIGN KEY (id_tipolinea) REFERENCES snx.ttipolinea(id_tipolinea);


--
-- TOC entry 6597 (class 2606 OID 9459866)
-- Name: tmaquinaria id_tipopreciomaquinaria; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinaria
    ADD CONSTRAINT id_tipopreciomaquinaria FOREIGN KEY (id_tipopreciomaquinaria) REFERENCES snx.ttipopreciomaquinaria(id_tipopreciomaquinaria);


--
-- TOC entry 6607 (class 2606 OID 1515355)
-- Name: tunidadconstructivasb id_ubicacion; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb
    ADD CONSTRAINT id_ubicacion FOREIGN KEY (id_ubicacion) REFERENCES snx.tubicacion(id_ubicacion);


--
-- TOC entry 6686 (class 2606 OID 1507523)
-- Name: tucedifsubgrupo id_ucedifgrupo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifsubgrupo
    ADD CONSTRAINT id_ucedifgrupo FOREIGN KEY (id_ucedifgrupo) REFERENCES snx.tucedifgrupo(id_ucedifgrupo);


--
-- TOC entry 6688 (class 2606 OID 1507512)
-- Name: tucedifobracivil id_ucedifsubgrupo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifobracivil
    ADD CONSTRAINT id_ucedifsubgrupo FOREIGN KEY (id_ucedifsubgrupo) REFERENCES snx.tucedifsubgrupo(id_ucedifsubgrupo);


--
-- TOC entry 6692 (class 2606 OID 1507543)
-- Name: tucmoobracivil id_ucmogrupo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmoobracivil
    ADD CONSTRAINT id_ucmogrupo FOREIGN KEY (id_ucmogrupo) REFERENCES snx.tucmogrupo(id_ucmogrupo);


--
-- TOC entry 6670 (class 2606 OID 1474565)
-- Name: tindiceslt id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tindiceslt
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6703 (class 2606 OID 1475205)
-- Name: tmanoobramoe id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmanoobramoe
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6702 (class 2606 OID 1475542)
-- Name: tmaquinariamoe id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaquinariamoe
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6639 (class 2606 OID 1496531)
-- Name: tmateriallt id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriallt
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6701 (class 2606 OID 1496552)
-- Name: tmaterialmoe id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmaterialmoe
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6633 (class 2606 OID 1497858)
-- Name: tmontajelt id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tmontajelt
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6623 (class 2606 OID 1498017)
-- Name: tobracivil id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivil
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6673 (class 2606 OID 1503012)
-- Name: tobracivillt id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tobracivillt
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6689 (class 2606 OID 1503732)
-- Name: tobracivilmoe id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobracivilmoe
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6697 (class 2606 OID 1507487)
-- Name: ttarifassb id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.ttarifassb
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6710 (class 2606 OID 1507533)
-- Name: tucltmaestraitem id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucltmaestraitem
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6720 (class 2606 OID 3661165)
-- Name: tunidadconstructivaseraux id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaseraux
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6721 (class 2606 OID 3661217)
-- Name: tunidadconstructivacomun id_unidad; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivacomun
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES snx.tunidad(id_unidad);


--
-- TOC entry 6685 (class 2606 OID 1507497)
-- Name: tucedifgrupo id_unidadconstructivaedif; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucedifgrupo
    ADD CONSTRAINT id_unidadconstructivaedif FOREIGN KEY (id_unidadconstructivaedif) REFERENCES snx.tunidadconstructivaedif(id_unidadconstructivaedif);


--
-- TOC entry 6722 (class 2606 OID 10859000)
-- Name: tunidadconstructivatablerocp id_unidadconstructivaenctablerocp; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivatablerocp
    ADD CONSTRAINT id_unidadconstructivaenctablerocp FOREIGN KEY (id_unidadconstructivaenctablerocp) REFERENCES snx.tunidadconstructivaenctablerocp(id_unidadconstructivaenctablerocp);


--
-- TOC entry 6698 (class 2606 OID 1475200)
-- Name: tingenierialt id_unidadconstructivalt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tingenierialt
    ADD CONSTRAINT id_unidadconstructivalt FOREIGN KEY (id_unidadconstructivalt) REFERENCES snx.tunidadconstructivalt(id_unidadconstructivalt);


--
-- TOC entry 6716 (class 2606 OID 1515315)
-- Name: tunidadconstructivalteqmate id_unidadconstructivalt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivalteqmate
    ADD CONSTRAINT id_unidadconstructivalt FOREIGN KEY (id_unidadconstructivalt) REFERENCES snx.tunidadconstructivalt(id_unidadconstructivalt);


--
-- TOC entry 6718 (class 2606 OID 1515340)
-- Name: tunidadconstructivaltmontaje id_unidadconstructivalt; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tunidadconstructivaltmontaje
    ADD CONSTRAINT id_unidadconstructivalt FOREIGN KEY (id_unidadconstructivalt) REFERENCES snx.tunidadconstructivalt(id_unidadconstructivalt);


--
-- TOC entry 6690 (class 2606 OID 1507538)
-- Name: tucmogrupo id_unidadconstructivamo; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tucmogrupo
    ADD CONSTRAINT id_unidadconstructivamo FOREIGN KEY (id_unidadconstructivamo) REFERENCES snx.tunidadconstructivamo(id_unidadconstructivamo);


--
-- TOC entry 6629 (class 2606 OID 1493062)
-- Name: tmateriales id_unidadconstructivasb; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmateriales
    ADD CONSTRAINT id_unidadconstructivasb FOREIGN KEY (id_unidadconstructivasb) REFERENCES snx.tunidadconstructivasb(id_unidadconstructivasb);


--
-- TOC entry 6631 (class 2606 OID 1502787)
-- Name: tobraciviles id_unidadconstructivasb; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tobraciviles
    ADD CONSTRAINT id_unidadconstructivasb FOREIGN KEY (id_unidadconstructivasb) REFERENCES snx.tunidadconstructivasb(id_unidadconstructivasb);


--
-- TOC entry 6622 (class 2606 OID 1507553)
-- Name: tucsbequipo id_unidadconstructivasb; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbequipo
    ADD CONSTRAINT id_unidadconstructivasb FOREIGN KEY (id_unidadconstructivasb) REFERENCES snx.tunidadconstructivasb(id_unidadconstructivasb);


--
-- TOC entry 6620 (class 2606 OID 1507563)
-- Name: tucsbmaquinaria id_unidadconstructivasb; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_admin
--

ALTER TABLE ONLY snx.tucsbmaquinaria
    ADD CONSTRAINT id_unidadconstructivasb FOREIGN KEY (id_unidadconstructivasb) REFERENCES snx.tunidadconstructivasb(id_unidadconstructivasb);


--
-- TOC entry 6605 (class 2606 OID 1515365)
-- Name: tunidadconstructivasb id_unidadconstructivasb; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivasb
    ADD CONSTRAINT id_unidadconstructivasb FOREIGN KEY (id_unidadconstructivasb) REFERENCES snx.tunidadconstructivasb(id_unidadconstructivasb);


--
-- TOC entry 6600 (class 2606 OID 1483799)
-- Name: tmaquinariaprecio tmaquinariaprecio_id_moneda_fkey; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tmaquinariaprecio
    ADD CONSTRAINT tmaquinariaprecio_id_moneda_fkey FOREIGN KEY (id_moneda) REFERENCES snx.tmoneda(id_moneda);


--
-- TOC entry 6719 (class 2606 OID 10287650)
-- Name: tunidadconstructivaseraux unidadconstructivaencseraux; Type: FK CONSTRAINT; Schema: snx; Owner: dbkerp_conexion
--

ALTER TABLE ONLY snx.tunidadconstructivaseraux
    ADD CONSTRAINT unidadconstructivaencseraux FOREIGN KEY (unidadconstructivaencseraux) REFERENCES snx.tunidadconstructivaencseraux(unidadconstructivaencseraux);



/***********************************F-SCP-JYP-CMS-1-18/01/2019****************************************/


/***********************************I-SCP-JYP-CMS-1-15/02/2019****************************************/
--Se crean las tablas
CREATE TABLE snx.tbancoductos
(
    id_bancoductos serial NOT NULL PRIMARY KEY,
    bancoductos character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;

CREATE TABLE snx.tcajaempalme
(   
    id_cajaempalme serial NOT NULL PRIMARY KEY,
    cajaempalme character varying(100)
)
INHERITS (pxp.tbase)
WITHOUT OIDS;	
	
--Se llenan con sus valores
insert into snx.tbancoductos (bancoductos, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('No Aplica', 'activo', null, 1, now(), null, null, null);
insert into snx.tbancoductos (bancoductos, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('Banco de ductos  0,8 m', 'activo', null, 1, now(), null, null, null);
insert into snx.tbancoductos (bancoductos, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('Banco de ductos  1,1 m', 'activo', null, 1, now(), null, null, null);
insert into snx.tbancoductos (bancoductos, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('Banco de ductos  0,5 m', 'activo', null, 1, now(), null, null, null);

insert into snx.tcajaempalme (cajaempalme, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('No Aplica', 'activo', null, 1, now(), null, null, null);
insert into snx.tcajaempalme (cajaempalme, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('Caja de empalme 1,02 m', 'activo', null, 1, now(), null, null, null);
insert into snx.tcajaempalme (cajaempalme, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('Caja de empalme 1,22 m', 'activo', null, 1, now(), null, null, null);
insert into snx.tcajaempalme (cajaempalme, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('Caja de empalme 0,72 m', 'activo', null, 1, now(), null, null, null);
insert into snx.tcajaempalme (cajaempalme, estado_reg, id_usuario_ai, id_usuario_reg, fecha_reg, usuario_ai, fecha_mod, id_usuario_mod) values ('Caja de empalme 1,32 m', 'activo', null, 1, now(), null, null, null);	

--Se crean columnas y se inician valores
ALTER TABLE snx.tobracivilcantidadlt
ADD COLUMN id_bancoductos INTEGER,
ADD COLUMN id_cajaempalme INTEGER;

UPDATE	snx.tobracivilcantidadlt
SET		id_bancoductos=1, id_cajaempalme=1;

--Se crea relación
ALTER TABLE snx.tobracivilcantidadlt
ADD CONSTRAINT fk_id_bancoductos FOREIGN KEY (id_bancoductos) REFERENCES snx.tbancoductos(id_bancoductos);

ALTER TABLE snx.tobracivilcantidadlt
ADD CONSTRAINT fk_id_cajaempalme FOREIGN KEY (id_cajaempalme) REFERENCES snx.tcajaempalme(id_cajaempalme);

	
/***********************************F-SCP-JYP-CMS-1-15/02/2019****************************************/