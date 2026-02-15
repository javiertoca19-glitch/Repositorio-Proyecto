const express = require("express");
const router = express.Router();
const pedidoController = require("../controllers/pedidoController");

// GET - Consultar todos los pedidos
router.get("/api/pedidos", pedidoController.obtenerPedidos);

// GET - Consultar pedido por ID
router.get("/api/pedidos/:id", pedidoController.obtenerPedidoPorId);

// POST - Crear nuevo pedido
router.post("/api/pedidos", pedidoController.crearPedido);

// PUT - Actualizar pedido
router.put("/api/pedidos/:id", pedidoController.actualizarPedido);

// DELETE - Eliminar pedido
router.delete("/api/pedidos/:id", pedidoController.eliminarPedido);

module.exports = router;
