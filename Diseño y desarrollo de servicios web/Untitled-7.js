const crearPedido = (req, res) => {
  const { idUsuario, productos } = req.body;

  if (!idUsuario) {
    return res.status(400).json({
      mensaje: "El idUsuario es obligatorio"
    });
  }

  if (!productos || productos.length === 0) {
    return res.status(400).json({
      mensaje: "Debe enviar al menos un producto"
    });
  }

  res.status(201).json({
    mensaje: "Parámetros recibidos correctamente"
  });
};
