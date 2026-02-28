const express = require('express');
const router = express.Router();
const pedidoController = require('./pedidoController');

router.post('/pedidos', pedidoController.crear);
router.get('/pedidos', pedidoController.listar);
router.get('/pedidos/:id', pedidoController.obtenerPorId);

module.exports = router;