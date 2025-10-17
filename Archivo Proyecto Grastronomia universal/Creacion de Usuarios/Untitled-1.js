/* ============================
   Gastronomía Universal - JS
   ============================ */

/* ---- Generar estrellas animadas ---- */
function generarEstrellas() {
  const starsContainer = document.getElementById("stars");
  if (!starsContainer) return;

  const numStars = 60; // cantidad de estrellas
  for (let i = 0; i < numStars; i++) {
    const star = document.createElement("div");
    star.classList.add("star");

    const size = Math.random() * 3 + 1; // tamaño entre 1 y 4px
    star.style.width = `${size}px`;
    star.style.height = `${size}px`;

    star.style.top = `${Math.random() * 100}%`;
    star.style.left = `${Math.random() * 100}%`;

    // velocidad de parpadeo distinta
    star.style.animationDuration = `${Math.random() * 3 + 2}s`;

    starsContainer.appendChild(star);
  }
}

/* ---- Validación de login ---- */
function validarLogin(e) {
  e.preventDefault();
  const email = document.getElementById("email").value.trim();
  const pass = document.getElementById("password").value.trim();

  if (email === "" || pass === "") {
    alert("⚠️ Por favor complete todos los campos.");
    return false;
  }

  // Simulación de autenticación
  if (email === "admin@demo.com" && pass === "1234") {
    alert("✅ Bienvenido a Gastronomía Universal");
    window.location.href = "menu.html";
  } else {
    alert("❌ Credenciales incorrectas");
  }
}

/* ---- Carrito de compras ---- */
let carrito = [];

function agregarAlCarrito(nombre, precio) {
  carrito.push({ nombre, precio });
  actualizarCarrito();
}

function actualizarCarrito() {
  const lista = document.getElementById("carrito-lista");
  const total = document.getElementById("carrito-total");

  if (!lista || !total) return;

  lista.innerHTML = "";
  let suma = 0;

  carrito.forEach((item, i) => {
    const li = document.createElement("li");
    li.textContent = `${item.nombre} - $${item.precio.toLocaleString("es-CO")}`;
    lista.appendChild(li);
    suma += item.precio;
  });

  total.textContent = `Total: $${suma.toLocaleString("es-CO")}`;
}

/* ---- Mostrar modal con más detalles ---- */
function verDetalles(nombre, descripcion, precio, img) {
  const modal = document.getElementById("modal");
  const modalContent = document.getElementById("modal-content");

  if (!modal || !modalContent) return;

  modal.style.display = "flex";
  modalContent.innerHTML = `
    <img src="${img}" alt="${nombre}" class="w-full h-48 object-cover rounded-lg mb-3">
    <h3 class="text-xl font-bold mb-2">${nombre}</h3>
    <p class="mb-2">${descripcion}</p>
    <p class="font-semibold text-yellow-400 mb-3">$${precio.toLocaleString("es-CO")}</p>
    <button class="btn" onclick="agregarAlCarrito('${nombre}', ${precio})">🛒 Agregar al carrito</button>
    <button class="btn-hover mt-2" onclick="cerrarModal()">Cerrar</button>
  `;
}

function cerrarModal() {
  const modal = document.getElementById("modal");
  if (modal) modal.style.display = "none";
}

/* ---- Inicialización ---- */
document.addEventListener("DOMContentLoaded", () => {
  generarEstrellas();

  const formLogin = document.getElementById("form-login");
  if (formLogin) {
    formLogin.addEventListener("submit", validarLogin);
  }
});
