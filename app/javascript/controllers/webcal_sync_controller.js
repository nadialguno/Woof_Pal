import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    const hourOffset = (new Date().getTimezoneOffset()) / 60
    this.element.href = `${this.element.href}?hour_offset=${hourOffset}`
  }
}
