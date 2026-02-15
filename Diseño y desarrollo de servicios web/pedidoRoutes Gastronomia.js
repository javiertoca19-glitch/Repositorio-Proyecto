const express = require("express");
const router = express.Router();
const pedidoController = require("../controllers/pedidoController");

// Endpoint crear pedido
router.post("/api/pedidos", pedidoController.crearPedido);

// Endpoint consultar pedidos
router.get("/api/pedidos", pedidoController.obtenerPedidos);

module.exports = router;
