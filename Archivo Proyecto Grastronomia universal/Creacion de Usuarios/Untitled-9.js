const db = require('../database');

// ✅ Crear usuario
exports.crearUsuario = (req, res) => {
  const { nombre, apellido, correo, telefono, direccion, tipo, contraseña, saldo } = req.body;
  const sql = `
    INSERT INTO usuarios (nombre, apellido, correo, telefono, direccion, tipo, contraseña, saldo) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `;
  db.query(sql, [nombre, apellido, correo, telefono, direccion, tipo, contraseña, saldo], (err, result) => {
    if (err) {
      console.error("Error al crear usuario:", err);
      res.status(500).send({ error: "Error al crear usuario" });
      return;
    }
    res.send({ message: "✅ Usuario creado con éxito", id: result.insertId });
  });
};

// ✅ Listar todos los usuarios
exports.listarUsuarios = (req, res) => {
  const sql = "SELECT * FROM usuarios";
  db.query(sql, (err, results) => {
    if (err) {
      console.error("Error al listar usuarios:", err);
      res.status(500).send({ error: "Error al obtener usuarios" });
      return;
    }
    res.send(results);
  });
};

// ✅ Consultar un usuario por ID
exports.obtenerUsuario = (req, res) => {
  const { id } = req.params;
  const sql = "SELECT * FROM usuarios WHERE id = ?";
  db.query(sql, [id], (err, result) => {
    if (err) {
      console.error("Error al obtener usuario:", err);
      res.status(500).send({ error: "Error al obtener usuario" });
      return;
    }
    if (result.length === 0) {
      res.status(404).send({ message: "Usuario no encontrado" });
      return;
    }
    res.send(result[0]);
  });
};

// ✅ Actualizar usuario
exports.actualizarUsuario = (req, res) => {
  const { id } = req.params;
  const { nombre, apellido, correo, telefono, direccion, tipo, saldo } = req.body;
  const sql = `
    UPDATE usuarios 
    SET nombre = ?, apellido = ?, correo = ?, telefono = ?, direccion = ?, tipo = ?, saldo = ? 
    WHERE id = ?
  `;
  db.query(sql, [nombre, apellido, correo, telefono, direccion, tipo, saldo, id], (err, result) => {
    if (err) {
      console.error("Error al actualizar usuario:", err);
      res.status(500).send({ error: "Error al actualizar usuario" });
      return;
    }
    res.send({ message: "✅ Usuario actualizado con éxito" });
  });
};

// ✅ Eliminar usuario
exports.eliminarUsuario = (req, res) => {
  const { id } = req.params;
  const sql = "DELETE FROM usuarios WHERE id = ?";
  db.query(sql, [id], (err, result) => {
    if (err) {
      console.error("Error al eliminar usuario:", err);
      res.status(500).send({ error: "Error al eliminar usuario" });
      return;
    }
    res.send({ message: "🗑️ Usuario eliminado con éxito" });
  });
};
