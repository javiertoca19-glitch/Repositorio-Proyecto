/* ---------- Rotador de Frases Culturales ---------- */
(function rotatePhrases() {
  const phrases = [
    'Buen provecho — disfruta cada bocado.',
    'Sabores del mundo, cerca de ti.',
    'Cada plato cuenta una historia.',
    'El arte culinario une culturas.',
    'Viaja con tu paladar por todos los continentes.',
    'La cocina es el idioma del amor.'
  ];

  const el = document.getElementById("phrase-text");
  let index = 0;

  function changePhrase() {
    el.classList.add("opacity-0");

    setTimeout(() => {
      index = (index + 1) % phrases.length;
      el.textContent = phrases[index];
      el.classList.remove("opacity-0");
    }, 300);
  }

  setInterval(changePhrase, 4000);
})();
