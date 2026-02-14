const pedidoService = require("../services/pedidoService");

function crearPedido(req, res) {
  try {
    const { idUsuario, productos } = req.body;

    const resultado = pedidoService.crearPedido(idUsuario, productos);

    res.status(201).json(resultado);

  } catch (error) {
    res.status(error.status || 500).json({
      mensaje: error.mensaje || "Error interno del servidor"
    });
  }
}

module.exports = { crearPedido };
