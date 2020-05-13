import Shuffle from 'shufflejs';


const element = document.querySelector('.my-shuffle-container');

const categoryButtonAll = document.querySelector("#category-button-all")

const categoryButton = document.querySelectorAll("#category-button");

const toggle = document.querySelector('input[type="checkbox"]')

const textSwitch = document.querySelector("#text-switch")

const allPlaces = document.querySelectorAll(".shuffle-item-all")

const userPlaces = document.querySelectorAll(".shuffle-item-user")

const cityName = document.querySelector("#city-name")

const removeAllAddUser = () => {
  allPlaces.forEach((place) => {
    place.classList.remove("disabled")
});
     userPlaces.forEach((place) => {
      place.classList.add("disabled")
  });
};

const removeUserAddAll = () => {
   userPlaces.forEach((place) => {
      place.classList.remove("disabled")
  });
     allPlaces.forEach((place) => {
    place.classList.add("disabled")
});
};

const initActionCategoryButton = (shuffleInstance, shuffleInstanceUser, shuffleInstanceVisitor) => {
  categoryButton.forEach((button) => {
      button.addEventListener("click", (event) => {
        const category = event.currentTarget.innerText;
        if (toggle) {
        if (toggle.checked) {
          removeUserAddAll();
          shuffleInstanceUser.filter([`${category}`, "Default"]);
        } else {
          removeAllAddUser();
          shuffleInstance.filter([`${category}`, "Default"]);
        };

        } else {

          shuffleInstanceVisitor.filter([`${category}`, "Default"]);
        };

        categoryButton.forEach((button) => {
          button.classList.remove("category-active")
        });
        event.currentTarget.classList.add("category-active")
        categoryButtonAll.classList.remove("category-active")
      });
    });
};

const initActionCategoryButtonAll = (shuffleInstance, shuffleInstanceUser, shuffleInstanceVisitor) => {
  categoryButtonAll.addEventListener("click", (event) => {
    if (toggle) {
      if (toggle.checked) {
        removeUserAddAll();
        shuffleInstanceUser.filter(Shuffle.ALL_ITEMS);
      } else {
        removeAllAddUser();
        shuffleInstance.filter(Shuffle.ALL_ITEMS);
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

const initActionToggle = (shuffleInstance, shuffleInstanceUser) => {
  if (toggle) {
      toggle.addEventListener("click", (event) => {
      const category = document.querySelector(".category-active");
      if (toggle.checked) {
        textSwitch.innerText = "ON : Displaying only my Pépites"
        textSwitch.classList.add("on")
        removeUserAddAll();
        console.log(category);
        if (category.innerText === "See all Pépites in Melbourne") {
          shuffleInstanceUser.filter(Shuffle.ALL_ITEMS);
        } else {
        shuffleInstanceUser.filter([`${category.innerText}`, "Default"]);

        }
      } else {
        textSwitch.innerText = "OFF : Displaying everybody's Pépites"
        textSwitch.classList.remove("on")
        removeAllAddUser();
        if (category.innerText === 'See all Pépites in ${cityName}') {
          shuffleInstance.filter(Shuffle.ALL_ITEMS);
        } else {
        shuffleInstance.filter([`${category.innerText}`, "Default"]);
      };
      };

    });

    };
    };

const initShuffle = () => {

  if (element) {

    const shuffleInstance = new Shuffle (element, { itemSelector: '.shuffle-item-all',
    });

    const shuffleInstanceUser = new Shuffle (element, { itemSelector: '.shuffle-item-user',
    });

    const shuffleInstanceVisitor = new Shuffle (element, { itemSelector: '.shuffle-item-visitor',
    });

initActionCategoryButton(shuffleInstance, shuffleInstanceUser, shuffleInstanceVisitor);
initActionCategoryButtonAll(shuffleInstance, shuffleInstanceUser, shuffleInstanceVisitor);
initActionToggle(shuffleInstance, shuffleInstanceUser);

  };
};

export { initShuffle };
