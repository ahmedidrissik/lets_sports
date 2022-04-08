import { Controller } from "stimulus"
import Swal from 'sweetalert2';

export default class extends Controller {

  valider(event) {
    const csrfToken = document.getElementsByName('csrf-token')[0].content;
    fetch(`/bookings/${this.element.dataset.id}`, {
      method: 'PATCH',
      headers: {
        "X-CSRF-Token": csrfToken,
        'Accept': 'text/plain',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        status: 'confirmé',
      })
    }).then((response) => response.text()).then((data) => {
      //this.detailsTarget.innerHTML = data;
      Swal.fire(
        'Réservation confirmée',
        'Bon match !',
        'success'
      );
    })
  }

  refuser() {
    const csrfToken = document.getElementsByName('csrf-token')[0].content;
    fetch(`/bookings/${this.element.dataset.id}`, {
      method: 'PATCH',
      headers: {
        "X-CSRF-Token": csrfToken,
        'Accept': 'text/plain',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        status: 'refusé',
      })
    }).then((response) => response.text()).then((data) => {
      //this.detailsTarget.innerHTML = data;
      Swal.fire(
        'Réservation refusée',
        'miskine !',
        'error'
      );
    })
  }
}
