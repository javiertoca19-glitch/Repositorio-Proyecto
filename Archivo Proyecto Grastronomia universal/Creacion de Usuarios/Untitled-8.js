// models/usuario.js
const mongoose = require("mongoose");

const usuarioSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  apellido: { type: String, required: true },
  correo: { type: String, required: true, unique: true },
  telefono: { type: String, required: true },
  direccion: { type: String, required: true },
  tipo: { 
    type: String, 
    enum: ["Cliente", "Administrador", "Repartidor"], 
    default: "Cliente" 
  },
  contraseña: { type: String, required: true }, // se recomienda cifrado con bcrypt
  saldo: { type: Number, default: 0 }
}, { timestamps: true });

module.exports = mongoose.model("Usuario", usuarioSchema);
