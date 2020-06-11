require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//=require openlayers-rails



import "bootstrap";
// import '@client-side-validations/client-side-validations'
// import '@client-side-validations/simple-form/dist/simple-form.bootstrap4'



// import { hoverOnCard } from './card_hover';
// import { initTomtom } from '../plugins/init_tomtom';
import { navbarCollapse } from './navbar_collapse';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete'
import { initShuffle } from '../plugins/init_shuffle';
import { initSelect2, addCityToUser, chooseCityDashboard, visitorPageUser,visitorPageCity, moveToAnotherCity, moveToAnotherCityUser } from '../plugins/init_select2';

document.addEventListener('turbolinks:load', () => {

navbarCollapse();
initShuffle();
initMapbox();
//Select2 functions
initSelect2();
addCityToUser();
chooseCityDashboard();
visitorPageUser();
visitorPageCity();
moveToAnotherCity();
moveToAnotherCityUser();
// Address field autocomplete
initAutocomplete();
});

