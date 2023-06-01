import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log('hello')
    new flatpickr(this.element, {
      enableTime: false,
      minDate: 'today'
  })
  }
}
