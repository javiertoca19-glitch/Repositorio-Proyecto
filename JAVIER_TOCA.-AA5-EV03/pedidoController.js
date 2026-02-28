const pedidoService = require('./pedidoService');

const crear = (req, res) => {
    const { cliente, productos, total } = req.body;

    if (!cliente || !productos || !total) {
        return res.status(400).json({
            mensaje: "Todos los campos son obligatorios"
        });
    }

    const pedido = pedidoService.crearPedido(req.body);
    res.status(201).json(pedido);
};

const listar = (req, res) => {
    res.status(200).json(pedidoService.obtenerPedidos());
};

const obtenerPorId = (req, res) => {
    const pedido = pedidoService.obtenerPedidoPorId(req.params.id);

    if (!pedido) {
        return res.status(404).json({
            mensaje: "Pedido no encontrado"
        });
    }

    res.status(200).json(pedido);
};

module.exports = {
    crear,
    listar,
    obtenerPorId
};