<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>🌍 Gastronomía Universal</title>

  <!-- Tailwind (CDN) -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">

  <style>
    /* Font fallback for Tailwind class names */
    :root { --mont: 'Montserrat', system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', Arial; --display: 'Playfair Display', serif; }

    body { font-family: var(--mont); -webkit-font-smoothing:antialiased; -moz-osx-font-smoothing:grayscale; }

    /* Floating animation */
    @keyframes floaty {
      0%   { transform: translateY(0); }
      50%  { transform: translateY(-18px); }
      100% { transform: translateY(0); }
    }
    .floaty { animation: floaty 6s ease-in-out infinite; }

    /* Background gradient animation */
    .galaxy-bg {
      background: radial-gradient(circle at 10% 20%, rgba(255,200,50,0.06), transparent 2%),
                  radial-gradient(circle at 90% 80%, rgba(255,120,60,0.04), transparent 2%),
                  linear-gradient(135deg, #071026 0%, #14102a 50%, #2b1b47 100%);
      background-size: 100% 100%;
      min-height: 100%;
    }

    /* Food glow & btn hover */
    .food-glow { box-shadow: 0 6px 30px rgba(255,193,7,0.14); }
    .btn-hover:hover { transform: translateY(-6px); box-shadow: 0 12px 30px rgba(0,0,0,0.35); }

    /* Stars */
    .star { position: absolute; background: rgba(255,255,255,0.9); border-radius: 50%; opacity: 0.9; animation: twinkle 3s ease-in-out infinite; }
    @keyframes twinkle {
      0% { opacity: 0.15; transform: scale(0.9); }
      50% { opacity: 0.95; transform: scale(1.2); }
      100% { opacity: 0.15; transform: scale(0.9); }
    }

    /* Modal backdrop */
    .modal-backdrop { background: rgba(0,0,0,0.6); }

    /* small screens tweaks */
    @media (max-width:640px) {
      .hide-mobile { display:none; }
    }

    /* Utility for gradient text */
    .grad-text {
      background: linear-gradient(90deg,#ffdf6a,#ff8a3d);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
    }

    /* Flag styling */
    .flag-container {
      width: 100%;
      height: 180px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
      border-radius: 0.75rem;
      overflow: hidden;
    }

    .flag {
      width: 80%;
      height: 80%;
      object-fit: contain;
      border-radius: 0.5rem;
      box-shadow: 0 4px 15px rgba(0,0,0,0.3);
    }
  </style>
</head>

<body class="galaxy-bg text-gray-100">

  <!-- Stars container -->
  <div id="stars" class="fixed inset-0 pointer-events-none -z-10"></div>

  <!-- NAV -->
  <header class="relative z-40">
    <nav class="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
      <div class="flex items-center gap-4">
        <div class="w-12 h-12 rounded-full bg-gradient-to-r from-yellow-400 to-orange-500 flex items-center justify-center shadow-lg">
          <span class="font-bold text-xl text-gray-900">G</span>
        </div>
        <div>
          <h1 class="text-lg md:text-2xl font-bold grad-text">Gastronomía Universal</h1>
          <p class="text-xs text-gray-300 -mt-1">Explora sabores del mundo — Precios en COP</p>
        </div>
      </div>

      <div class="hidden md:flex items-center gap-8">
        <a href="#inicio" class="hover:text-yellow-400 transition">Inicio</a>
        <a href="#menu"   class="hover:text-yellow-400 transition">Menú</a>
        <a href="#registro" class="hover:text-yellow-400 transition">Registro</a>
        <a href="#pagos" class="hover:text-yellow-400 transition">Pagos</a>
        <button id="open-cart" class="relative">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2 7h13l-2-7M16 21a1 1 0 100-2 1 1 0 000 2zm-8 0a1 1 0 100-2 1 1 0 000 2z"/></svg>
          <span id="cart-count" class="absolute -top-2 -right-3 bg-yellow-400 text-gray-900 text-xs font-bold px-2 rounded-full">0</span>
        </button>
      </div>

      <!-- Mobile menu (simplified) -->
      <div class="md:hidden">
        <button id="btn-mobile-menu" class="p-2">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16"/></svg>
        </button>
      </div>
    </nav>
    <!-- Mobile menu dropdown -->
    <div id="mobile-menu" class="hidden md:hidden px-6 pb-4">
      <div class="flex flex-col gap-3">
        <a href="#inicio">Inicio</a>
        <a href="#menu">Menú</a>
        <a href="#registro">Registro</a>
        <a href="#pagos">Pagos</a>
      </div>
    </div>
  </header>

  <!-- HERO -->
  <section id="inicio" class="min-h-[70vh] flex items-center">
    <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 lg:grid-cols-2 gap-10 items-center py-16">
      <div>
        <h2 class="text-4xl md:text-6xl font-extrabold leading-tight mb-4 grad-text">Descubre el Universo del Sabor</h2>
        <p class="text-gray-300 mb-6 text-lg">Viaja por platos internacionales, bebidas y postres que cuentan historias de países. ¡Explora, elige y pide!</p>

        <div class="flex gap-3 flex-wrap">
          <button onclick="document.getElementById('menu').scrollIntoView({behavior:'smooth'})" class="px-6 py-3 rounded-full font-bold bg-gradient-to-r from-yellow-400 to-orange-500 text-gray-900 btn-hover">Explorar Menú</button>
          <button onclick="document.getElementById('registro').scrollIntoView({behavior:'smooth'})" class="px-6 py-3 rounded-full border border-yellow-400 text-yellow-400 font-semibold">Registrarme</button>
          <button id="toggle-search" class="px-4 py-3 rounded-full bg-gray-800/60 border border-gray-700">Buscar platos</button>
        </div>

        <div class="mt-6 text-sm text-gray-400">
          <span class="mr-3">📍 sogamoso, Colombia</span>
          <span>📞 +57 3148302876</span>
        </div>

        <!-- Rotating phrases -->
        <div id="rotating-phrases" class="mt-8 p-4 bg-black/30 rounded-xl text-gray-200">
          <p id="phrase-text" class="text-lg italic">"Buen provecho — disfruta cada bocado."</p>
        </div>
      </div>

      <!-- Floating flag visuals -->
      <div class="relative w-full flex justify-center items-center">
        <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=900&q=60" alt="Planet Earth background" class="w-full h-80 object-cover rounded-2xl shadow-2xl food-glow hide-mobile">
        <!-- emoji floats -->
        <div class="absolute left-8 top-8 text-6xl opacity-30 floaty">🇮🇹</div>
        <div class="absolute right-12 top-28 text-5xl opacity-30 floaty" style="animation-delay:.6s">🇯🇵</div>
        <div class="absolute left-14 bottom-8 text-5xl opacity-30 floaty" style="animation-delay:1.2s">🇲🇽</div>
      </div>

    </div>
  </section>

  <!-- SEARCH BAR (hidden by default) -->
  <div id="search-panel" class="max-w-4xl mx-auto px-6 hidden">
    <div class="bg-black/40 backdrop-blur-sm rounded-xl p-4 flex gap-3 items-center">
      <input id="search-input" type="text" placeholder="Buscar por nombre, país o ingrediente..." class="flex-1 px-4 py-3 rounded-lg bg-gray-900/60 border border-gray-700 focus:outline-none">
      <button id="search-clear" class="px-4 py-3 rounded-lg bg-yellow-400 text-gray-900 font-bold">Limpiar</button>
    </div>
  </div>

  <!-- MENU: platillos, bebidas, postres -->
  <section id="menu" class="py-16">
    <div class="max-w-7xl mx-auto px-6">
      <div class="flex justify-between items-center mb-8">
        <div>
          <h3 class="text-3xl font-bold mb-1 grad-text">Menú Estelar</h3>
          <p class="text-gray-300">Platos, bebidas y postres con precios en pesos colombianos (COP) — toca en una tarjeta para ver más</p>
        </div>
        <div class="flex gap-3">
          <select id="filter-type" class="bg-gray-900/60 border border-gray-700 px-3 py-2 rounded-lg">
            <option value="all">Todos</option>
            <option value="platillo">Platillos</option>
            <option value="bebida">Bebidas</option>
            <option value="postre">Postres</option>
          </select>
          <select id="sort-by" class="bg-gray-900/60 border border-gray-700 px-3 py-2 rounded-lg">
            <option value="popular">Más populares</option>
            <option value="price-asc">Precio: bajo → alto</option>
            <option value="price-desc">Precio: alto → bajo</option>
          </select>
        </div>
      </div>

      <!-- Grid -->
      <div id="cards" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Cards will be injected by JS for easier maintenance -->
      </div>
    </div>
  </section>

  <!-- REGISTRATION -->
  <section id="registro" class="py-12">
    <div class="max-w-4xl mx-auto px-6">
      <div class="bg-black/40 backdrop-blur-sm rounded-3xl p-8 border border-yellow-500/20">
        <h3 class="text-2xl md:text-3xl font-bold grad-text mb-4">Registro de Usuario</h3>
        <p class="text-gray-300 mb-6">Únete para recibir ofertas y guardar tus pedidos.</p>

        <form id="registration-form" class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <label class="text-sm text-yellow-300">Nombre completo</label>
            <input required name="name" type="text" placeholder="Juan Pérez" class="w-full px-4 py-3 mt-1 rounded-lg bg-gray-900/60 border border-gray-700">
          </div>
          <div>
            <label class="text-sm text-yellow-300">Correo electrónico</label>
            <input required name="email" type="email" placeholder="juan@correo.com" class="w-full px-4 py-3 mt-1 rounded-lg bg-gray-900/60 border border-gray-700">
          </div>
          <div>
            <label class="text-sm text-yellow-300">Teléfono</label>
            <input name="phone" type="tel" placeholder="+57 300 123 4567" class="w-full px-4 py-3 mt-1 rounded-lg bg-gray-900/60 border border-gray-700">
          </div>
          <div>
            <label class="text-sm text-yellow-300">Dirección</label>
            <input name="address" type="text" placeholder="Calle 123 #45-67" class="w-full px-4 py-3 mt-1 rounded-lg bg-gray-900/60 border border-gray-700">
          </div>
          <div>
            <label class="text-sm text-yellow-300">Contraseña</label>
            <input required name="password" type="password" placeholder="••••••••" class="w-full px-4 py-3 mt-1 rounded-lg bg-gray-900/60 border border-gray-700">
          </div>
          <div>
            <label class="text-sm text-yellow-300">Confirmar contraseña</label>
            <input required name="password2" type="password" placeholder="••••••••" class="w-full px-4 py-3 mt-1 rounded-lg bg-gray-900/60 border border-gray-700">
          </div>

          <div class="md:col-span-2 flex items-center gap-3">
            <input id="terms" type="checkbox" class="w-4 h-4 text-yellow-400 bg-gray-900 border-gray-700 rounded">
            <label for="terms" class="text-sm text-gray-300">Acepto los <a href="#" class="text-yellow-400">términos y condiciones</a> y la <a href="#" class="text-yellow-400">política de privacidad</a></label>
          </div>

          <div class="md:col-span-2 text-center">
            <button type="submit" class="px-8 py-3 rounded-full bg-gradient-to-r from-yellow-400 to-orange-500 text-gray-900 font-bold">Registrarse</button>
          </div>
        </form>
      </div>
    </div>
  </section>

  <!-- PAGOS -->
  <section id="pagos" class="py-12">
    <div class="max-w-5xl mx-auto px-6">
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <!-- Métodos -->
        <div class="bg-black/40 rounded-3xl p-6 border border-yellow-500/20">
          <h4 class="text-xl font-bold grad-text mb-4">Métodos de Pago</h4>
          <p class="text-gray-300 mb-4">Elige el método de pago. Número para transferencias/Nequi/Daviplata: <strong class="text-yellow-300">3148302876</strong></p>

          <div class="space-y-4">
            <!-- Nequi -->
            <div class="flex items-center gap-4 p-4 bg-gray-900/50 rounded-lg">
              <img src="https://img.asmedia.epimg.net/resizer/v2/3ES4PWG6ANL7VK3M6K43S63MWQ.jpg?auth=fa71de914d7db12ab3b7e0d4c0e1c52a16a2c580e99cb2590d735480b7724119&width=1472&height=828&focal=611%2C352" alt="Nequi" class="w-16 h-10 object-contain bg-white/5 rounded">
              <div>
                <div class="font-semibold">Nequi</div>
                <div class="text-sm text-gray-400">Transferencias instantáneas. Número: <strong>3148302876</strong></div>
              </div>
            </div>

            <!-- Daviplata -->
            <div class="flex items-center gap-4 p-4 bg-gray-900/50 rounded-lg">
              <img src="https://images.seeklogo.com/logo-png/45/2/daviplata-logo-png_seeklogo-457809.png" alt="Daviplata" class="w-16 h-10 object-contain bg-white/5 rounded">
              <div>
                <div class="font-semibold">Daviplata</div>
                <div class="text-sm text-gray-400">Pago móvil seguro. Número: <strong>3148302876</strong></div>
              </div>
            </div>

            <!-- Efectivo (Efecty) -->
            <div class="flex items-center gap-4 p-4 bg-gray-900/50 rounded-lg">
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Efecty_logo.svg/1200px-Efecty_logo.svg.png" alt="Efectivo" class="w-16 h-10 object-contain bg-white/5 rounded">
              <div>
                <div class="font-semibold">Efecty - Pago en efectivo</div>
                <div class="text-sm text-gray-400">Acércate a un punto Efecty y realiza tu pago. Guarda el código de referencia.</div>
              </div>
            </div>

          </div>
        </div>

        <!-- Resumen carrito + checkout -->
        <div class="bg-black/40 rounded-3xl p-6 border border-yellow-500/20">
          <h4 class="text-xl font-bold grad-text mb-4">Resumen del Pedido</h4>
          <div id="cart-items" class="space-y-3 max-h-72 overflow-auto mb-4">
            <p class="text-sm text-gray-400">No hay artículos aún.</p>
          </div>

          <div class="border-t border-gray-700 pt-3 space-y-2">
            <div class="flex justify-between text-gray-300">
              <span>Subtotal</span>
              <span id="subtotal">0</span>
            </div>
            <div class="flex justify-between text-gray-300">
              <span>Envío</span>
              <span id="shipping">$8.000</span>
            </div>
            <div class="flex justify-between text-xl font-bold text-yellow-300">
              <span>Total</span>
              <span id="grandtotal">$0</span>
            </div>
          </div>

          <div class="mt-4">
            <button id="checkout-btn" class="w-full px-4 py-3 rounded-full bg-gradient-to-r from-green-400 to-green-600 text-gray-900 font-bold">Proceder al Pago</button>
          </div>

          <div class="mt-6 text-sm text-gray-400">
            <p>✓ Pagos 100% seguros ✓ Soporte 24/7</p>
            <p class="mt-1">Protegido por encriptación</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- FOOTER -->
  <footer class="py-10 mt-12 border-t border-gray-800">
    <div class="max-w-7xl mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-4">
      <div class="flex items-center gap-4">
        <div class="w-10 h-10 rounded-full bg-gradient-to-r from-yellow-400 to-orange-500 flex items-center justify-center">G</div>
        <div>
          <div class="font-bold">Gastronomía Universal</div>
          <div class="text-xs text-gray-400">© 2025 - Precios en pesos colombianos (COP)</div>
        </div>
      </div>

      <div class="text-sm text-gray-400">Contacto: info@gastronomiauniversal.com · +57 300 123 4567</div>
    </div>
  </footer>

  <!-- MODAL: plato detalle -->
  <div id="modal" class="fixed inset-0 hidden items-center justify-center z-50">
    <div class="modal-backdrop absolute inset-0"></div>
    <div class="relative max-w-3xl w-full mx-4 bg-gray-900/90 rounded-2xl overflow-hidden border border-gray-700 p-4">
      <button id="modal-close" class="absolute top-3 right-3 text-gray-200">✕</button>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="flag-container">
          <img id="modal-flag" src="" alt="Bandera" class="flag">
        </div>
        <div>
          <h3 id="modal-title" class="text-2xl font-bold grad-text"></h3>
          <p id="modal-country" class="text-sm text-gray-400 mb-2"></p>
          <p id="modal-desc" class="text-gray-300 mb-4"></p>
          <div class="flex items-center justify-between">
            <div class="text-xl font-bold text-yellow-300" id="modal-price"></div>
            <div>
              <button id="modal-add" class="px-4 py-2 rounded-full bg-gradient-to-r from-green-400 to-green-600 text-gray-900 font-bold">Agregar al carrito</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Toast (simple) -->
  <div id="toast" class="fixed bottom-6 right-6 hidden bg-gray-800/90 text-gray-100 px-4 py-2 rounded shadow">Agregado al carrito</div>

  <!-- SCRIPTS -->
  <script>
    /* ---------- DATA: platos, bebidas, postres ---------- */
    const PRODUCTS = [
      /* Platillos */
      {
        id: 'pasta-carbonara',
        type: 'platillo',
        title: 'Pasta Carbonara',
        country: 'Italia 🇮🇹',
        price: 38500,
        img: 'https://upload.wikimedia.org/wikipedia/en/0/03/Flag_of_Italy.svg',
        desc: 'Pasta al dente con panceta ahumada, huevo y parmesano. Clásico italiano.',
        popular: 95
      },
      {
        id: 'sushi-mix',
        type: 'platillo',
        title: 'Sushi Mix',
        country: 'Japón 🇯🇵',
        price: 52000,
        img: 'https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg',
        desc: 'Selección premium: nigiri, sashimi y makis con pescado fresco.',
        popular: 120
      },
      {
        id: 'tacos-pastor',
        type: 'platillo',
        title: 'Tacos al Pastor',
        country: 'México 🇲🇽',
        price: 28000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Flag_of_Mexico.svg',
        desc: 'Tacos con carne marinada, piña y cilantro sobre tortilla de maíz.',
        popular: 110
      },
      {
        id: 'paella-valenciana',
        type: 'platillo',
        title: 'Paella Valenciana',
        country: 'España 🇪🇸',
        price: 68000,
        img: 'https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg',
        desc: 'Arroz bomba con mariscos, pollo y azafrán. Tradición española.',
        popular: 80
      },
      {
        id: 'curry-rojo',
        type: 'platillo',
        title: 'Curry Rojo Tailandés',
        country: 'Tailandia 🇹🇭',
        price: 35000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Flag_of_Thailand.svg',
        desc: 'Cremoso con leche de coco y verduras frescas. Ajusta el picante.',
        popular: 88
      },
      {
        id: 'pizza-margherita',
        type: 'platillo',
        title: 'Pizza Margherita',
        country: 'Italia 🇮🇹',
        price: 42000,
        img: 'https://upload.wikimedia.org/wikipedia/en/0/03/Flag_of_Italy.svg',
        desc: 'Masa fermentada 48h, tomate San Marzano, mozzarella y albahaca.',
        popular: 130
      },
      {
        id: 'ramen-tokyo',
        type: 'platillo',
        title: 'Ramen de Tokio',
        country: 'Japón 🇯🇵',
        price: 45000,
        img: 'https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg',
        desc: 'Sopa de fideos con caldo de hueso, huevo marinado y cerdo chashu.',
        popular: 95
      },
      {
        id: 'ceviche-lima',
        type: 'platillo',
        title: 'Ceviche de Lima',
        country: 'Perú 🇵🇪',
        price: 48000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/c/cf/Flag_of_Peru.svg',
        desc: 'Pescado fresco marinado en limón, cebolla morada y ají limo.',
        popular: 105
      },
      {
        id: 'biryani-mumbai',
        type: 'platillo',
        title: 'Biryani de Mumbai',
        country: 'India 🇮🇳',
        price: 41000,
        img: 'https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg',
        desc: 'Arroz basmati con especias, pollo y hierbas aromáticas.',
        popular: 85
      },
      {
        id: 'gyros-atenas',
        type: 'platillo',
        title: 'Gyros de Atenas',
        country: 'Grecia 🇬🇷',
        price: 36000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Greece.svg',
        desc: 'Pan pita con carne de cordero, tomate, cebolla y tzatziki.',
        popular: 75
      },
      {
        id: 'pho-hanoi',
        type: 'platillo',
        title: 'Pho de Hanoi',
        country: 'Vietnam 🇻🇳',
        price: 39000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_Vietnam.svg',
        desc: 'Sopa de fideos de arroz con caldo de res y hierbas frescas.',
        popular: 90
      },
      {
        id: 'feijoada-rio',
        type: 'platillo',
        title: 'Feijoada de Río',
        country: 'Brasil 🇧🇷',
        price: 52000,
        img: 'https://upload.wikimedia.org/wikipedia/en/0/05/Flag_of_Brazil.svg',
        desc: 'Frijoles negros con carne de cerdo, chorizo y arroz blanco.',
        popular: 88
      },

      /* Bebidas */
      {
        id: 'mate',
        type: 'bebida',
        title: 'Mate Tradicional',
        country: 'Argentina 🇦🇷',
        price: 7000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/1/1a/Flag_of_Argentina.svg',
        desc: 'Infusión popular en el Cono Sur, sabor amargo y social.',
        popular: 40
      },
      {
        id: 'chai-latte',
        type: 'bebida',
        title: 'Chai Latte',
        country: 'India 🇮🇳',
        price: 9000,
        img: 'https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg',
        desc: 'Mezcla de especias, leche y té negro. Aromático y reconfortante.',
        popular: 60
      },
      {
        id: 'limonada-fresa',
        type: 'bebida',
        title: 'Limonada de Fresa',
        country: 'Colombia 🇨🇴',
        price: 7000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_Colombia.svg',
        desc: 'Refrescante limonada con puré de fresas.',
        popular: 55
      },
      {
        id: 'margarita-cancun',
        type: 'bebida',
        title: 'Margarita de Cancún',
        country: 'México 🇲🇽',
        price: 18000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Flag_of_Mexico.svg',
        desc: 'Cóctel clásico con tequila, triple seco y jugo de limón.',
        popular: 70
      },
      {
        id: 'mojito-habana',
        type: 'bebida',
        title: 'Mojito de La Habana',
        country: 'Cuba 🇨🇺',
        price: 16000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Flag_of_Cuba.svg',
        desc: 'Ron blanco, menta fresca, azúcar, limón y soda.',
        popular: 85
      },
      {
        id: 'caipirinha-rio',
        type: 'bebida',
        title: 'Caipirinha de Río',
        country: 'Brasil 🇧🇷',
        price: 17000,
        img: 'https://upload.wikimedia.org/wikipedia/en/0/05/Flag_of_Brazil.svg',
        desc: 'Cachaça, lima cortada, azúcar y hielo machacado.',
        popular: 65
      },
      {
        id: 'sangria-barcelona',
        type: 'bebida',
        title: 'Sangría de Barcelona',
        country: 'España 🇪🇸',
        price: 22000,
        img: 'https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg',
        desc: 'Vino tinto con frutas frescas, brandy y un toque de azúcar.',
        popular: 78
      },
      {
        id: 'bubble-tea-taipei',
        type: 'bebida',
        title: 'Bubble Tea de Taipei',
        country: 'Taiwán 🇹🇼',
        price: 12000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/7/72/Flag_of_the_Republic_of_China.svg',
        desc: 'Té con leche, sirope y perlas de tapioca masticables.',
        popular: 95
      },
      {
        id: 'espresso-roma',
        type: 'bebida',
        title: 'Espresso de Roma',
        country: 'Italia 🇮🇹',
        price: 8000,
        img: 'https://upload.wikimedia.org/wikipedia/en/0/03/Flag_of_Italy.svg',
        desc: 'Café concentrado con crema dorada, servido en taza pequeña.',
        popular: 88
      },
      {
        id: 'horchata-valencia',
        type: 'bebida',
        title: 'Horchata de Valencia',
        country: 'España 🇪🇸',
        price: 9500,
        img: 'https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg',
        desc: 'Bebida refrescante hecha de chufa, agua y azúcar.',
        popular: 60
      },

      /* Postres */
      {
        id: 'tiramisu',
        type: 'postre',
        title: 'Tiramisú',
        country: 'Italia 🇮🇹',
        price: 14000,
        img: 'https://upload.wikimedia.org/wikipedia/en/0/03/Flag_of_Italy.svg',
        desc: 'Clásico postre con capas de mascarpone, café y cacao.',
        popular: 75
      },
      {
        id: 'flan-cremoso',
        type: 'postre',
        title: 'Flan Cremoso',
        country: 'España 🇪🇸',
        price: 9000,
        img: 'https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg',
        desc: 'Textura suave y caramelo dorado.',
        popular: 45
      },
      {
        id: 'brownie-choco',
        type: 'postre',
        title: 'Brownie de Chocolate',
        country: 'EE. UU. 🇺🇸',
        price: 11000,
        img: 'https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg',
        desc: 'Denso, húmedo y con trozos de chocolate.',
        popular: 95
      },
      {
        id: 'creme-brulee-paris',
        type: 'postre',
        title: 'Crème Brûlée de París',
        country: 'Francia 🇫🇷',
        price: 16000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/c/c3/Flag_of_France.svg',
        desc: 'Crema de vainilla con capa crujiente de caramelo quemado.',
        popular: 80
      },
      {
        id: 'baklava-istanbul',
        type: 'postre',
        title: 'Baklava de Estambul',
        country: 'Turquía 🇹🇷',
        price: 13000,
        img: 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg',
        desc: 'Capas de masa filo con nueces y miel, servido en porciones.',
        popular: 70
      },
      {
        id: 'mochi-kyoto',
        type: 'postre',
        title: 'Mochi de Kioto',
        country: 'Japón 🇯🇵',
        price: 12000,
        img: 'https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg',
        desc: 'Bolas de arroz glutinoso rellenas de pasta de frijol rojo.',
        popular: 85
      },
      {
        id: 'churros-madrid',
        type: 'postre',
        title: 'Churros de Madrid',
        country: 'España 🇪🇸',
        price: 10000,
        img: 'https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg',
        desc: 'Dulce frito crujiente con azúcar y canela, ideal con chocolate.',
        popular: 78
      },
      {
        id: 'pavlova-sydney',
        type: 'postre',
        title: 'Pavlova de Sídney',
        country: 'Australia 🇦🇺',
        price: 15000,
        img: 'https://upload.wikimedia.org/wikipedia/en/b/b9/Flag_of_Australia.svg',
        desc: 'Merengue crujiente por fuera y suave por dentro con frutas frescas.',
        popular: 65
      },
      {
        id: 'tarta-limón-londres',
        type: 'postre',
        title: 'Tarta de Limón de Londres',
        country: 'Reino Unido 🇬🇧',
        price: 13500,
        img: 'https://upload.wikimedia.org/wikipedia/en/a/ae/Flag_of_the_United_Kingdom.svg',
        desc: 'Base de galleta con relleno ácido de limón y crema batida.',
        popular: 72
      },
      {
        id: 'knafeh-amman',
        type: 'postre',
        title: 'Knafeh de Ammán',
        country: 'Jordania 🇯🇴',
        price: 14500,
        img: 'https://upload.wikimedia.org/wikipedia/commons/c/c0/Flag_of_Jordan.svg',
        desc: 'Queso dulce entre capas de masa fina con sirope de rosas.',
        popular: 68
      }
    ];

    /* ---------- STATE ---------- */
    let CART = {}; // {productId: qty}
    const SHIPPING = 8000; // fixed shipping shown as $8.000

    /* ---------- HELPERS ---------- */
    function formatCOP(n) {
      return new Intl.NumberFormat('es-CO', { style: 'currency', currency: 'COP', maximumFractionDigits: 0 }).format(n);
    }

    function renderCards(list) {
      const container = document.getElementById('cards');
      container.innerHTML = '';
      list.forEach(p => {
        const colorBg = p.type === 'platillo' ? 'from-yellow-400 to-orange-500' : (p.type === 'bebida' ? 'from-green-400 to-blue-500' : 'from-pink-400 to-purple-500');
        const card = document.createElement('article');
        card.className = 'bg-black/40 rounded-2xl p-4 border border-gray-700/30 food-glow hover:scale-105 transition';
        card.innerHTML = `
          <div class="flag-container mb-3">
            <img src="${p.img}" alt="${p.country}" class="flag">
          </div>
          <div class="flex items-start justify-between gap-4">
            <div>
              <h4 class="text-xl font-bold">${p.title} <span class="text-sm ml-2">${p.country}</span></h4>
              <p class="text-sm text-gray-300 mt-1">${p.desc.slice(0, 80)}${p.desc.length>80?'...':''}</p>
            </div>
            <div class="text-right">
              <div class="text-yellow-300 font-bold text-xl">${formatCOP(p.price)}</div>
              <div class="mt-2 flex flex-col gap-2">
                <button data-id="${p.id}" class="open-detail px-3 py-1 rounded-full bg-gray-800/60 text-sm border border-gray-700">Ver</button>
                <button data-id="${p.id}" class="add-cart px-3 py-1 rounded-full text-sm bg-gradient-to-r ${colorBg} text-gray-900 font-bold">Pedir</button>
              </div>
            </div>
          </div>
        `;
        container.appendChild(card);
      });
    }

    function filterAndSort() {
      const type = document.getElementById('filter-type').value;
      const sort = document.getElementById('sort-by').value;
      const searchQ = document.getElementById('search-input')?.value?.toLowerCase() || '';

      let out = PRODUCTS.filter(p => (type === 'all' ? true : p.type === type));
      if (searchQ) {
        out = out.filter(p => (p.title + ' ' + p.country + ' ' + p.desc).toLowerCase().includes(searchQ));
      }

      if (sort === 'price-asc') out.sort((a,b)=>a.price-b.price);
      else if (sort === 'price-desc') out.sort((a,b)=>b.price-a.price);
      else out.sort((a,b)=> (b.popular||0) - (a.popular||0));

      renderCards(out);
    }

    /* ---------- CART UI ---------- */
    function saveCart() {
      localStorage.setItem('gu_cart', JSON.stringify(CART));
      updateCartUI();
    }

    function loadCart() {
      const raw = localStorage.getItem('gu_cart');
      if (raw) CART = JSON.parse(raw);
      else CART = {};
      updateCartUI();
    }

    function addToCart(productId, qty = 1) {
      CART[productId] = (CART[productId] || 0) + qty;
      saveCart();
      showToast('Agregado al carrito');
    }

    function removeFromCart(productId) {
      delete CART[productId];
      saveCart();
    }

    function updateCartUI() {
      // count
      const count = Object.values(CART).reduce((s,n)=>s+n,0);
      document.getElementById('cart-count').textContent = count;

      // items list
      const container = document.getElementById('cart-items');
      container.innerHTML = '';
      if (count === 0) {
        container.innerHTML = '<p class="text-sm text-gray-400">No hay artículos aún.</p>';
      } else {
        for (const [id, qty] of Object.entries(CART)) {
          const p = PRODUCTS.find(x=>x.id===id);
          if (!p) continue;
          const row = document.createElement('div');
          row.className = 'flex justify-between items-center bg-gray-900/40 p-3 rounded';
          row.innerHTML = `
            <div>
              <div class="font-semibold">${p.title}</div>
              <div class="text-xs text-gray-400">${formatCOP(p.price)} × ${qty}</div>
            </div>
            <div class="flex items-center gap-2">
              <button data-id="${id}" class="dec px-2 py-1 rounded bg-gray-800">-</button>
              <div class="px-2">${qty}</div>
              <button data-id="${id}" class="inc px-2 py-1 rounded bg-gray-800">+</button>
              <button data-id="${id}" class="rm ml-3 px-2 py-1 rounded bg-red-600 text-white">Eliminar</button>
            </div>
          `;
          container.appendChild(row);
        }
      }

      // totals
      const subtotal = Object.entries(CART).reduce((s,[id,qty])=>{
        const p = PRODUCTS.find(x=>x.id===id); return s + (p ? p.price * qty : 0);
      },0);
      document.getElementById('subtotal').textContent = formatCOP(subtotal);
      document.getElementById('grandtotal').textContent = formatCOP(subtotal + (count>0 ? SHIPPING : 0));
    }

    /* ---------- MODAL ---------- */
    function openModal(productId) {
      const p = PRODUCTS.find(x=>x.id===productId);
      if (!p) return;
      document.getElementById('modal-flag').src = p.img;
      document.getElementById('modal-title').textContent = p.title;
      document.getElementById('modal-desc').textContent = p.desc;
      document.getElementById('modal-country').textContent = p.country;
      document.getElementById('modal-price').textContent = formatCOP(p.price);
      document.getElementById('modal-add').dataset.id = p.id;
      document.getElementById('modal').classList.remove('hidden');
      document.getElementById('modal').classList.add('flex');
    }

    function closeModal() {
      document.getElementById('modal').classList.add('hidden');
      document.getElementById('modal').classList.remove('flex');
    }

    /* ---------- TOAST ---------- */
    let toastTimer = null;
    function showToast(msg='Hecho') {
      const t = document.getElementById('toast');
      t.textContent = msg;
      t.classList.remove('hidden');
      if (toastTimer) clearTimeout(toastTimer);
      toastTimer = setTimeout(()=> t.classList.add('hidden'), 1800);
    }

    /* ---------- INITIALIZE ---------- */
    document.addEventListener('DOMContentLoaded', ()=> {
      // Render cards initially
      renderCards(PRODUCTS);

      // load cart from storage
      loadCart();

      // filter/sort listeners
      document.getElementById('filter-type').addEventListener('change', filterAndSort);
      document.getElementById('sort-by').addEventListener('change', filterAndSort);

      // dynamic clicks (cards)
      document.getElementById('cards').addEventListener('click', (e)=>{
        // open details
        if (e.target.classList.contains('open-detail')) {
          openModal(e.target.dataset.id);
          return;
        }
        // add to cart
        if (e.target.classList.contains('add-cart')) {
          addToCart(e.target.dataset.id, 1);
          return;
        }
      });

      // modal actions
      document.getElementById('modal-close').addEventListener('click', closeModal);
      document.getElementById('modal').addEventListener('click', (ev)=> {
        if (ev.target.id === 'modal') closeModal();
      });
      document.getElementById('modal-add').addEventListener('click', (ev)=>{
        const id = ev.target.dataset.id;
        addToCart(id, 1);
        closeModal();
      });

      // cart item controls (inc/dec/rm)
      document.getElementById('cart-items').addEventListener('click', (e)=>{
        const id = e.target.dataset.id;
        if (!id) return;
        if (e.target.classList.contains('inc')) {
          addToCart(id, 1);
        } else if (e.target.classList.contains('dec')) {
          CART[id] = (CART[id] || 0) - 1;
          if (CART[id] <= 0) delete CART[id];
          saveCart();
        } else if (e.target.classList.contains('rm')) {
          removeFromCart(id);
        }
      });

      // checkout button
      document.getElementById('checkout-btn').addEventListener('click', ()=>{
        const count = Object.values(CART).reduce((s,n)=>s+n,0);
        if (count === 0) {
          alert('Tu carrito está vacío — agrega al menos un artículo.');
          return;
        }
        // Simple checkout flow: show alert with summary and payment instructions
        const subtotal = Object.entries(CART).reduce((s,[id,qty])=>{
          const p = PRODUCTS.find(x=>x.id===id); return s + (p ? p.price * qty : 0);
        },0);
        const total = subtotal + SHIPPING;
        let itemsList = Object.entries(CART).map(([id,qty])=>{
          const p = PRODUCTS.find(x=>x.id===id);
          return `${p.title} x${qty} — ${formatCOP(p.price * qty)}`;
        }).join('\n');

        const message = `Resumen:\n${itemsList}\n\nSubtotal: ${formatCOP(subtotal)}\nEnvio: ${formatCOP(SHIPPING)}\nTotal: ${formatCOP(total)}\n\nPara pagar puedes usar:\n- Nequi / Daviplata: 3148302876\n- O pago en efectivo en puntos Efecty.\n\nEnvía comprobante a info@gastronomiauniversal.com o +57 300 123 4567.`;
        alert(message);
      });

      // Registration form (very simple, no backend)
      document.getElementById('registration-form').addEventListener('submit', (e)=>{
        e.preventDefault();
        const form = e.target;
        const name = form.name.value.trim();
        const email = form.email.value.trim();
        const pass = form.password.value;
        const pass2 = form.password2.value;
        if (pass !== pass2) return alert('Las contraseñas deben coincidir.');
        alert(`¡Gracias ${name}! Registro simulado correcto — revisa tu correo (${email}).`);
        form.reset();
      });

      // toggle search panel
      document.getElementById('toggle-search').addEventListener('click', ()=>{
        const panel = document.getElementById('search-panel');
        panel.classList.toggle('hidden');
      });

      // live search input
      const searchInput = document.getElementById('search-input');
      if (searchInput) {
        searchInput.addEventListener('input', ()=> filterAndSort());
        document.getElementById('search-clear').addEventListener('click', ()=>{ searchInput.value=''; filterAndSort(); });
      }

      // mobile menu
      document.getElementById('btn-mobile-menu').addEventListener('click', ()=>{
        const m = document.getElementById('mobile-menu');
        m.classList.toggle('hidden');
      });

      // open cart button scroll
      document.getElementById('open-cart').addEventListener('click', ()=> {
        document.getElementById('pagos').scrollIntoView({behavior:'smooth'});
      });

      // bind global clicks for dynamically created 'add-cart' buttons inside modal and other places (already handled)
    });

    /* ---------- Populate initial filtered view ---------- */
    // we want the top popular first
    document.addEventListener('DOMContentLoaded', filterAndSort);

    /* ---------- Simple star field generator ---------- */
    (function createStars(){
      const starsContainer = document.getElementById('stars');
      const count = 100;
      for (let i=0;i<count;i++){
        const s = document.createElement('div');
        s.className = 'star';
        const size = Math.random()*2 + 0.6;
        s.style.width = `${size}px`;
        s.style.height = `${size}px`;
        s.style.top = `${Math.random()*100}%`;
        s.style.left = `${Math.random()*100}%`;
        s.style.opacity = (Math.random()*0.8 + 0.15).toString();
        s.style.animationDelay = `${Math.random()*3}s`;
        starsContainer.appendChild(s);
      }
    })();

    /* ---------- Rotating phrases ---------- */
    (function rotatePhrases(){
      const phrases = [
        'Buen provecho — disfruta cada bocado.',
        'Sabores del mundo, cerca de ti.',
        'Cada plato cuenta una historia.',
        'Cocina auténtica y experiencias memorables.',
        'De nuestras manos a tu mesa.',
        'La cocina es el idioma del amor.',
        'Viaja con tu paladar por todos los continentes.',
        'El arte culinario une culturas.',
        'Sabores tradicionales con toque moderno.',
        'Cada bocado es una experiencia inolvidable.'
      ];
      let idx = 0;
      const el = document.getElementById('phrase-text');
      setInterval(()=>{
        idx = (idx+1) % phrases.length;
        el.classList.add('opacity-0','translate-y-2');
        setTimeout(()=> {
          el.textContent = phrases[idx];
          el.classList.remove('opacity-0','translate-y-2');
        }, 300);
      }, 4500);
    })();

  </script>
</body>
</html>
```