/* ---------- Rotador de Imágenes ---------- */
(function rotateImages() {
  const images = [
    "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    "https://images.unsplash.com/photo-1529692236671-f1ad6c31c9b8",
    "https://images.unsplash.com/photo-1543352632-4b7b0da1a6c5",
    "https://images.unsplash.com/photo-1601924582975-7d7b9c5cfbb6"
  ];

  const imgElement = document.getElementById("rotating-image");
  let index = 0;

  function changeImage() {
    imgElement.classList.add("opacity-0");

    setTimeout(() => {
      index = (index + 1) % images.length;
      imgElement.src = images[index];
      imgElement.classList.remove("opacity-0");
    }, 400);
  }

  setInterval(changeImage, 4000);
})();