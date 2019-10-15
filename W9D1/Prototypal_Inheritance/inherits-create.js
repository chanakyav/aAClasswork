Function.prototype.inherits = function (parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
}

function MovingObject() {
  this.moving = true;
}

MovingObject.prototype.isMoving = function () {
  console.log("I'm moving");
}

function Ship() { }
function Asteroid() { }

Ship.inherits(MovingObject);
Asteroid.inherits(MovingObject);


Ship.prototype.floating = function () {
  console.log("I'm currently floating!");
}

Asteroid.prototype.inSpace = function () {
  console.log("I'm currently in space!");
}

let ship = new Ship();
let asteroid = new Asteroid();
let movingObject = new MovingObject();