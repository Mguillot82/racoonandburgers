import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = [ "element" ] // à remplacer par votre cible

  connect() {
    window.addEventListener('scroll', this.checkScroll.bind(this))
  }

  disconnect() {
    window.removeEventListener('scroll', this.checkScroll.bind(this))
  }

  checkScroll() {
    let scrollPosition = window.scrollY
    let documentHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight

    // Calcule le pourcentage de défilement
    let scrollPercentage = (scrollPosition / documentHeight) * 100;

    // Si le pourcentage de défilement est supérieur à 20, ajoute la classe 'd-none'
    // sinon, retire la classe 'd-none'
    this.elementTarget.classList.toggle('d-none', scrollPercentage > 14)
  }
}
