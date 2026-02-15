const pedidoService = require("../services/pedidoService");

// POST /api/pedidos
const crearPedido = (req, res) => {
  const { idUsuario, productos } = req.body;

  const resultado = pedidoService.crearPedido(idUsuario, productos);

  if (resultado.error) {
    return res.status(resultado.status).json({
      mensaje: resultado.error
    });
  }

  res.status(201).json({
    mensaje: "Pedido creado correctamente",
    pedido: resultado.pedido
  });
};

// GET /api/pedidos
const obtenerPedidos = (req, res) => {
  const pedidos = pedidoService.obtenerPedidos();
  res.json(pedidos);
};

module.exports = {
  crearPedido,
  obtenerPedidos
};
