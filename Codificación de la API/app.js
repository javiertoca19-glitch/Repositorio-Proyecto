const express = require("express");
const app = express();

app.use(express.json());

// 🔹 Simulación de base de datos
const usuarios = [
  { id: 1, nombre: "Juan" },
  { id: 2, nombre: "María" }
];

const productos = [
  { id: 3, nombre: "Pizza Italiana", precio: 20000 },
  { id: 5, nombre: "Sushi Japonés", precio: 35000 }
];

let pedidos = [];
let contadorPedidos = 1;

// 🟢 POST /api/pedidos
app.post("/api/pedidos", (req, res) => {
  try {
    const { idUsuario, productos: listaProductos } = req.body;

    // 1️⃣ Validar que el usuario exista
    const usuarioExiste = usuarios.find(u => u.id === idUsuario);
    if (!usuarioExiste) {
      return res.status(404).json({ mensaje: "Usuario no encontrado" });
    }

    // 2️⃣ Validar que haya productos
    if (!listaProductos || listaProductos.length === 0) {
      return res.status(400).json({ mensaje: "Debe enviar al menos un producto" });
    }

    let total = 0;

    // 3️⃣ Calcular el total automáticamente
    for (let item of listaProductos) {
      const productoBD = productos.find(p => p.id === item.idProducto);

      if (!productoBD) {
        return res.status(404).json({ mensaje: `Producto ${item.idProducto} no existe` });
      }

      total += productoBD.precio * item.cantidad;
    }

    // 4️⃣ Crear el pedido
    const nuevoPedido = {
      idPedido: contadorPedidos++,
      idUsuario,
      productos: listaProductos,
      total,
      fecha: new Date(),
      estado: "Pendiente"
    };

    pedidos.push(nuevoPedido);

    // 5️⃣ Respuesta
    res.status(201).json({
      mensaje: "Pedido creado correctamente",
      pedido: nuevoPedido
    });

  } catch (error) {
    res.status(500).json({ mensaje: "Error interno del servidor" });
  }
});

// Servidor
app.listen(3000, () => {
  console.log("Servidor corriendo en puerto 3000");
});
