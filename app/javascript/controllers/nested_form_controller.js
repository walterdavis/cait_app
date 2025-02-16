import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["add_item", "template"]

  connect(){
    this.protect_last_element();
  }

  add_association(event) {
    event.preventDefault();
    const id = `nf_${new Date().valueOf()}`;
    var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, id);
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content);
    this.add_itemTarget.scrollIntoView();
    this.protect_last_element();
  }

  remove_association(event) {
    event.preventDefault();
    let item = event.target.closest(".nested-fields");
    let destroyer = item.querySelector("input[name*='_destroy']")
    destroyer.value = 1;
    destroyer.form.appendChild(destroyer);
    const evt = new CustomEvent("product:updated", { bubbles: true });
    item.remove();
    this.protect_last_element();
    destroyer.dispatchEvent(evt);
  }

  protect_last_element() {
    const eggs = this.element.querySelectorAll('.nested-fields .btn-close');
    if (eggs.length > 1) {
      eggs.forEach((elm) => {
        elm.classList.remove('suppressed');
      });
    } else {
      eggs.forEach((elm) => {
        elm.classList.add('suppressed');
      });
    }
  }
}
