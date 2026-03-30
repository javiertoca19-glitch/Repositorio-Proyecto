// Lógica de inventario
let inventario = {
    pizza: 10,
    hamburguesa: 5
};

function actualizarStock(producto) {
    if (inventario[producto] > 0) {
        inventario[producto]--;
        return "Stock actualizado";
    } else {
        return "Producto agotado";
    }
}

module.exports = { actualizarStock };