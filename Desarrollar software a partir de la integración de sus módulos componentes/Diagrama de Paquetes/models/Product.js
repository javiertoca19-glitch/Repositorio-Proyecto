// Modelo de producto (platos, bebidas, postres)
class Product {
    constructor(id, nombre, precio, categoria, pais) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.categoria = categoria;
        this.pais = pais;
    }
}

module.exports = Product;