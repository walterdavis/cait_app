import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="subtotal"
export default class extends Controller {
  static targets = ["line", "footer"];

  connect() {
    document.addEventListener('product:updated', (evt) => {
      this.update();
    });

    this.update();
  }

  update() {
    const lines = this.lineTargets.map((line) => {
      return parseInt(line.dataset.extended, 10);
    });

    const subtotal = lines.reduce((acc, val) =>
      acc + val, 0,
    );
    this.footerTarget.innerText = `Subtotal: ${this.formatted(subtotal)}`;
  }

  formatted(subtotal) {
    subtotal = parseInt(subtotal, 10);
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(subtotal);
  }
}
