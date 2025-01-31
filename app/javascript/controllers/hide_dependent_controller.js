import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-dependent"
export default class extends Controller {
  static values = {
    target: String,
    condition: String
  };

  connect () {
    this.visibility();
  }

  visibility () {
    document.querySelectorAll(this.targetValue).forEach( (elm) => {
      if (this.element.matches(this.conditionValue)) {
        elm.classList.add('visually-hidden');
        elm.querySelectorAll('input, textarea').forEach( (el) => {
          el.value = '';
        });
      } else {
        elm.classList.remove('visually-hidden');
      }
    });
  }
}
