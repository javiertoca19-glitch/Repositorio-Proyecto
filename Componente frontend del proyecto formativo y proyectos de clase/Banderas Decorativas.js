/* ---------- Banderas Decorativas ---------- */

(function showFlags() {
  const flags = ["🇲🇽", "🇯🇵", "🇮🇹", "🇫🇷", "🇧🇷", "🇪🇸", "🇺🇸", "🇨🇴"];

  const container = document.getElementById("banderas-zone");

  flags.forEach((flag, i) => {
    const span = document.createElement("span");
    span.textContent = flag;
    span.className = "absolute text-6xl opacity-30 floaty";
    span.style.top = `${20 + i * 4}%`;
    span.style.left = `${10 + (i % 3) * 15}%`;
    span.style.animationDelay = `${i * 0.6}s`;
    container.appendChild(span);
  });
})();
