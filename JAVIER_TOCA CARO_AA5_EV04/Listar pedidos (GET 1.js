app.get('/api/pedidos', (req, res) => {
    res.status(200).json(pedidos);
});