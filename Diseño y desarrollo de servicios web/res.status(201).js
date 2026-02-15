res.status(201).json({
  mensaje: "Pedido creado correctamente",
  pedido: nuevoPedido
});

res.status(201).json({
  mensaje: "Pedido creado correctamente",
  pedido: nuevoPedido
});

if (!idUsuario || !productos) {
  return res.status(400).json({
    mensaje: "Datos incompletos"
  });
}

if (!usuario) {
  return res.status(404).json({
    mensaje: "Usuario no encontrado"
  });
}

try {
   // lógica del pedido
} catch (error) {
   res.status(500).json({
     mensaje: "Error interno del servidor"
   });
}
