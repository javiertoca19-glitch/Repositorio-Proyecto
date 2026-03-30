// Modelo de usuario
class User {
    constructor(id, nombre, email, rol) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.rol = rol; // cliente o administrador
    }
}

module.exports = User;