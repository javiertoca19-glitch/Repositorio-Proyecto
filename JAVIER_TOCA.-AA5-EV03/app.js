const express = require('express');
const app = express();
const pedidoRoutes = require('./pedidoRoutes');

app.use(express.json());
app.use('/api', pedidoRoutes);

const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en el puerto ${PORT}`);
});