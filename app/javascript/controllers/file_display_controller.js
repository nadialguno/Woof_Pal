import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "preview"]

  connect() {
    var reader = new FileReader();

    reader.onload = function (e) {
      this.previewTarget.src = e.target.result
    };

  }

  previewFile() {
    if (this.inputTarget.files[0]) reader.readAsDataURL(this.inputTarget.files[0]);
  }
}
