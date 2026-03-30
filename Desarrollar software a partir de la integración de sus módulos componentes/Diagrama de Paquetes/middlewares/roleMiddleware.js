// Middleware de roles
function roleMiddleware(rol) {
    return (req, res, next) => {
        if (req.user && req.user.rol === rol) {
            next();
        } else {
            res.send("No tienes permisos");
        }
    };
}

module.exports = roleMiddleware;