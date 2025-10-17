// models/usuario.js

class Usuario {
  constructor(id, nombre, apellido, correo, telefono, direccion, tipo, contraseña, saldo) {
    this.id = id;
    this.nombre = nombre;
    this.apellido = apellido;
    this.correo = correo;
    this.telefono = telefono;
    this.direccion = direccion;
    this.tipo = tipo; // Cliente, Administrador, Repartidor
    this.contraseña = contraseña; // En producción debería ir cifrada
    this.saldo = saldo; // Saldo en pesos colombianos
  }
}

module.exports = Usuario;
