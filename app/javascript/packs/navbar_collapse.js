const navbarCollapseButton = document.querySelector(".navbar-toggler")
const navbarCollapseArea = document.querySelector(".navbar-collapse")

const navbarCollapse = () => {
console.log(navbarCollapseButton);
console.log(navbarCollapseArea);
navbarCollapseButton.addEventListener("click", (event) => {
navbarCollapseArea.classList.toggle("show")
});

};
export { navbarCollapse }
