CREATE TABLE detalle_pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pedido_id INT,
  tipo_producto ENUM('plato','bebida','postre'),
  producto_id INT,
  cantidad INT DEFAULT 1,
  subtotal DECIMAL(10,2),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);
