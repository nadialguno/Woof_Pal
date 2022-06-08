import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "preview"]

  connect() {
    this.reader = new FileReader();

    this.reader.onload = (e) => this.#loadReader(e);

  }

  previewFile() {
    if (this.inputTarget.files[0]) this.reader.readAsDataURL(this.inputTarget.files[0]);
  }

  #loadReader(event) {
    this.previewTarget.src = event.target.result
  }
}
