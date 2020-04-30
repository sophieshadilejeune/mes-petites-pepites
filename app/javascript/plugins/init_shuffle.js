import Shuffle from 'shufflejs';


const element = document.querySelector('.my-shuffle-container');

const categoryButtonAll = document.querySelector("#category-button-all")

const categoryButton = document.querySelectorAll("#category-button");

const initShuffle = () => {

if (element) {

  const shuffleInstance = new Shuffle(element, {
  itemSelector: '.shuffle-item',
});

categoryButton.forEach((button) => {
  button.addEventListener("click", (event) => {
  const category = event.currentTarget.innerText;
  shuffleInstance.filter([`${category}`, "Default"]);
  categoryButton.forEach((button) => {
    button.classList.remove("category-active")
  });
  event.currentTarget.classList.add("category-active")
  categoryButtonAll.classList.remove("category-active")

});
});

categoryButtonAll.addEventListener("click", (event) => {
  shuffleInstance.filter(Shuffle.ALL_ITEMS);
  categoryButtonAll.classList.add("category-active")
  categoryButton.forEach((button) => {
  button.classList.remove("category-active")
});
});
};
};

export { initShuffle };
