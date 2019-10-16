// canvas, context, and ship.

// sets game view to animate game

const Game = require('./game.js');

GameView.IMPULSE = {
  up: [0, -2],
  down: [0, 2],
  left: [-2, 0],
  right: [2, 0]
};

function GameView (ctx) {
  this.context = ctx;
  this.game = new Game();
}

GameView.prototype.start = function () {
  this.bindKeyHandlers();
  let that = this;
  
  setInterval(function () {
    that.game.step(that.context);
    that.game.draw(that.context);
  }, 20);
};

GameView.prototype.bindKeyHandlers = function () {
  key('up', this.game.ship.power.bind(this.game.ship, GameView.IMPULSE.up));
  key('left', this.game.ship.power.bind(this.game.ship, GameView.IMPULSE.left));
  key('down', this.game.ship.power.bind(this.game.ship, GameView.IMPULSE.down));
  key('right', this.game.ship.power.bind(this.game.ship, GameView.IMPULSE.right));
};

module.exports = GameView;