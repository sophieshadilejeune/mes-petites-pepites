import Shuffle from 'shufflejs';


const element = document.querySelector('.my-shuffle-container');

const categoryButtonAll = document.querySelector("#category-button-all")

const categoryButton = document.querySelectorAll("#category-button");

const toggle = document.querySelector('input[type="checkbox"]')

const textSwitch = document.querySelector("#text-switch")

const allPlaces = document.querySelectorAll(".shuffle-item-visitor")

const userPlaces = document.querySelectorAll(".shuffle-item-user")



const ShowAllHideUser = () => {
  allPlaces.forEach((place) => {
    place.classList.remove("disabled")
});
     userPlaces.forEach((place) => {
      place.classList.add("disabled")
  });
};

const ShowUserHideAll = () => {
   userPlaces.forEach((place) => {
      place.classList.remove("disabled")
  });
     allPlaces.forEach((place) => {
    place.classList.add("disabled")
});
};

const initActionCategoryButton = (shuffleInstanceUser, shuffleInstanceVisitor) => {
  categoryButton.forEach((button) => {
      button.addEventListener("click", (event) => {
        categoryButton.forEach((button) => {
          button.classList.remove("category-active")
        });
        event.currentTarget.classList.add("category-active")
        categoryButtonAll.classList.remove("category-active")
        const category = event.currentTarget.innerText;
        if (toggle){
        if (toggle.checked){
          ShowUserHideAll();
          console.log("true, checked")
          shuffleInstanceUser.filter([`${category}`, "Default"]);
        } else {
          console.log("false, unchecked")
          ShowAllHideUser();
          shuffleInstanceVisitor.filter([`${category}`, "Default"]);
        };
      } else {
        console.log("no-toggle")
        shuffleInstanceVisitor.filter([`${category}`, "Default"]);
      };
      });
    });
};

const initActionCategoryButtonAll = (shuffleInstanceUser, shuffleInstanceVisitor) => {
  categoryButtonAll.addEventListener("click", (event) => {
    if (toggle) {
      if (toggle.checked) {
        ShowUserHideAll();
        shuffleInstanceUser.filter(Shuffle.ALL_ITEMS);
      } else {
        ShowAllHideUser();
        shuffleInstanceVisitor.filter(Shuffle.ALL_ITEMS);
      };
    } else {
        shuffleInstanceVisitor.filter(Shuffle.ALL_ITEMS);
    } ;
      categoryButtonAll.classList.add("category-active")
      categoryButton.forEach((button) => {
        button.classList.remove("category-active")
      });
    });
};

const initActionToggle = (shuffleInstanceVisitor, shuffleInstanceUser) => {
  if (toggle) {
      toggle.addEventListener("change", (event) => {
      const cityName = document.querySelector("#category-button-all").innerText
      console.log(cityName)
      const category = document.querySelector(".category-active");
      if (toggle.checked) {
        textSwitch.innerText = "ON : Displaying only my Pépites"
        textSwitch.classList.add("on")
        ShowUserHideAll();

        if (category.innerText === cityName) {
          shuffleInstanceUser.filter(Shuffle.ALL_ITEMS);
        } else {
        shuffleInstanceUser.filter([`${category.innerText}`, "Default"]);

        };
      } else {
        textSwitch.innerText = "OFF : Displaying everybody's Pépites"
        textSwitch.classList.remove("on")
        ShowAllHideUser();

        if (category.innerText === cityName) {

          shuffleInstanceVisitor.filter(Shuffle.ALL_ITEMS);
        } else {
        shuffleInstanceVisitor.filter([`${category.innerText}`, "Default"]);
      };
      };

    });

    };
    };

const initShuffle = () => {

  if (element) {

    const shuffleInstanceAll = new Shuffle (element, { itemSelector: '.shuffle-item-all',
    });

    const shuffleInstanceUser = new Shuffle (element, { itemSelector: '.shuffle-item-user',
    });

    const shuffleInstanceVisitor = new Shuffle (element, { itemSelector: '.shuffle-item-visitor',
    });

initActionCategoryButton(shuffleInstanceUser, shuffleInstanceVisitor);
initActionCategoryButtonAll(shuffleInstanceUser, shuffleInstanceVisitor);
initActionToggle(shuffleInstanceVisitor, shuffleInstanceUser);

  };
};

export { initShuffle };
