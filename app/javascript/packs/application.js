// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

import Swal from 'sweetalert2';
document.getElementById('confirmation').addEventListener('click', (event) => {
  const gameId = document.getElementById('game-data').dataset.gameId;
  const playerId = document.getElementById('game-data').dataset.playerId;
  const csrfToken = document.getElementsByName('csrf-token')[0].content;
  fetch('/bookings', {
    method: 'POST',
    headers: {
      "X-CSRF-Token": csrfToken,
      'Accept': 'text/plain',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      game_id: gameId,
      player_id: playerId,
      status: 'en attente',
    })
  }).then((response) => response.text()).then((data) => {
    document.getElementById("game-details").innerHTML = data;
    document.getElementById("confirmation").classList.add("d-none")
    document.getElementById("annulation").classList.remove("d-none")
    Swal.fire(
      'Good job!',
      'You clicked the button!',
      'success'
    );
  })
})

document.getElementById('annulation').addEventListener('click', (event) => {
  const bookingId = document.getElementById('game-data').dataset.bookingId;
  const csrfToken = document.getElementsByName('csrf-token')[0].content;
  fetch(`/bookings/${bookingId}`, {
    method: 'DELETE',
    headers: {
      "X-CSRF-Token": csrfToken,
      'Accept': 'text/plain',
      'Content-Type': 'application/json'
    },

  }).then((response) => response.text()).then((data) => {
    document.getElementById("game-details").innerHTML = data;
    document.getElementById("confirmation").classList.remove("d-none")
    document.getElementById("annulation").classList.add("d-none")
    Swal.fire(
      'Réservation annulée',
      'à une prochaine fois !',
      'success'
    );
  })
})
