// Modelo de pedido
class Order {
    constructor(id, usuario, productos, total) {
        this.id = id;
        this.usuario = usuario;
        this.productos = productos;
        this.total = total;
    }
}

module.exports = Order;