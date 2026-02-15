const Pedido = require("../models/pedidoModel");

let pedidos = [];
let contadorId = 1;

// Crear pedido
const crearPedido = (idUsuario, productos) => {
  if (!idUsuario || !productos || productos.length === 0) {
    return { error: "Datos incompletos", status: 400 };
  }

  // Calcular total (simulado)
  let total = 0;
  productos.forEach(p => {
    total += p.cantidad * 10000; // Precio simulado
  });

  const nuevoPedido = new Pedido(
    contadorId++,
    idUsuario,
    productos,
    total,
    "Pendiente"
  );

  pedidos.push(nuevoPedido);

  return { pedido: nuevoPedido };
};

// Obtener todos
const obtenerPedidos = () => pedidos;

module.exports = {
  crearPedido,
  obtenerPedidos
};
