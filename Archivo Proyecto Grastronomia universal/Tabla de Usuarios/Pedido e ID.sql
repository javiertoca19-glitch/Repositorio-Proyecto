SELECT p.id AS pedido_id, u.nombre AS cliente, dp.tipo_producto, 
       CASE dp.tipo_producto
         WHEN 'plato' THEN (SELECT nombre FROM platos WHERE id = dp.producto_id)
         WHEN 'bebida' THEN (SELECT nombre FROM bebidas WHERE id = dp.producto_id)
         WHEN 'postre' THEN (SELECT nombre FROM postres WHERE id = dp.producto_id)
       END AS producto,
       dp.cantidad, dp.subtotal, p.total, p.estado
FROM pedidos p
JOIN usuarios u ON p.usuario_id = u.id
JOIN detalle_pedido dp ON p.id = dp.pedido_id
WHERE p.estado = 'Pendiente' AND p.usuario_id = 1;
