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
  static targets = [ "output" ]

  over(event) {
    console.log(event);
    const target = event.target;
    target.innerHTML = 'Unfollow';
    target.classList.remove('following')
    target.classList.add('unfollow')

  }

  out(event) {
    console.log(event);
    const target = event.target;
    target.innerHTML = 'Following';
    target.classList.add('following')
    target.classList.remove('unfollow')

  }
}
