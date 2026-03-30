// Modelo de carrito
class Cart {
    constructor(usuario) {
        this.usuario = usuario;
        this.productos = [];
    }

    agregarProducto(producto) {
        this.productos.push(producto);
    }
}

module.exports = Cart;