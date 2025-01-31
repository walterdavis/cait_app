import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

// Connects to data-controller="custom"
export default class extends Controller {
  static targets = ["field"]

  connect() {
    if (!this.hasFieldTarget) {
      return console.error('Custom field not properly configured')
    }

    this.fieldTarget.classList.add('visually-hidden');
  }

  async customize(evt) {
    if (!this.hasFieldTarget) return;
    if (!evt.target.value || evt.target.value == '') {
      this.fieldTarget.classList.add('visually-hidden');
      return;
    }

    const response = await get(`/shapes/${evt.target.value}`);
    if (response.ok) {
      const kind = await response.text;
      if (kind == 'custom') {
        this.fieldTarget.classList.remove('visually-hidden');
        this.fieldTarget.scrollIntoView();
      }
    };
  }
}
