app.delete('/api/pedidos/:id', (req, res) => {
    const index = pedidos.findIndex(p => p.id == req.params.id);

    if (index === -1) {
        return res.status(404).json({ mensaje: "Pedido no encontrado" });
    }

    pedidos.splice(index, 1);
    res.status(204).send();
});