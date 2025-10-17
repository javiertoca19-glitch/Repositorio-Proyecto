CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  correo VARCHAR(150) NOT NULL UNIQUE,
  telefono VARCHAR(20),
  direccion VARCHAR(200),
  tipo ENUM('Cliente','Administrador','Empleado') DEFAULT 'Cliente',
  saldo DECIMAL(10,2) DEFAULT 0
);
