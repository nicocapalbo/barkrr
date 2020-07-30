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

  like(event) {
    // const target = event.target
    // console.log(event.target.id);
    const target = event.target
    // console.log(target)
    // console.log(event)
    const elemID = document.getElementById(`tweet-${target.dataset.tweetId}`);
    // console.log(elemID);
    fetch(`/tweets/${target.dataset.tweetId}/like`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        // console.log(data)
        const favCounter = document.getElementById(`fav-count-${target.dataset.tweetId}`);
        // console.log(favCounter)
        favCounter.innerHTML = data.count;

        if (data.like) {
          // elemID.classList.add('heart-follow')
          elemID.classList.add('fas')
          elemID.classList.remove('far')
          favCounter.classList.remove('counter-inactive')
          elemID.classList.remove('heart-inactive')
        } else {
          elemID.classList.remove('fas')
          elemID.classList.add('far')
          favCounter.classList.add('counter-inactive')
          elemID.classList.add('heart-inactive')
        }
    });
  }

  over(event) {
    const target = event.target
    const elemID = document.getElementById(`tweet-${target.dataset.tweetId}`);
    const favCounter = document.getElementById(`fav-count-${target.dataset.tweetId}`);
    elemID.classList.add('fa-heart-over')
    favCounter.classList.add('fav_counter-over')
  }

  out(event) {
    const target = event.target
    const elemID = document.getElementById(`tweet-${target.dataset.tweetId}`);
    const favCounter = document.getElementById(`fav-count-${target.dataset.tweetId}`);
    elemID.classList.remove('fa-heart-over')
    favCounter.classList.remove('fav_counter-over')
  }

  overRP(event) {
    const tar = event.target
    const elemIDRP = document.getElementById(`tweet-rp-${tar.dataset.tweetId}`);
    elemIDRP.classList.add('fa-comment-over')
  }

  outRP(event) {
    const tar = event.target
    const elemIDRP = document.getElementById(`tweet-rp-${tar.dataset.tweetId}`);
    elemIDRP.classList.remove('fa-comment-over')
  }

  overRT(event) {
    const tar = event.target
    const elemIDRT = document.getElementById(`tweet-rt-${tar.dataset.tweetId}`);
    elemIDRT.classList.add('fa-retweet-over')
  }

  outRT(event) {
    const tar = event.target
    const elemIDRT = document.getElementById(`tweet-rt-${tar.dataset.tweetId}`);
    elemIDRT.classList.remove('fa-retweet-over')
  }

  overSH(event) {
    const tar = event.target
    const elemIDRT = document.getElementById(`tweet-sh-${tar.dataset.tweetId}`);
    elemIDRT.classList.add('fa-external-link-alt-over')
  }

  outSH(event) {
    const tar = event.target
    const elemIDRT = document.getElementById(`tweet-sh-${tar.dataset.tweetId}`);
    elemIDRT.classList.remove('fa-external-link-alt-over')
  }

}
