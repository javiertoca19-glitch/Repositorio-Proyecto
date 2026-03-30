// Lógica de autenticación
function login(email, password) {
    if (email === "admin@gastro.com" && password === "1234") {
        return "Usuario autenticado";
    } else {
        return "Error en autenticación";
    }
}

module.exports = { login };