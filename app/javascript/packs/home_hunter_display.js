const homeButton = document.querySelector("#home_button");

const initHuntersList = () => {

console.log(homeButton);
homeButton.addEventListener("click", (event) => {
homeButton.insertAdjacentHTML("beforeend",
  '<ul><li>hello</li></ul>')
});
};


export { initHuntersList };
