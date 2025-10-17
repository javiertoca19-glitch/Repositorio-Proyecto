-- Agregar un plato (Bandeja Paisa, id=1)
INSERT INTO detalle_pedido (pedido_id, tipo_producto, producto_id, cantidad, subtotal)
VALUES (1, 'plato', 1, 2, 56000);

-- Agregar una bebida (Jugo de Mango, id=5)
INSERT INTO detalle_pedido (pedido_id, tipo_producto, producto_id, cantidad, subtotal)
VALUES (1, 'bebida', 5, 1, 8000);

-- Agregar un postre (Tiramisú, id=2)
INSERT INTO detalle_pedido (pedido_id, tipo_producto, producto_id, cantidad, subtotal)
VALUES (1, 'postre', 2, 1, 15000);
