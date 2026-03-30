// Lógica de pagos
function procesarPago(total, saldo) {
    if (saldo >= total) {
        return "Pago aprobado";
    } else {
        return "Saldo insuficiente";
    }
}

module.exports = { procesarPago };