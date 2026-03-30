app.put('/api/pedidos/:id', (req, res) => {
    const pedido = pedidos.find(p => p.id == req.params.id);

    if (!pedido) {
        return res.status(404).json({ mensaje: "Pedido no encontrado" });
    }

    pedido.cliente = req.body.cliente;
    pedido.producto = req.body.producto;
    pedido.cantidad = req.body.cantidad;

    res.status(200).json(pedido);
});