import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ["quantity", "shape", "output"];

  connect() {
    this.outputTarget.innerText = '$0.00';
  }

  async update(evt) {
    if (!!!this.shapeTarget.value || this.quantityTarget.value < 1 || this.shapeTarget.value < 1) {
      this.outputTarget.innerText = '$0.00';
      return false;
    }

    const response = await get(`/prices/${this.shapeTarget.value}?num=${this.quantityTarget.value}`);
    if (response.ok) {
      const price = await response.text;
      this.outputTarget.innerText = this.formatted(price);
      this.outputTarget.dataset.extended = price;
      const event = new CustomEvent("product:updated", { bubbles: true });
      this.outputTarget.dispatchEvent(event);
    };
  }

  formatted(price) {
    price = parseInt(price, 10);
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(price);
  }
}
