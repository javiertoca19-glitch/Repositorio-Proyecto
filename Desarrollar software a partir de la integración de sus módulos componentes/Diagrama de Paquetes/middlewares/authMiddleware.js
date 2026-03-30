// Middleware de autenticación
function authMiddleware(req, res, next) {
    const autorizado = true; // Simulación

    if (autorizado) {
        next(); // continúa al controlador
    } else {
        res.send("Acceso denegado");
    }
}

module.exports = authMiddleware;