const navbarCollapseButton = document.querySelector(".navbar-toggler")
const navbarCollapseArea = document.querySelector(".navbar-collapse")

const navbarCollapse = () => {
  if (navbarCollapseButton) {

navbarCollapseButton.addEventListener("click", (event) => {
navbarCollapseArea.classList.toggle("show")
});

  };

};
export { navbarCollapse }
