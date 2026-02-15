let pedidos = []; // Base de datos simulada

// GET todos
const obtenerPedidos = (req, res) => {
  res.json(pedidos);
};

// GET por ID
const obtenerPedidoPorId = (req, res) => {
  const pedido = pedidos.find(p => p.id == req.params.id);

  if (!pedido) {
    return res.status(404).json({ mensaje: "Pedido no encontrado" });
  }

  res.json(pedido);
};

// POST crear
const crearPedido = (req, res) => {
  const { idUsuario, productos } = req.body;

  if (!idUsuario || !productos) {
    return res.status(400).json({ mensaje: "Datos incompletos" });
  }

  const nuevoPedido = {
    id: pedidos.length + 1,
    idUsuario,
    productos,
    estado: "Pendiente"
  };

  pedidos.push(nuevoPedido);

  res.status(201).json({
    mensaje: "Pedido creado correctamente",
    pedido: nuevoPedido
  });
};

// PUT actualizar
const actualizarPedido = (req, res) => {
  const pedido = pedidos.find(p => p.id == req.params.id);

  if (!pedido) {
    return res.status(404).json({ mensaje: "Pedido no encontrado" });
  }

  pedido.estado = req.body.estado || pedido.estado;

  res.json({
    mensaje: "Pedido actualizado correctamente",
    pedido
  });
};

// DELETE eliminar
const eliminarPedido = (req, res) => {
  const index = pedidos.findIndex(p => p.id == req.params.id);

  if (index === -1) {
    return res.status(404).json({ mensaje: "Pedido no encontrado" });
  }

  pedidos.splice(index, 1);

  res.json({ mensaje: "Pedido eliminado correctamente" });
};

module.exports = {
  obtenerPedidos,
  obtenerPedidoPorId,
  crearPedido,
  actualizarPedido,
  eliminarPedido
};
