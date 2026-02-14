const express = require("express");
const app = express();

app.use(express.json());

// ===============================
// 🔹 BASE DE DATOS SIMULADA
// ===============================

const usuarios = [
  { id: 1, nombre: "Juan" },
  { id: 2, nombre: "María" }
];

const platos = [
  { id: 1, nombre: "Pizza Italiana", precio: 20000, descripcion: "Pizza tradicional italiana" },
  { id: 2, nombre: "Sushi Japonés", precio: 35000, descripcion: "Sushi fresco con salmón" },
  { id: 3, nombre: "Hamburguesa Americana", precio: 25000, descripcion: "Hamburguesa con papas" }
];

let carrito = [];
let pedidos = [];
let contadorPedidos = 1;

// ===============================
// 🥘 PLATOS
// ===============================

// Obtener todos los platos
app.get("/api/platos", (req, res) => {
  const { nombre } = req.query;

  if (nombre) {
    const resultado = platos.filter(p =>
      p.nombre.toLowerCase().includes(nombre.toLowerCase())
    );
    return res.json(resultado);
  }

  res.json(platos);
});

// Obtener plato por ID
app.get("/api/platos/:id", (req, res) => {
  const id = parseInt(req.params.id);
  const plato = platos.find(p => p.id === id);

  if (!plato) {
    return res.status(404).json({ mensaje: "Plato no encontrado" });
  }

  res.json(plato);
});

// ===============================
// 🛒 CARRITO
// ===============================

// Agregar producto al carrito
app.post("/api/carrito", (req, res) => {
  const { idUsuario, idProducto, cantidad } = req.body;

  const usuario = usuarios.find(u => u.id === idUsuario);
  if (!usuario) {
    return res.status(404).json({ mensaje: "Usuario no encontrado" });
  }

  const producto = platos.find(p => p.id === idProducto);
  if (!producto) {
    return res.status(404).json({ mensaje: "Producto no encontrado" });
  }

  const item = {
    id: carrito.length + 1,
    idUsuario,
    idProducto,
    cantidad
  };

  carrito.push(item);

  res.status(201).json({
    mensaje: "Producto agregado al carrito",
    item
  });
});

// Ver carrito por usuario
app.get("/api/carrito/:idUsuario", (req, res) => {
  const idUsuario = parseInt(req.params.idUsuario);

  const carritoUsuario = carrito.filter(c => c.idUsuario === idUsuario);

  res.json(carritoUsuario);
});

// Eliminar producto del carrito
app.delete("/api/carrito/:id", (req, res) => {
  const id = parseInt(req.params.id);

  const index = carrito.findIndex(c => c.id === id);

  if (index === -1) {
    return res.status(404).json({ mensaje: "Producto no encontrado en carrito" });
  }

  carrito.splice(index, 1);

  res.json({ mensaje: "Producto eliminado del carrito" });
});

// ===============================
// 📦 PEDIDOS
// ===============================

// Crear pedido
app.post("/api/pedidos", (req, res) => {
  const { idUsuario } = req.body;

  const usuario = usuarios.find(u => u.id === idUsuario);
  if (!usuario) {
    return res.status(404).json({ mensaje: "Usuario no encontrado" });
  }

  const carritoUsuario = carrito.filter(c => c.idUsuario === idUsuario);

  if (carritoUsuario.length === 0) {
    return res.status(400).json({ mensaje: "El carrito está vacío" });
  }

  let total = 0;

  carritoUsuario.forEach(item => {
    const producto = platos.find(p => p.id === item.idProducto);
    total += producto.precio * item.cantidad;
  });

  const nuevoPedido = {
    idPedido: contadorPedidos++,
    idUsuario,
    productos: carritoUsuario,
    total,
    fecha: new Date(),
    estado: "Pendiente"
  };

  pedidos.push(nuevoPedido);

  // Vaciar carrito del usuario
  carrito = carrito.filter(c => c.idUsuario !== idUsuario);

  res.status(201).json({
    mensaje: "Pedido creado correctamente",
    pedido: nuevoPedido
  });
});

// Consultar pedidos por usuario
app.get("/api/pedidos/usuario/:idUsuario", (req, res) => {
  const idUsuario = parseInt(req.params.idUsuario);

  const pedidosUsuario = pedidos.filter(p => p.idUsuario === idUsuario);

  res.json(pedidosUsuario);
});

// ===============================
// 🚀 SERVIDOR
// ===============================

app.listen(3000, () => {
  console.log("Servidor corriendo en http://localhost:3000");
});
