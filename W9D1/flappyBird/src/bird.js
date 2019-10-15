class Bird {
  constructor(dimensions) {
    this.dimensions = dimensions;
    this.velocity = 0;
    this.position = { x: this.dimensions.width / 3, y: this.dimensions.height / 2};
  }

  drawBird(ctx) {
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.position.x, this.position.y, 40, 30);
  }

  // animate(bird) {
  //   bird.drawBird();
  // }
}