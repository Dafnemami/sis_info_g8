

-- IMPORTANTE:
-- Orden asignado para evitar problemas con FOREIGN KEY(s)
-- N Tablas
    -- organismospadre
    -- organismos
    -- facultadesfuncionesatribuciones
    -- pasivomunicipio
    -- tramitesanteconsejo
    -- licitacion
    -- organismo360



-- Eliminar tablas preexistentes

DROP TABLE IF EXISTS organismospadre CASCADE;
DROP TABLE IF EXISTS organismos CASCADE;
DROP TABLE IF EXISTS facultadesfuncionesatribuciones CASCADE;
DROP TABLE IF EXISTS pasivomunicipio CASCADE;
DROP TABLE IF EXISTS tramitesanteconsejo CASCADE;
DROP TABLE IF EXISTS licitacion CASCADE;
DROP TABLE IF EXISTS organismo360 CASCADE;


-- Crear Nuevas Tablas
CREATE TABLE organismospadre(
    Codigo_padre VARCHAR(10) PRIMARY KEY,
    Padre_org VARCHAR(60)
);


CREATE TABLE organismos(
    Codigo_org VARCHAR(10) PRIMARY KEY,
    Organismo VARCHAR(150)
);


CREATE TABLE facultadesfuncionesatribuciones(
    organismo_codigo CHAR(5) PRIMARY KEY,
    fecha_publicacion_ta DATE,
    unidades VARCHAR(300),
    facultades VARCHAR(2000),
    fuente_legal VARCHAR(300),
    fecha_publicacion DATE,
    enlace_publicacion VARCHAR(200), 
    fecha_modificacion DATE,
    enlace_modificacion VARCHAR(200),
    activado CHAR(2)
);


CREATE TABLE pasivomunicipio(
    organismo_codigo CHAR(5),
    fecha_publicacion DATE,
    anyo INT,
    mes VARCHAR(30),
    fecha DATE,
    descripción(60),
    activado CHAR(2),
    PRIMARY KEY(organismo_codigo),
    FOREIGN KEY organismo_codigo REFERENCES facultadesfuncionesatribuciones(organismo_codigo)
);


CREATE TABLE tramitesanteconsejo(
    organismo_codigo CHAR(5),
    fecha_publicacion_ta DATE,
    descripcion_servicio VARCHAR(500),
    requisitos_antecedentes VARCHAR(3500),
    enlace_tramites VARCHAR(200),
    tramites_etapas VARCHAR(400),
    lugar VARCHAR(400),
    enlace_infocomplementaria VARCHAR(200),
    activado CHAR(2),
    PRIMARY KEY(organismo_codigo),
    FOREIGN KEY organismo_codigo REFERENCES facultadesfuncionesatribuciones(organismo_codigo)
);


CREATE TABLE licitacion(
    numero_acto INT,
    organismo_codigo CHAR(5),
    fecha_publicacion_ta DATE,
    nombre VARCHAR(60),
    denominacion_acto VARCHAR(40),
    activado CHAR(2),
    PRIMARY KEY(numero_acto, organismo_codigo),
    FOREIGN KEY organismo_codigo REFERENCES facultadesfuncionesatribuciones(organismo_codigo)
);


CREATE TABLE organismo360(
    idOrg INT,
    Codigo_org VARCHAR(10),
    Codigo_padre VARCHAR(10),
    region VARCHAR(100),
    municipalidad VARCHAR(100),
    url_sai VARCHAR(200),
    obligadorecibir_sai CHAR(2),
    tiene_ta CHAR(2),
    PRIMARY KEY(idOrg, Codigo_org, Codigo_padre)
    FOREIGN KEY Codigo_org REFERENCES organismos,
    FOREIGN KEY Codigo_padre REFERENCES organismospadre
);
