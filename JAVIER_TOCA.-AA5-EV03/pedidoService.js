const Pedido = require('./pedidoModel');

let pedidos = [];

const crearPedido = (data) => {
    const nuevoPedido = new Pedido(
        pedidos.length + 1,
        data.cliente,
        data.productos,
        data.total
    );

    pedidos.push(nuevoPedido);
    return nuevoPedido;
};

const obtenerPedidos = () => {
    return pedidos;
};

const obtenerPedidoPorId = (id) => {
    return pedidos.find(p => p.id == id);
};

module.exports = {
    crearPedido,
    obtenerPedidos,
    obtenerPedidoPorId
};