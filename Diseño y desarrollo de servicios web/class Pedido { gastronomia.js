class Pedido {
  constructor(id, idUsuario, productos, total, estado) {
    this.id = id;
    this.idUsuario = idUsuario;
    this.productos = productos;
    this.total = total;
    this.estado = estado;
  }
}

module.exports = Pedido;
