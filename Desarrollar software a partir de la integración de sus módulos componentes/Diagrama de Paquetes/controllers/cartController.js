// Controlador del carrito
let carrito = [];

exports.addToCart = (req, res) => {
    const producto = req.body;
    carrito.push(producto);
    res.send("Producto agregado al carrito");
};

exports.getCart = (req, res) => {
    res.send(carrito);
};