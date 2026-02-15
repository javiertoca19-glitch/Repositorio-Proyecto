const pedidoService = require("../services/pedidoService");

const crearPedido = (req, res) => {
  const { idUsuario, productos } = req.body;

  const resultado = pedidoService.crearPedido(idUsuario, productos);

  if (resultado.error) {
    return res.status(resultado.status).json({
      mensaje: resultado.error
    });
  }

  return res.status(201).json({
    mensaje: "Pedido creado correctamente",
    pedido: resultado.pedido
  });
};

module.exports = {
  crearPedido
};
