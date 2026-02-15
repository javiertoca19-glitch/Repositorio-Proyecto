const express = require("express");
const app = express();
const pedidoRoutes = require("./routes/pedidoRoutes");

app.use(express.json());
app.use(pedidoRoutes);

app.listen(3000, () => {
  console.log("Servidor ejecutándose en http://localhost:3000");
});
