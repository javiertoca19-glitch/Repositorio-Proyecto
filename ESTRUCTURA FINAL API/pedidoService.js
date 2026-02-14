const usuarios = require("../models/usuarioModel");
const productos = require("../models/productoModel");
const pedidoData = require("../models/pedidoModel");

function crearPedido(idUsuario, listaProductos) {

  if (!idUsuario || !listaProductos || listaProductos.length === 0) {
    throw { status: 400, mensaje: "Datos inválidos" };
  }

  const usuarioExiste = usuarios.find(u => u.id === idUsuario);
  if (!usuarioExiste) {
    throw { status: 404, mensaje: "Usuario no encontrado" };
  }

  let total = 0;

  for (let item of listaProductos) {
    const productoBD = productos.find(p => p.id === item.idProducto);

    if (!productoBD) {
      throw { status: 404, mensaje: `Producto ${item.idProducto} no existe` };
    }

    total += productoBD.precio * item.cantidad;
  }

  const nuevoPedido = {
    idPedido: pedidoData.contadorPedidos++,
    idUsuario,
    productos: listaProductos,
    total,
    fecha: new Date(),
    estado: "Pendiente"
  };

  pedidoData.pedidos.push(nuevoPedido);

  return { mensaje: "Pedido creado correctamente", total };
}

module.exports = { crearPedido };
