-- Pagos
CREATE TABLE IF NOT EXISTS pagos (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pedido_id BIGINT UNSIGNED NOT NULL,
  usuario_id INT UNSIGNED NOT NULL,
  monto DECIMAL(12,2) NOT NULL,
  metodo ENUM('efectivo','tarjeta','saldo','online') NOT NULL,
  referencia VARCHAR(200),
  estado_pago ENUM('pendiente','completado','fallido','reembolsado') DEFAULT 'pendiente',
  fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Reseñas
CREATE TABLE IF NOT EXISTS reseñas (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT UNSIGNED NOT NULL,
  plato_id INT UNSIGNED NULL,
  pedido_id BIGINT UNSIGNED NULL,
  calificacion TINYINT UNSIGNED NOT NULL, -- 1 a 5
  comentario TEXT,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (plato_id) REFERENCES platos(id) ON DELETE SET NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE SET NULL
);
