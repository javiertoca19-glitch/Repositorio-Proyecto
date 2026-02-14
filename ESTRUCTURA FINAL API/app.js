const express = require("express");
const app = express();

const pedidoRoutes = require("./routes/pedidoRoutes");

app.use(express.json());

app.use("/api", pedidoRoutes);

app.listen(3000, () => {
  console.log("Servidor corriendo en http://localhost:3000");
});
