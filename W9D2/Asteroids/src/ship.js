const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

Util.inherits(Ship, MovingObject);

const HEX_DIGITS = "0123456789ABCDEF";

function Ship (posObj, game) {

  let options = {
    pos: posObj.pos,
    vel: Util.randomVec(0),
    radius: Ship.RADIUS,
    color: Ship.COLOR,
    game: game
  };

  MovingObject.call(this, options);

}

Ship.MAXVELOCITY = 10;

Ship.randomColor = function () {
  let color = "#";
  for (let i = 0; i < 6; i++) {
    color += HEX_DIGITS[Math.floor((Math.random() * 16))];
  }

  return color;
};

Ship.prototype.relocate = function () {
  this.vel = Util.randomVec(0);
  this.pos = this.game.randomPosition().pos;
  this.color = Ship.randomColor();
};

Ship.prototype.power = function (impulse) {
  if ((this.vel[0] + impulse[0] < Ship.MAXVELOCITY) && 
    (this.vel[1] + impulse[1] < Ship.MAXVELOCITY)) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
  } 
};

Ship.RADIUS = 15;
Ship.COLOR = Ship.randomColor();

module.exports = Ship;