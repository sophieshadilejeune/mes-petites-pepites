require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import { hoverOnCard } from './card_hover';
import { navbarCollapse } from './navbar_collapse';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete'
import { initShuffle } from '../plugins/init_shuffle'

hoverOnCard();
navbarCollapse();
initMapbox();
initAutocomplete();
initShuffle();
