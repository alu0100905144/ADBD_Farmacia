sudo -u postgres psql

CREATE DATABASE tajinaste;

\c tajinaste
You are now connected to database "tajinaste" as user "postgres".

CREATE TABLE IF NOT EXISTS laboratorio (
  codigo_lab INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  teléfono VARCHAR(45) NOT NULL,
  dirección VARCHAR(45) NOT NULL,
  responsable VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo_lab));

CREATE TABLE IF NOT EXISTS medicamento (
  codigo_med INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  receta INT NOT NULL,
  ud_stock INT NOT NULL,
  ud_vendidas INT NOT NULL,
  precio DECIMAL NOT NULL,
  PRIMARY KEY (codigo_med));

CREATE TABLE IF NOT EXISTS laboratorio_fabrica_medicamento (
  codigo_lab INT NOT NULL,
  codigo_med INT NOT NULL,
  PRIMARY KEY (codigo_lab, codigo_med),
  CONSTRAINT fk_laboratorio
    FOREIGN KEY (codigo_lab)
    REFERENCES laboratorio (codigo_lab)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_medicamento
    FOREIGN KEY (codigo_med)
    REFERENCES medicamento (codigo_med)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE INDEX fk_medicamento_idx ON laboratorio_fabrica_medicamento (codigo_med ASC);

CREATE TABLE IF NOT EXISTS familia (
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (nombre));

CREATE TABLE IF NOT EXISTS familia_medicamento (
  nombre_familia VARCHAR(45) NOT NULL,
  codigo_med INT NOT NULL,
  PRIMARY KEY (nombre_familia, codigo_med),

  CONSTRAINT fk_familia
    FOREIGN KEY (nombre_familia)
    REFERENCES familia (nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_medicamento
    FOREIGN KEY (codigo_med)
    REFERENCES medicamento (codigo_med)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

 CREATE INDEX fk_medicamento_idx_familia ON familia_medicamento(codigo_med ASC);

CREATE TABLE IF NOT EXISTS cliente_convencional (
  dni VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (dni));

CREATE TABLE IF NOT EXISTS cliente_conv_compra (
  dni_cliente VARCHAR(45) NOT NULL,
  fecha_compra TIMESTAMP NOT NULL,
  codigo_med INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (dni_cliente, fecha_compra, codigo_med),
  CONSTRAINT fk_medicamento
    FOREIGN KEY (codigo_med)
    REFERENCES medicamento (codigo_med)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_cliente_conv
    FOREIGN KEY (dni_cliente)
    REFERENCES cliente_convencional (dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

 CREATE INDEX fk_medicamento_idx_cliente_conv_compra ON cliente_conv_compra (codigo_med ASC);

CREATE TABLE IF NOT EXISTS cliente_credito (
  dni VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  cuenta_banco VARCHAR(45) NOT NULL,
  PRIMARY KEY (dni));

CREATE TABLE IF NOT EXISTS cliente_cred_compra (
  dni_cliente VARCHAR(45) NOT NULL,
  codigo_med INT NOT NULL,
  fecha_compra TIMESTAMP NOT NULL,
  fecha_pago TIMESTAMP NULL,
  cantidad VARCHAR(45) NOT NULL,
  PRIMARY KEY (dni_cliente, codigo_med, fecha_compra),
  CONSTRAINT fk_medicamento
    FOREIGN KEY (codigo_med)
    REFERENCES medicamento (codigo_med)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_cliente_cred
    FOREIGN KEY (dni_cliente)
    REFERENCES cliente_credito (dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

 CREATE INDEX fk_medicamento_idx_cliente_cred_compra ON cliente_cred_compra (codigo_med ASC);

INSERT INTO laboratorio (codigo_lab, nombre, teléfono, dirección, responsable) VALUES (1, 'Labo La Laguna', '922112233', 'Calle Laguna ,1', 'Maria López');

INSERT INTO laboratorio (codigo_lab, nombre, teléfono, dirección, responsable) VALUES (1, 'Labo La Laguna', '922112233', 'Calle Laguna ,1', 'Maria López');

INSERT INTO medicamento (codigo_med, nombre, tipo, receta, ud_stock, ud_vendidas, precio) VALUES (1, 'ibuprofeno', 'pastilla', 0, 56, 2, 5.20);

INSERT INTO medicamento (codigo_med, nombre, tipo, receta, ud_stock, ud_vendidas, precio) VALUES (2, 'paracetamol', 'pastilla', 0, 32, 20, 6.00);

INSERT INTO laboratorio_fabrica_medicamento (codigo_lab, codigo_med) VALUES (1, 1);
INSERT INTO laboratorio_fabrica_medicamento (codigo_lab, codigo_med) VALUES (2, 1);
INSERT INTO laboratorio_fabrica_medicamento (codigo_lab, codigo_med) VALUES (1, 2);



