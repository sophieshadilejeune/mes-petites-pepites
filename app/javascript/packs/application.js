require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import { hoverOnCard } from './card_hover';
import { navbarCollapse } from './navbar_collapse';

hoverOnCard();
navbarCollapse();
