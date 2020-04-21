const placeCards = document.querySelectorAll("#place_card");

const hoverOnCard = () => {

  placeCards.forEach((placeCard) => {
    const cardOptions = placeCard.querySelectorAll(" .card-options");
    cardOptions.forEach((option) => {
    placeCard.addEventListener("mouseover", (event) => {
    option.classList.remove("disabled");
  });
  placeCard.addEventListener("mouseleave", (event) => {
    option.classList.add("disabled");
  });
});
});


};
export { hoverOnCard };
