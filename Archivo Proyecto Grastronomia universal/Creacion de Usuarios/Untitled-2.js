const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

// Configuración de conexión MySQL
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "tu_password",
  database: "gastronomia_universal"
});

db.connect(err => {
  if (err) throw err;
  console.log("✅ Conectado a MySQL - Gastronomía Universal");
});

// Ruta principal (login)
app.post("/login", (req, res) => {
  const { correo, password } = req.body;

  const query = "SELECT * FROM usuarios WHERE correo = ? AND password = ?";
  db.query(query, [correo, password], (err, result) => {
    if (err) throw err;

    if (result.length > 0) {
      res.send(`<h2>🌍 Bienvenido ${result[0].nombre} ${result[0].apellido} a Gastronomía Universal</h2>`);
    } else {
      res.send("<h2>❌ Usuario o contraseña incorrectos</h2>");
    }
  });
});

// Levantar servidor
app.listen(3000, () => {
  console.log("🚀 Servidor corriendo en http://localhost:3000/");
});
