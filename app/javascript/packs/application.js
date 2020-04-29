require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";


import { hoverOnCard } from './card_hover';
import { navbarCollapse } from './navbar_collapse';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete'
import { initShuffle } from '../plugins/init_shuffle';
import { initHuntersList } from './home_hunter_display';
import { initSelect2, searchUser } from '../plugins/init_select2';


hoverOnCard();
navbarCollapse();
initMapbox();
initAutocomplete();
// initHuntersList();
initSelect2();
searchUser();
initShuffle();



