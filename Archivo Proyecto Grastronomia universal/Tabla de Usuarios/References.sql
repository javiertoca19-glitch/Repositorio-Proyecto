-- Tabla pedidos
CREATE TABLE IF NOT EXISTS pedidos (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT UNSIGNED NOT NULL, -- cliente
  direccion_entrega_id INT UNSIGNED NULL,
  repartidor_id INT UNSIGNED NULL,
  total DECIMAL(12,2) NOT NULL,
  estado ENUM('pendiente','confirmado','en_preparacion','en_reparto','entregado','cancelado') DEFAULT 'pendiente',
  metodo_pago ENUM('efectivo','tarjeta','saldo','online') DEFAULT 'efectivo',
  nota TEXT,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (direccion_entrega_id) REFERENCES direcciones(id),
  FOREIGN KEY (repartidor_id) REFERENCES usuarios(id)
);

-- Detalle de pedidos
CREATE TABLE IF NOT EXISTS pedido_items (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pedido_id BIGINT UNSIGNED NOT NULL,
  plato_id INT UNSIGNED NOT NULL,
  nombre_plato VARCHAR(200) NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  cantidad SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  subtotal DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
  FOREIGN KEY (plato_id) REFERENCES platos(id)
);
