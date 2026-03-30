// Middleware de manejo de errores
function errorMiddleware(err, req, res, next) {
    console.error(err);
    res.status(500).send("Error en el servidor");
}

module.exports = errorMiddleware;