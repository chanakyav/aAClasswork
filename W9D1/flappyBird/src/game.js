import Level from "./level"
import Bird from "./bird"

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    // this.restart();
  }

  restart() {
    let level = new Level(this.dimensions);
    this.animate(level.drawBackground);
    let bird = new Bird(this.dimensions);
    
  }

  animate(method) {
    // console.log(obj);
    // console.log(method);
    
    
    method(this.ctx);
  }
}