class Pedido {
    constructor(id, cliente, productos, total, estado = "pendiente") {
        this.id = id;
        this.cliente = cliente;
        this.productos = productos;
        this.total = total;
        this.estado = estado;
    }
}

module.exports = Pedido;