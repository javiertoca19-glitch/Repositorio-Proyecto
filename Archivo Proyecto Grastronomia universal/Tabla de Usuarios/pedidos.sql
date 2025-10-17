CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  estado ENUM('Pendiente', 'En preparación', 'Entregado') DEFAULT 'Pendiente',
  total DECIMAL(10,2),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
