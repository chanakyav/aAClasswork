/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.COLOR = \"#A9A9A9\";\nAsteroid.RADIUS = 25;\n\nfunction Asteroid (posObj, game) {\n  MovingObject.call(this, {\n    pos: posObj.pos,\n    vel: Util.randomVec(4),\n    radius: Asteroid.RADIUS,\n    color: Asteroid.COLOR,\n    game: game\n  }); \n}\n\nAsteroid.prototype.collideWith = function(otherObj) {\n  if (otherObj instanceof Ship) {\n    this.game.ship.relocate();\n    return true;\n  }\n};\n\nmodule.exports = Asteroid;\n\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nGame.DIM_X = 1000;\nGame.DIM_Y = 500;\nGame.NUM_ASTEROIDS = 4;\n\nfunction Game () {\n  this.asteroids = [];\n  this.addAsteroids();\n  this.ship = new Ship (this.randomPosition(), this);\n  this.bullets = [];\n}\n\nGame.prototype.allObjects = function () {\n  return this.asteroids.concat(this.ship);\n};\n\nGame.prototype.randomPosition = function () {\n  let x = Math.floor(Math.random() * (Game.DIM_X * 0.9));\n  let y = Math.floor(Math.random() * (Game.DIM_Y * 0.9));\n  return { pos: [x,y] };\n};\n\nGame.prototype.addAsteroids = function () {\n  for (let i=0; i < Game.NUM_ASTEROIDS; i++) {\n    let aster = new Asteroid (this.randomPosition(), this);\n    this.asteroids.push(aster);\n  }\n};\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n  this.allObjects().forEach( object => object.draw(ctx) );\n};\n\nGame.prototype.moveObjects = function(ctx) {\n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n  this.allObjects().forEach( object => object.move() );\n};\n\nGame.prototype.wrap = function (pos) {\n  if (pos[0] < 0) {\n    pos[0] += Game.DIM_X;\n  } else if (pos[0] > Game.DIM_X) {\n    pos[0] -= Game.DIM_X;\n  }\n\n  if (pos[1] < 0) {\n    pos[1] += Game.DIM_Y;\n  } else if (pos[1] > Game.DIM_Y) {\n    pos[1] -= Game.DIM_Y;\n  }\n\n  return pos;\n};\n\nGame.prototype.checkCollisions = function() {\n  let allObjs = this.allObjects();\n\n\n  for (let i = 0; i < allObjs.length; i++) {\n    for (let j = 0; j < allObjs.length; j++) {\n      if (i !== j && \n        allObjs[i].isCollidedWith(allObjs[j])) \n      {\n        if (allObjs[i].collideWith(allObjs[j])) return;\n      }\n    }\n  }\n};\n\nGame.prototype.step = function (ctx) {\n  this.moveObjects(ctx);\n  this.checkCollisions();\n};\n\nGame.prototype.remove = function (asteroid) {\n  for (let i = 0; i < this.asteroids.length; i++) {\n    if (asteroid === this.asteroids[i]) {\n      this.asteroids.splice(i, 1);\n      return;\n    }\n  }\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// canvas, context, and ship.\n\n// sets game view to animate game\n\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nGameView.IMPULSE = {\n  up: [0, -2],\n  down: [0, 2],\n  left: [-2, 0],\n  right: [2, 0]\n};\n\nfunction GameView (ctx) {\n  this.context = ctx;\n  this.game = new Game();\n}\n\nGameView.prototype.start = function () {\n  this.bindKeyHandlers();\n  let that = this;\n  \n  setInterval(function () {\n    that.game.step(that.context);\n    that.game.draw(that.context);\n  }, 20);\n};\n\nGameView.prototype.bindKeyHandlers = function () {\n  key('up', this.game.ship.power.bind(this.game.ship, GameView.IMPULSE.up));\n  key('left', this.game.ship.power.bind(this.game.ship, GameView.IMPULSE.left));\n  key('down', this.game.ship.power.bind(this.game.ship, GameView.IMPULSE.down));\n  key('right', this.game.ship.power.bind(this.game.ship, GameView.IMPULSE.right));\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nwindow.GameView = GameView;\n\nwindow.addEventListener('DOMContentLoaded', function(event) {\n  const canvas = document.getElementById(\"game-canvas\");\n  const context = canvas.getContext(\"2d\");\n\n  const gameView = new GameView(context);\n  gameView.start();\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject (options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,\n    2 * Math.PI\n  );\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  pos = this.game.wrap([\n    this.pos[0] + this.vel[0], \n    this.pos[1] + this.vel[1] ]);\n  \n  this.pos[0] = pos[0];\n  this.pos[1] = pos[1];\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObj) {\n  let centerDistance = Math.sqrt(\n    Math.pow(this.pos[0] - otherObj.pos[0], 2) + \n    Math.pow(this.pos[1] - otherObj.pos[1], 2) );\n\n  let radiiSum = this.radius + otherObj.radius;\n\n  return centerDistance < radiiSum;\n};\n\nMovingObject.prototype.collideWith = function (otherObj) {\n  // this.game.remove(this);\n  // this.game.remove(otherObj);\n};\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nUtil.inherits(Ship, MovingObject);\n\nconst HEX_DIGITS = \"0123456789ABCDEF\";\n\nfunction Ship (posObj, game) {\n\n  let options = {\n    pos: posObj.pos,\n    vel: Util.randomVec(0),\n    radius: Ship.RADIUS,\n    color: Ship.COLOR,\n    game: game\n  };\n\n  MovingObject.call(this, options);\n\n}\n\nShip.MAXVELOCITY = 10;\n\nShip.randomColor = function () {\n  let color = \"#\";\n  for (let i = 0; i < 6; i++) {\n    color += HEX_DIGITS[Math.floor((Math.random() * 16))];\n  }\n\n  return color;\n};\n\nShip.prototype.relocate = function () {\n  this.vel = Util.randomVec(0);\n  this.pos = this.game.randomPosition().pos;\n  this.color = Ship.randomColor();\n};\n\nShip.prototype.power = function (impulse) {\n  if ((this.vel[0] + impulse[0] < Ship.MAXVELOCITY) && \n    (this.vel[1] + impulse[1] < Ship.MAXVELOCITY)) {\n  this.vel[0] += impulse[0];\n  this.vel[1] += impulse[1];\n  } \n};\n\nShip.RADIUS = 15;\nShip.COLOR = Ship.randomColor();\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    function Surrogate () {}\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n\n  // Return a randomly oriented vector with the given length.\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  \n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });