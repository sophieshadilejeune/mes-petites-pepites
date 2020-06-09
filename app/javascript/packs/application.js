require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



import "bootstrap";
// import '@client-side-validations/client-side-validations'
// import '@client-side-validations/simple-form/dist/simple-form.bootstrap4'



import { hoverOnCard } from './card_hover';
import { navbarCollapse } from './navbar_collapse';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete'
import { initShuffle } from '../plugins/init_shuffle';
import { initSelect2, addCityToUser, chooseCityDashboard, visitorPageUser,visitorPageCity, moveToAnotherCity, moveToAnotherCityUser } from '../plugins/init_select2';

// hoverOnCard();
navbarCollapse();
initAutocomplete();
// initHuntersList();
initSelect2();
addCityToUser();
chooseCityDashboard();
visitorPageUser();
visitorPageCity();
moveToAnotherCity();
moveToAnotherCityUser();
initShuffle();
  initMapbox();

