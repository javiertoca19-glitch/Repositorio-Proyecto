UPDATE pedidos 
SET total = (SELECT SUM(subtotal) FROM detalle_pedido WHERE pedido_id = 1)
WHERE id = 1;
