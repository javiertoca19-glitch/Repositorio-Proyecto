const express = require('express');
const app = express();

app.use(express.json());

let usuarios = [];
let productos = [
    { id: 1, nombre: "Pizza Italiana", precio: 25000 },
    { id: 2, nombre: "Hamburguesa Americana", precio: 18000 }
];
let pedidos = [];

let idUsuario = 1;
let idPedido = 1;

// =========================
// REGISTRO
// =========================
app.post('/api/register', (req, res) => {
    const { nombre, correo, telefono, password } = req.body;

    if (!nombre || !correo || !password) {
        return res.status(400).json({ mensaje: "Datos incompletos" });
    }

    const nuevoUsuario = {
        id: idUsuario++,
        nombre,
        correo,
        telefono,
        password
    };

    usuarios.push(nuevoUsuario);

    res.status(201).json({
        mensaje: "Usuario registrado correctamente",
        usuario: nuevoUsuario
    });
});

// =========================
// LOGIN
// =========================
app.post('/api/login', (req, res) => {
    const { correo, password } = req.body;

    const usuario = usuarios.find(u => u.correo === correo && u.password === password);

    if (!usuario) {
        return res.status(401).json({ mensaje: "Credenciales incorrectas" });
    }

    res.status(200).json({
        mensaje: "Inicio de sesión exitoso",
        token: "abc123xyz"
    });
});

// =========================
// LISTAR PRODUCTOS
// =========================
app.get('/api/productos', (req, res) => {
    res.status(200).json(productos);
});

// =========================
// CREAR PEDIDO
// =========================
app.post('/api/pedidos', (req, res) => {
    const { usuarioId, producto, cantidad, direccion } = req.body;

    if (!usuarioId || !producto || !cantidad) {
        return res.status(400).json({ mensaje: "Datos incompletos" });
    }

    const nuevoPedido = {
        id: idPedido++,
        usuarioId,
        producto,
        cantidad,
        direccion,
        estado: "Pendiente"
    };

    pedidos.push(nuevoPedido);

    res.status(201).json({
        mensaje: "Pedido creado correctamente",
        pedido: nuevoPedido
    });
});

// =========================
// ACTUALIZAR PEDIDO
// =========================
app.put('/api/pedidos/:id', (req, res) => {
    const pedido = pedidos.find(p => p.id == req.params.id);

    if (!pedido) {
        return res.status(404).json({ mensaje: "Pedido no encontrado" });
    }

    pedido.estado = req.body.estado || pedido.estado;

    res.status(200).json({
        mensaje: "Pedido actualizado correctamente",
        pedido
    });
});

// =========================
// ELIMINAR PEDIDO
// =========================
app.delete('/api/pedidos/:id', (req, res) => {
    const index = pedidos.findIndex(p => p.id == req.params.id);

    if (index === -1) {
        return res.status(404).json({ mensaje: "Pedido no encontrado" });
    }

    pedidos.splice(index, 1);

    res.status(204).send();
});

// =========================
app.listen(3000, () => {
    console.log("Servidor corriendo en http://localhost:3000");
});