create database oriana;
use oriana;
-----------------------------------------------------------------------------------------
create table tipo_energia(
	id_tipo_energia int primary key auto_increment,
	tipo varchar(100),
	nombre_tipo_energia varchar(100)
);
-------------------------------------------------------------------
CREATE TABLE Proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) not null,
    descripcion varchar(255) not null,
    id_tipo_energia int,
    ubicacion varchar(255) not null,
    fecha_inicio DATE default null,
    fecha_fin DATE default null,
    FOREIGN KEY (id_tipo_energia) REFERENCES tipo_energia(id_tipo_energia)
);
---------------------------------------------------------------------------------
CREATE TABLE Minerales (
id_mineral INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
descripcion varchar(255) not null,
ubicacion varchar(255) not null,
id_proyecto int,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto (id_proyecto)
);
--------------------------------------------------------------------------------------
CREATE TABLE Investigadores (
id_investigador INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
especialidad VARCHAR(100),
id_proyecto INT,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto (id_proyecto)
);
----------------------------------------------------
CREATE TABLE Inversiones (
id_inversion INT AUTO_INCREMENT PRIMARY KEY,
id_proyecto INT,
monto real not null,
fuente varchar(255) not null,
fecha_inversion DATE,
descripcion date default null,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);
--------------------------------------------------------------------------------
CREATE TABLE Estudios (
id_estudio INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(255) not null,
descripcion varchar(255) not null,
fecha_estudio DATE default null,
id_proyecto INT,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto (id_proyecto)
);
---------------------------------------------------------------------------
CREATE TABLE Empresa (
id_empresa INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
industria varchar(255) not null,
id_proyecto INT,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto (id_proyecto)
);
----------------------------------------------------------------------
CREATE TABLE EficienciaEnergetica (
id_eficiencia INT AUTO_INCREMENT PRIMARY KEY,
id_proyecto INT,
id_tipo_energia INT,
fecha DATE default null,
kw_h_generado real not null,
costo_produccion real not null,
costo_comercializacion real not null,
tiempos_muertos int not null,
clima varchar(255) not null,
indicador_economico real not null,
indicador_sociodemografico real not null,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto (id_proyecto),
FOREIGN KEY (id_tipo_energia) REFERENCES tipo_energia (id_tipo_energia)
);
--------------------------------------------
CREATE TABLE ComunidadesEnergeticas (
id_comunidad INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100)not null,
descripcion varchar(255) not null,
ubicacion VARCHAR(100)not null,
id_proyecto int,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto (id_proyecto)
);
------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-- Inserción de datos en la tabla tipo_energia
INSERT INTO tipo_energia (tipo, nombre_tipo_energia) VALUES
('Renovable', 'Energía Solar'),
('Renovable', 'Energía Eólica'),
('Renovable', 'Energía Hidroeléctrica'),
('No Renovable', 'Energía Nuclear'),
('No Renovable', 'Energía Térmica de Carbón'),
('Renovable', 'Energía Geotérmica');

-- Inserción de datos en la tabla Proyecto
INSERT INTO Proyecto (nombre, descripcion, id_tipo_energia, ubicacion, fecha_inicio, fecha_fin) VALUES
('Parque Solar Andes', 'Generación de energía solar para la región andina', 1, 'Atacama, Chile', '2023-01-10', '2024-06-15'),
('Eólico Patagonia', 'Parque de aerogeneradores en la región patagónica', 2, 'Santa Cruz, Argentina', '2022-03-05', '2025-09-10'),
('Central Hidroeléctrica Iguazú', 'Aprovechamiento del caudal del río Iguazú para energía hidroeléctrica', 3, 'Misiones, Argentina', '2021-08-01', '2024-12-31'),
('Planta Nuclear Lima', 'Generación de energía mediante fisión nuclear', 4, 'Lima, Perú', '2020-05-20', '2026-03-30'),
('Termoeléctrica Valle', 'Generación de energía térmica usando carbón', 5, 'Bogotá, Colombia', '2021-09-15', '2024-11-20'),
('Proyecto Geotérmico Los Humeros', 'Extracción de energía geotérmica para electricidad', 6, 'Puebla, México', '2022-10-10', '2024-04-25');

-- Inserción de datos en la tabla Minerales
INSERT INTO Minerales (nombre, descripcion, ubicacion, id_proyecto)
VALUES 
('Cuarzo', 'Mineral compuesto de sílice cristalina', 'San Luis, Argentina', 1),
('Pirita', 'Mineral de sulfuro de hierro conocido como el oro de los tontos', 'Cajamarca, Perú', 2),
('Calcita', 'Mineral de carbonato de calcio, muy común en formaciones de piedra caliza', 'Yucatán, México', 3),
('Hematita', 'Mineral de óxido de hierro, importante fuente de hierro', 'Minas Gerais, Brasil', 4),
('Magnetita', 'Mineral magnético de óxido de hierro', 'Atacama, Chile', 5),
('Galena', 'Mineral de sulfuro de plomo y fuente primaria de este metal', 'Potosí, Bolivia', 6);

