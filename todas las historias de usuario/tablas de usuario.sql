-- Crear base de datos
CREATE DATABASE IF NOT EXISTS gastronomia_universal;
USE gastronomia_universal;

-- Crear tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  correo VARCHAR(100) UNIQUE NOT NULL,
  contrasena VARCHAR(100) NOT NULL
);

-- Insertar usuarios de ejemplo con correos @gmail.com y contraseñas diferentes
INSERT INTO usuarios (nombre, apellido, correo, contrasena) VALUES
('Martha Patricia', 'Toca', 'martha.p.toca@gmail.com', 'Martha2025!'),
('Liliana Patricia', 'Toca', 'liliana.p.toca@gmail.com', 'Lili2025#'),
('Javier Alejandro', 'Toca Caro', 'javier.a.toca@gmail.com', 'JaviAlejo_25'),
('Carlos Andrés', 'González', 'carlos.gonzalez@gmail.com', 'Carlos_123'),
('Laura Sofía', 'Martínez', 'laura.s.martinez@gmail.com', 'LauraSofi*25'),
('Andrés Felipe', 'Ramírez', 'andres.ramirez@gmail.com', 'AndresF2025$');
