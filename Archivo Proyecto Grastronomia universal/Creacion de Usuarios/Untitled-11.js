// routes/cliente-routes.js
const express = require('express');
const router = express.Router();
const clienteController = require('../controllers/cliente-controller');

// ✅ Crear un cliente
router.post('/', clienteController.crearCliente);

// ✅ Listar todos los clientes
router.get('/', clienteController.listarClientes);

// ✅ Obtener un cliente por ID
router.get('/:id', clienteController.obtenerCliente);

// ✅ Actualizar cliente por ID
router.put('/:id', clienteController.actualizarCliente);

// ✅ Eliminar cliente por ID
router.delete('/:id', clienteController.eliminarCliente);

module.exports = router;
const express = require('express');
const app = express();

// Middlewares
app.use(express.json());

// Importar rutas
const clienteRoutes = require('./routes/cliente-routes');

// Usar rutas
app.use('/api/clientes', clienteRoutes);

// Servidor
app.listen(3000, () => {
  console.log("🚀 Servidor corriendo en http://localhost:3000");
});
