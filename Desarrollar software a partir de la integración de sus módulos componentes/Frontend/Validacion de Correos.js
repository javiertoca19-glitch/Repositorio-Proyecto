/* ---------- Validación de Correo en Registro ---------- */

document.getElementById("email").addEventListener("input", function () {
  const email = this.value;
  const errorMsg = document.getElementById("email-error");

  // RegEx para validar correo
  const validEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if (!validEmail.test(email)) {
    errorMsg.textContent = "⚠ El correo está mal escrito. Ej: usuario@gmail.com";
    errorMsg.classList.remove("hidden");
    this.classList.add("border-red-500");
  } else {
    errorMsg.classList.add("hidden");
    this.classList.remove("border-red-500");
  }
});
