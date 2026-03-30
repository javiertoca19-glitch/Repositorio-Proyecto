const express = require("express");
const app = express();
const connectDB = require("./db");
const ENV = require("./env");

// Importar rutas
const authRoutes = require("../routes/authRoutes");
const productRoutes = require("../routes/productRoutes");
const cartRoutes = require("../routes/cartRoutes");
const orderRoutes = require("../routes/orderRoutes");

// Middleware
app.use(express.json());

// Conectar base de datos
connectDB();

// Usar rutas
app.use("/api", authRoutes);
app.use("/api", productRoutes);
app.use("/api", cartRoutes);
app.use("/api", orderRoutes);

// Iniciar servidor
app.listen(ENV.PORT, () => {
    console.log(`Servidor corriendo en puerto ${ENV.PORT}`);
});