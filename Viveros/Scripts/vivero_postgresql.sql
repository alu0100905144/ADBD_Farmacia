sudo -u postgres psql

CREATE DATABASE viveros;
\c viveros;

CREATE TABLE IF NOT EXISTS vivero (
  coordenadas VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (coordenadas));

CREATE TABLE IF NOT EXISTS zona (
  nombre VARCHAR(45) NOT NULL,
  coordenadas_v VARCHAR(45) NOT NULL,
  productividad INT NULL,
  PRIMARY KEY (nombre, coordenadas_v),
  CONSTRAINT fk_zona_vivero
    FOREIGN KEY (coordenadas_v)
    REFERENCES vivero (coordenadas)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

  CREATE INDEX fk_zona_vivero_idx ON zona (coordenadas_v ASC);

CREATE TABLE IF NOT EXISTS producto (
  codigo INT NOT NULL,
  stock INT NOT NULL,
  precio DECIMAL NOT NULL,
  PRIMARY KEY (codigo));

CREATE TABLE IF NOT EXISTS empleado (
  dni VARCHAR(20) NOT NULL,
  Fecha_ini DATE NOT NULL,
  css VARCHAR(40) NOT NULL,
  sueldo DECIMAL NOT NULL,
  nombre_z VARCHAR(45) NOT NULL,
  coordenadas_v VARCHAR(45) NOT NULL,
  ventas INT NULL,
  fecha_fin DATE NULL,
  PRIMARY KEY (dni, Fecha_ini),
  CONSTRAINT Zona
    FOREIGN KEY (nombre_z , coordenadas_v)
    REFERENCES zona (nombre , coordenadas_v)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

  CREATE INDEX Empleado_Zona_idx ON empleado (nombre_z ASC, coordenadas_v ASC);
  CREATE UNIQUE INDEX css_UNIQUE ON empleado (css ASC);

CREATE TABLE IF NOT EXISTS cliente (
  dni VARCHAR(20) NOT NULL,
  cod_cliente INT NOT NULL,
  total_mensual INT NOT NULL,
  bonificacion INT NULL,
  PRIMARY KEY (dni));

CREATE TABLE IF NOT EXISTS cliente_producto (
  dni_cliente VARCHAR(20) NOT NULL,
  fecha TIMESTAMP NOT NULL,
  codigo INT NOT NULL,
  dni_empleado VARCHAR(45) NOT NULL,
  fecha_ini_empleado DATE NOT NULL,
  PRIMARY KEY (dni_cliente, fecha),
  CONSTRAINT fk_cliente
    FOREIGN KEY (dni_cliente)
    REFERENCES cliente (dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_producto
    FOREIGN KEY (codigo)
    REFERENCES producto (codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_empleado
    FOREIGN KEY (dni_empleado , fecha_ini_empleado)
    REFERENCES empleado (dni , Fecha_ini)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

  CREATE INDEX fk_cliente_producto_producto_idx ON cliente_producto(codigo ASC);
  CREATE INDEX fk_cliente_producto_empleado_idx ON cliente_producto(dni_empleado ASC, fecha_ini_empleado ASC);

INSERT INTO vivero (coordenadas, nombre) VALUES ('(2,2)', 'Guamasa');
INSERT INTO vivero (coordenadas, nombre) VALUES ('(1,2)', 'Santa Cruz');
INSERT INTO vivero (coordenadas, nombre) VALUES ('(1,1)', 'La Laguna');
INSERT INTO vivero (coordenadas, nombre) VALUES ('(3,3)', 'Tacoronte');

INSERT INTO zona (nombre, coordenadas_v, productividad) VALUES ('exterior', '(1,1)', null);
INSERT INTO zona (nombre, coordenadas_v, productividad) VALUES ('interior', '(1,1)', null);
INSERT INTO zona (nombre, coordenadas_v, productividad) VALUES ('exterior', '(3,3)', null);
INSERT INTO zona (nombre, coordenadas_v, productividad) VALUES ('interior', '(3,3)', null);

INSERT INTO producto (codigo, stock, precio) VALUES (1, 20, 27.56);
INSERT INTO producto (codigo, stock, precio) VALUES (2, 40, 12.8);
INSERT INTO producto (codigo, stock, precio) VALUES (3, 6, 3.99);

INSERT INTO empleado (dni, Fecha_ini, css, sueldo, nombre_z, coordenadas_v, ventas, fecha_fin) VALUES ('515', '1/1/2017', '123', 1000, 'exterior', '(3,3)', 45, '1/1/2018');
INSERT INTO empleado (dni, Fecha_ini, css, sueldo, nombre_z, coordenadas_v, ventas, fecha_fin) VALUES ('516', '1/6/2017', '124', 1000, 'interior', '(3,3)', 13, '31/12/2018');
INSERT INTO empleado (dni, Fecha_ini, css, sueldo, nombre_z, coordenadas_v, ventas, fecha_fin) VALUES ('517', '1/2/2018', '125', 1000, 'interior', '(1,1)', 46, '1/8/2018');

INSERT INTO cliente (dni, cod_cliente, total_mensual, bonificacion) VALUES ('511', 11, 25.13, NULL);
INSERT INTO cliente (dni, cod_cliente, total_mensual, bonificacion) VALUES ('512', 12, 12.45, NULL);
INSERT INTO cliente (dni, cod_cliente, total_mensual, bonificacion)  VALUES ('513', 13, 2.00, NULL);

INSERT INTO `mydb`.`producto_zona` (`codigo`, `coordenadas_v`, `nombre_z`) VALUES (1, '(3,3)', 'interior');
INSERT INTO `mydb`.`producto_zona` (`codigo`, `coordenadas_v`, `nombre_z`) VALUES (1, '(3,3)', 'exterior');















