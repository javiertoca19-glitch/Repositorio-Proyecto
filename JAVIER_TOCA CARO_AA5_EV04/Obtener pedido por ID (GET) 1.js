app.get('/api/pedidos/:id', (req, res) => {
    const pedido = pedidos.find(p => p.id == req.params.id);

    if (pedido) {
        res.status(200).json(pedido);
    } else {
        res.status(404).json({ mensaje: "Pedido no encontrado" });
    }
});