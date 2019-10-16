function MovingObject (options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI
  );
  ctx.fill();
};

MovingObject.prototype.move = function() {
  pos = this.game.wrap([
    this.pos[0] + this.vel[0], 
    this.pos[1] + this.vel[1] ]);
  
  this.pos[0] = pos[0];
  this.pos[1] = pos[1];
};

MovingObject.prototype.isCollidedWith = function(otherObj) {
  let centerDistance = Math.sqrt(
    Math.pow(this.pos[0] - otherObj.pos[0], 2) + 
    Math.pow(this.pos[1] - otherObj.pos[1], 2) );

  let radiiSum = this.radius + otherObj.radius;

  return centerDistance < radiiSum;
};

MovingObject.prototype.collideWith = function (otherObj) {
  // this.game.remove(this);
  // this.game.remove(otherObj);
};

module.exports = MovingObject;