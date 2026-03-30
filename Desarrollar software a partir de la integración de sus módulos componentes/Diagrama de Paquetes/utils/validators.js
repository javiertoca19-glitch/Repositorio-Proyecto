// Validaciones de datos
function validarEmail(email) {
    return email.includes("@");
}

function validarPassword(password) {
    return password.length >= 4;
}

module.exports = { validarEmail, validarPassword };