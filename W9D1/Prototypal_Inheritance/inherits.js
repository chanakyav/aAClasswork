Function.prototype.inherits = function(parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
  return this;
}

function MovingObject() { 
  this.moving = true;
}

MovingObject.prototype.isMoving = function() {
  console.log("I'm moving");
}

function Ship() { }
function Asteroid() { }

Ship.inherits(MovingObject);
Asteroid.inherits(MovingObject);


Ship.prototype.floating = function() {
  console.log("I'm currently floating!");
}

Asteroid.prototype.inSpace = function () {
  console.log("I'm currently in space!");
}

let ship = new Ship();
let asteroid = new Asteroid();
let movingObject = new MovingObject();