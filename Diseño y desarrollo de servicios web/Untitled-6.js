const express = require("express");
const app = express();
const pedidoRoutes = require("./routes/pedidoRoutes");

app.use(express.json());
app.use(pedidoRoutes);

app.listen(3000, () => {
  console.log("Servidor Gastronomía Universal en puerto 3000");
});



{
  "idUsuario": 1,
  "productos": [
    { "idProducto": 3, "cantidad": 2 },
    { "idProducto": 5, "cantidad": 1 }
  ]
}
