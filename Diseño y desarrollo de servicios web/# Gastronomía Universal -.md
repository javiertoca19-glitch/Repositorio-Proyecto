# Gastronomía Universal - API de Pedidos

## Descripción
API REST desarrollada en Node.js y Express para gestionar pedidos del restaurante digital Gastronomía Universal.

## Endpoints

### POST /api/pedidos
Crea un nuevo pedido.

Parámetros:
- idUsuario (number)
- productos (array)

Respuesta:
- 201 Pedido creado correctamente
- 400 Datos incompletos

### GET /api/pedidos
Obtiene todos los pedidos registrados.

## Ejecución

1. npm install
2. node src/app.js
3. Probar en Postman en http://localhost:3000
