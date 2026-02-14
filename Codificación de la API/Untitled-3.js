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

const productos = [
  { id: 3, nombre: "Pizza Italiana", precio: 20000 },
  { id: 5, nombre: "Sushi Japonés", precio: 35000 }
];

let pedidos = [];
let contadorPedidos = 1;

// ===============================
// 🟢 POST /api/pedidos
// ===============================

app.post("/api/pedidos", (req, res) => {
  try {
    const { idUsuario, productos: listaProductos } = req.body;

    // 🔹 Validar campos obligatorios
    if (!idUsuario || !listaProductos || listaProductos.length === 0) {
      return res.status(400).json({
        mensaje: "Datos inválidos. Debe enviar idUsuario y lista de productos"
      });
    }

    // 🔹 Validar que el usuario exista
    const usuarioExiste = usuarios.find(u => u.id === idUsuario);

    if (!usuarioExiste) {
      return res.status(404).json({
        mensaje: "Usuario no encontrado"
      });
    }

    let total = 0;

    // 🔹 Validar productos y calcular total
    for (let item of listaProductos) {

      const productoBD = productos.find(p => p.id === item.idProducto);

      if (!productoBD) {
        return res.status(404).json({
          mensaje: `Producto con id ${item.idProducto} no existe`
        });
      }

      if (!item.cantidad || item.cantidad <= 0) {
        return res.status(400).json({
          mensaje: "Cantidad inválida"
        });
      }

      total += productoBD.precio * item.cantidad;
    }

    // 🔹 Crear pedido
    const nuevoPedido = {
      idPedido: contadorPedidos++,
      idUsuario,
      productos: listaProductos,
      total,
      fecha: new Date(),
      estado: "Pendiente"
    };

    pedidos.push(nuevoPedido);

    // 🔹 Respuesta exitosa
    res.status(201).json({
      mensaje: "Pedido creado correctamente",
      total
    });

  } catch (error) {
    res.status(500).json({
      mensaje: "Error interno del servidor"
    });
  }
});

// ===============================
// 🚀 SERVIDOR
// ===============================

app.listen(3000, () => {
  console.log("Servidor corriendo en http://localhost:3000");
});
