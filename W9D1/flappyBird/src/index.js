import FlappyBird from './game';

window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById('bird-game');
  let flappyBird = new FlappyBird(canvas);
  // flappyBird.restart();
});


