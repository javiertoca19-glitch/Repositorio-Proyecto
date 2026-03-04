app.post('/api/pedidos', (req, res) => {
    const nuevoPedido = req.body;

    if (!nuevoPedido.cliente || !nuevoPedido.producto) {
        return res.status(400).json({ mensaje: "Datos incompletos" });
    }

    pedidos.push(nuevoPedido);
    res.status(201).json(nuevoPedido);
});