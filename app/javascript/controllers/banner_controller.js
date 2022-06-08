// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Banner");
    let text = document.querySelector('.text-element');
    let dog = document.getElementById('dog');
    let sun = document.getElementById('sun');
    let grass = document.getElementById('grass');
    let header = document.getElementById('header');
    let logo = document.getElementById('logo');

    window.addEventListener('scroll', function(){
      let value = window.scrollY;

      text.style.transform = `translateY(${value * 0.5}px)`;
      grass.style.transform = `translateY(${value * 0.2}px)`;
      dog.style.transform = `translateY(${value * 0.5}px)`;
      sun.style.transform = `translateY(${value * 0.7}px)`;
      logo.style.transform = `translateY(${value * 0.8}px)`;

      header.style.top = value * 0.5 + 'px';
    })
  }

  // scroll(event) {

  // }
}
