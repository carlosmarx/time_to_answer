// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all";

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import Swal from 'sweetalert2/dist/sweetalert2'
import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal

Rails.start()
// Turbolinks.start()
ActiveStorage.start()
require("@nathanvda/cocoon")

window.jQuery = $;
window.$ = $;

