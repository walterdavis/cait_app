import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

// Connects to data-controller="custom"
export default class extends Controller {
  static targets = ["field"]

  connect() {
  }

  async customize(evt) {
    if (!this.hasFieldTarget) return;
    if (!evt.target.value || evt.target.value == '') {
      this.fieldTarget.innerHTML = '';
      return;
    }

    const response = await get(`/shapes/${evt.target.value}`);
    if (response.ok) {
      const body = await response.html;
      this.fieldTarget.innerHTML = body;
    };
  }
}
