import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

// Connects to data-controller="custom"
export default class extends Controller {
  connect() {
  }

  async customize() {
    const replaceMe = document.getElementById('custom_product_custom_text_wrapper');
    if (!replaceMe) return;

    const response = await get(`/shapes/${this.element.value}`);
    if (response.ok) {
      const body = await response.html;
      replaceMe.innerHTML = body;
    };
  }
}
