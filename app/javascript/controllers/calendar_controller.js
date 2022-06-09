import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["day", "month", "weekday"]

  connect() {
    const time = new Date();
    const locale = "en-gb";

    const DD   = time.getDate();
    const DDD  = time.toLocaleString(locale, {weekday: "long" });
    const MMM  = time.toLocaleString(locale, {month:   "short"}).toUpperCase();

    this.dayTarget.textContent= DD;
    this.weekdayTarget.textContent= DDD;
    this.monthTarget.textContent= MMM;
  }
}
