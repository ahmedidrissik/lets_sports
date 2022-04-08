import { Controller } from "stimulus"
import Swal from 'sweetalert2';

export default class extends Controller {
  static targets = ["details", "data"]

  connect() {
    console.log(this.dataTarget, this.detailsTarget)
  }

  confirm(event) {
    const gameId = this.dataTarget.dataset.gameId;
    const playerId = this.dataTarget.dataset.playerId;
    const csrfToken = document.getElementsByName('csrf-token')[0].content;
    console.log(gameId, playerId, csrfToken)
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
      this.detailsTarget.innerHTML = data;
      document.getElementById("confirmation").classList.add("d-none")
      document.getElementById("annulation").classList.remove("d-none")
      Swal.fire(
        'Réservation envoyée !',
        'En attente de confirmation',
        'success'
      );
    })
  }

  cancel() {
    const bookingId = this.dataTarget.dataset.bookingId;
    const csrfToken = document.getElementsByName('csrf-token')[0].content;
    console.log(bookingId, csrfToken)
    fetch(`/bookings/${bookingId}`, {
      method: 'DELETE',
      headers: {
        "X-CSRF-Token": csrfToken,
        'Accept': 'text/plain',
        'Content-Type': 'application/json'
      },

    }).then((response) => response.text()).then((data) => {
      this.detailsTarget.innerHTML = data;
      document.getElementById("confirmation").classList.remove("d-none")
      document.getElementById("annulation").classList.add("d-none")
      Swal.fire(
        'Réservation annulée',
        'à une prochaine fois !',
        'error'
      );
    })
  }
}
