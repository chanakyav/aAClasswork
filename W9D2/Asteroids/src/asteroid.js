const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');
const Ship = require('./ship.js');

Util.inherits(Asteroid, MovingObject);

Asteroid.COLOR = "#A9A9A9";
Asteroid.RADIUS = 25;

function Asteroid (posObj, game) {
  MovingObject.call(this, {
    pos: posObj.pos,
    vel: Util.randomVec(4),
    radius: Asteroid.RADIUS,
    color: Asteroid.COLOR,
    game: game
  }); 
}

Asteroid.prototype.collideWith = function(otherObj) {
  if (otherObj instanceof Ship) {
    this.game.ship.relocate();
    return true;
  }
};

module.exports = Asteroid;

