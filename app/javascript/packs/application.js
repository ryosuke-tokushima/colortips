// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require common.js
//= require cable.js

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import '@fortawesome/fontawesome-free/js/all';
import MagicGrid from 'magic-grid';
window.MagicGrid = MagicGrid;


Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
    const magicGrid = new MagicGrid({
      container: '.container-magic-grid',
      animate: true,
      gutter: 2,
      static: true,
      useMin: true,
    });
    magicGrid.listen();
});

$(document).on("click", ".action-buttons .dropdown-menu", function(e){
	e.stopPropagation();
});