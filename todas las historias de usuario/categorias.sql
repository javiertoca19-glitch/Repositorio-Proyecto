-- Categorías de platos
CREATE TABLE IF NOT EXISTS categorias (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE,
  descripcion VARCHAR(255),
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Platos
CREATE TABLE IF NOT EXISTS platos (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(200) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2) NOT NULL,
  disponible TINYINT(1) NOT NULL DEFAULT 1,
  imagen_url VARCHAR(500),
  categoria_id INT UNSIGNED,
  tiempo_preparacion_min SMALLINT UNSIGNED DEFAULT 15,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE SET NULL
);

-- Datos iniciales
INSERT IGNORE INTO categorias (id, nombre, descripcion) VALUES
  (1, 'Entradas', 'Aperitivos'),
  (2, 'Platos Fuertes', 'Platos principales'),
  (3, 'Postres', 'Dulces y postres');

INSERT IGNORE INTO platos (id, nombre, descripcion, precio, disponible, categoria_id)
VALUES
  (1, 'Ajiaco colombiano', 'Sopa típica con pollo y papas', 22000, 1, 2),
  (2, 'Arepa con queso', 'Arepa caliente con queso', 8000, 1, 1),
  (3, 'Postre de mil hojas', 'Dulce tradicional', 12000, 1, 3);
