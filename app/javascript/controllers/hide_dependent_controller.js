import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-dependent"
export default class extends Controller {
  static values = {
    target: String,
    condition: String
  };

  visibility () {
    console.log(this.element)
    document.querySelectorAll(this.targetValue).forEach( (elm) => {
      if (this.element.matches(this.conditionValue)) {
        elm.classList.add('visually-hidden');
      } else {
        elm.classList.remove('visually-hidden');
      }
    });
  }
}
