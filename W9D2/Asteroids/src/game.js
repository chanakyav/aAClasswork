const Asteroid = require('./asteroid.js');
const Ship = require('./ship.js');

Game.DIM_X = 1000;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 4;

function Game () {
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship (this.randomPosition(), this);
  this.bullets = [];
}

Game.prototype.allObjects = function () {
  return this.asteroids.concat(this.ship);
};

Game.prototype.randomPosition = function () {
  let x = Math.floor(Math.random() * (Game.DIM_X * 0.9));
  let y = Math.floor(Math.random() * (Game.DIM_Y * 0.9));
  return { pos: [x,y] };
};

Game.prototype.addAsteroids = function () {
  for (let i=0; i < Game.NUM_ASTEROIDS; i++) {
    let aster = new Asteroid (this.randomPosition(), this);
    this.asteroids.push(aster);
  }
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.allObjects().forEach( object => object.draw(ctx) );
};

Game.prototype.moveObjects = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.allObjects().forEach( object => object.move() );
};

Game.prototype.wrap = function (pos) {
  if (pos[0] < 0) {
    pos[0] += Game.DIM_X;
  } else if (pos[0] > Game.DIM_X) {
    pos[0] -= Game.DIM_X;
  }

  if (pos[1] < 0) {
    pos[1] += Game.DIM_Y;
  } else if (pos[1] > Game.DIM_Y) {
    pos[1] -= Game.DIM_Y;
  }

  return pos;
};

Game.prototype.checkCollisions = function() {
  let allObjs = this.allObjects();


  for (let i = 0; i < allObjs.length; i++) {
    for (let j = 0; j < allObjs.length; j++) {
      if (i !== j && 
        allObjs[i].isCollidedWith(allObjs[j])) 
      {
        if (allObjs[i].collideWith(allObjs[j])) return;
      }
    }
  }
};

Game.prototype.step = function (ctx) {
  this.moveObjects(ctx);
  this.checkCollisions();
};

Game.prototype.remove = function (asteroid) {
  for (let i = 0; i < this.asteroids.length; i++) {
    if (asteroid === this.asteroids[i]) {
      this.asteroids.splice(i, 1);
      return;
    }
  }
};

module.exports = Game;