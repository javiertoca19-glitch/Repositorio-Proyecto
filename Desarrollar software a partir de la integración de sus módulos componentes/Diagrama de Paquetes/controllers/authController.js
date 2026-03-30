// Controlador de autenticación
exports.login = (req, res) => {
    const { email, password } = req.body;

    if (email === "admin@gastro.com" && password === "1234") {
        res.send("Inicio de sesión exitoso");
    } else {
        res.send("Credenciales incorrectas");
    }
};