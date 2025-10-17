USE gastronomia_universal;

-- ==========================
-- INSERTAR PLATOS
-- ==========================
INSERT INTO platos (nombre, descripcion, precio, imagen_url, bandera_pais) VALUES
('Bandeja Paisa', 'Arroz, frijoles, carne molida, chicharrón, huevo, aguacate y arepa', 28000, 'imagenes/platos/bandeja_paisa.jpg', '🇨🇴 Colombia'),
('Paella', 'Arroz con mariscos, pollo, conejo y verduras', 35000, 'imagenes/platos/paella.jpg', '🇪🇸 España'),
('Pizza Margarita', 'Pizza con tomate, queso mozzarella y albahaca', 25000, 'imagenes/platos/pizza_margarita.jpg', '🇮🇹 Italia'),
('Sushi Roll', 'Rollos de arroz con pescado fresco, aguacate y alga nori', 32000, 'imagenes/platos/sushi.jpg', '🇯🇵 Japón'),
('Tacos al Pastor', 'Tortilla de maíz con carne de cerdo adobada, piña y cebolla', 22000, 'imagenes/platos/tacos.jpg', '🇲🇽 México');

-- ==========================
-- INSERTAR BEBIDAS
-- ==========================
INSERT INTO bebidas (nombre, descripcion, precio, imagen_url, bandera_pais) VALUES
('Agua de Panela', 'Bebida tradicional dulce hecha con panela disuelta en agua', 5000, 'imagenes/bebidas/agua_panela.jpg', '🇨🇴 Colombia'),
('Café Espresso', 'Café fuerte y concentrado servido en taza pequeña', 7000, 'imagenes/bebidas/espresso.jpg', '🇮🇹 Italia'),
('Té Verde', 'Infusión de hojas de té verde con propiedades antioxidantes', 6000, 'imagenes/bebidas/te_verde.jpg', '🇨🇳 China'),
('Margarita', 'Cóctel con tequila, triple sec y jugo de limón', 18000, 'imagenes/bebidas/margarita.jpg', '🇲🇽 México'),
('Jugo de Mango', 'Refrescante jugo natural de mango', 8000, 'imagenes/bebidas/jugo_mango.jpg', '🇨🇴 Colombia');

-- ==========================
-- INSERTAR POSTRES
-- ==========================
INSERT INTO postres (nombre, descripcion, precio, imagen_url, bandera_pais) VALUES
('Arroz con Leche', 'Postre tradicional con arroz, leche, canela y azúcar', 9000, 'imagenes/postres/arroz_leche.jpg', '🇨🇴 Colombia'),
('Tiramisú', 'Postre con capas de bizcocho, café, cacao y crema mascarpone', 15000, 'imagenes/postres/tiramisu.jpg', '🇮🇹 Italia'),
('Mochi', 'Pastelito japonés de arroz glutinoso relleno de helado', 12000, 'imagenes/postres/mochi.jpg', '🇯🇵 Japón'),
('Churros con Chocolate', 'Palitos fritos de masa espolvoreados con azúcar, servidos con chocolate caliente', 10000, 'imagenes/postres/churros.jpg', '🇪🇸 España'),
('Flan Napolitano', 'Postre cremoso de huevo y leche con caramelo', 11000, 'imagenes/postres/flan.jpg', '🇲🇽 México');
