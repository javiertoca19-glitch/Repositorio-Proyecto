// Formateo de datos
function formatearPrecio(precio) {
    return "$" + precio.toLocaleString();
}

module.exports = { formatearPrecio };