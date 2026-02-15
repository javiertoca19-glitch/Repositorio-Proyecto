const express = require("express");
const router = express.Router();
const pedidoController = require("../controllers/pedidoController");

// Nombre del endpoint: /api/pedidos
// Método HTTP: POST
router.post("/api/pedidos", pedidoController.crearPedido);

module.exports = router;