-- Inserción de datos en la tabla Investigadores
INSERT INTO Investigadores (nombre, apellido, especialidad, id_proyecto)
VALUES
('Ana', 'Martínez', 'Geología', 1),
('Carlos', 'Gómez', 'Mineralogía', 2),
('María', 'Rodríguez', 'Geofísica', 3),
('Jorge', 'Pérez', 'Geoquímica', 4),
('Lucía', 'Fernández', 'Ecología', 5),
('Raúl', 'Lopez', 'Paleontología', 6);

-- Inserción de datos en la tabla Inversiones
INSERT INTO Inversiones (id_proyecto, monto, fuente, fecha_inversion, descripcion)
VALUES
(1, 100000.00, 'Banco Nacional', '2023-05-15', 'Financiamiento inicial para exploración'),
(2, 250000.00, 'Inversiones Mineras S.A.', '2023-07-10', 'Expansión de operaciones en nuevas áreas'),
(3, 150000.00, 'Gobierno Federal', '2023-09-25', 'Subsidio para investigación ambiental'),
(4, 300000.00, 'Corporación Geomineral', '2023-11-12', 'Desarrollo de tecnología de extracción'),
(5, 200000.00, 'Banco de Desarrollo', '2024-01-18', 'Optimización de procesos de extracción'),
(6, 175000.00, 'Fondos Internacionales', '2024-03-05', 'Investigación de impacto ecológico');

-- Inserción de datos en la tabla Estudios
INSERT INTO Estudios (nombre, descripcion, fecha_estudio, id_proyecto)
VALUES
('Estudio de Impacto Ambiental', 'Evaluación de los efectos ambientales del proyecto', '2023-02-10', 1),
('Análisis de Viabilidad Económica', 'Estudio de rentabilidad y costos asociados', '2023-05-22', 2),
('Estudio de Mineralogía', 'Análisis detallado de la composición mineralógica', '2023-08-15', 3),
('Estudio Hidrogeológico', 'Investigación sobre recursos hídricos subterráneos', '2023-10-30', 4),
('Análisis Geotécnico', 'Evaluación de estabilidad del terreno y riesgos geológicos', '2024-01-12', 5),
('Estudio de Biodiversidad', 'Inventario de especies y evaluación de impactos en la fauna local', '2024-03-18', 6);

-- Inserción de datos en la tabla Empresa
INSERT INTO Empresa (nombre, industria, id_proyecto) VALUES
('Tech Innovations', 'Tecnología', 1),
('Green Energy Solutions', 'Energía', 2),
('HealthCare Plus', 'Salud', 3),
('Education First', 'Educación', 4),
('Finance Group', 'Finanzas', 5),
('Global Logistics', 'Logística', 6);

-- Inserción de datos en la tabla EficienciaEnergetica
INSERT INTO EficienciaEnergetica (id_proyecto, id_tipo_energia, fecha, kw_h_generado, costo_produccion, costo_comercializacion, tiempos_muertos, clima, indicador_economico, indicador_sociodemografico) VALUES
(1, 1, '2024-01-15', 500.5, 3000.75, 3500.00, 5, 'Templado', 1.2, 0.8),
(2, 2, '2024-02-20', 700.3, 4000.80, 4500.50, 8, 'Cálido', 1.5, 0.9),
(3, 1, '2024-03-18', 620.0, 2800.90, 3200.20, 3, 'Frío', 1.3, 0.7),
(4, 3, '2024-04-10', 800.9, 5000.60, 5500.75, 10, 'Húmedo', 1.6, 1.1),
(5, 2, '2024-05-25', 450.2, 2500.30, 2800.40, 2, 'Seco', 1.1, 0.6),
(6, 3, '2024-06-14', 900.4, 6000.50, 6500.90, 6, 'Templado', 1.7, 1.0);

-- Inserción de datos en la tabla ComunidadesEnergeticas
INSERT INTO ComunidadesEnergeticas (nombre, descripcion, ubicacion, id_proyecto) VALUES
('EcoVilla Solar', 'Comunidad basada en energía solar', 'Valencia', 1),
('BioBarrio Verde', 'Zona urbana con autosuficiencia energética', 'Madrid', 2),
('EcoPueblo Eólico', 'Comunidad impulsada por energía eólica', 'Barcelona', 3),
('Red Energía Verde', 'Comunidad rural con uso de biomasa', 'Sevilla', 4),
('Comunidad HidroSur', 'Zona abastecida por energía hidroeléctrica', 'Málaga', 5),
('EcoResidencia Solar', 'Viviendas con paneles solares y baterías de respaldo', 'Granada', 6);
