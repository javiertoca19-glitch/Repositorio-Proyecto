CREATE TABLE bebidas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2) NOT NULL,
  imagen_url VARCHAR(255),
  bandera_pais VARCHAR(50)
);
