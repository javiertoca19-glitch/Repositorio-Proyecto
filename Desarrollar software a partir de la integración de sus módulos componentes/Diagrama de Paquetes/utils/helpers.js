// Funciones auxiliares generales
function calcularTotal(productos) {
    return productos.reduce((total, p) => total + p.precio, 0);
}

module.exports = { calcularTotal };