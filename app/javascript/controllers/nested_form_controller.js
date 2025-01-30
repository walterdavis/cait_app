import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["add_item", "template"]

  connect(){
  }

  add_association(event) {
    event.preventDefault();
    var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().valueOf());
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content);
    this.add_itemTarget.scrollIntoView();
  }

  remove_association(event) {
    event.preventDefault();
    let item = event.target.closest(".nested-fields");
    item.querySelector("input[name*='_destroy']").value = 1;
    item.querySelectorAll("select").forEach((elm) => {
      elm.removeAttribute('required');
    });
    item.style.display = 'none';
  }
}
