import Rails from '@rails/ujs';
import jQuery from 'jquery';
window.jQuery = jQuery;
window.$ = jQuery;

import 'admin-lte/plugins/bootstrap/js/bootstrap.bundle.min';
import 'admin-lte/dist/js/adminlte.min';

Rails.start();

$(document).ready(function () {
  $('[data-widget="pushmenu"]').PushMenu();
});