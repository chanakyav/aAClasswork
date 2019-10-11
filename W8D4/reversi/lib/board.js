let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = [];
  for (let i = 0; i < 8; i++) {
    grid.push(new Array(8));
  }
  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x, y;
  [x, y] = pos;
  // if (!this.isValidPos(pos)) {
  //   throw new Error ("Not valid pos!");
  // } 
  return this.grid[x][y];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length !== 0;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (!this.getPiece(pos)) return false;
  return this.getPiece(pos).color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos) === true;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove('white') && !this.hasMove('black');
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x, y;
  [x, y] = pos;
  return (x < 8 && y < 8 && x >= 0 && y >= 0);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {

  pos = [pos[0] + dir[0], pos[1] + dir[1]];
  if (!piecesToFlip) piecesToFlip = []; 
  if (!board.isValidPos(pos) || !board.getPiece(pos)) return null;
  if (board.isMine(pos, color)) return (piecesToFlip.length === 0 ? null : piecesToFlip);

  piecesToFlip.push(board.getPiece(pos));
  return _positionsToFlip(board, pos, color, dir, piecesToFlip);
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {

  if (!this.validMove(pos, color)) {
    throw Error("Invalid Move");
  } 
  this.grid[pos[0]][pos[1]] = new Piece(color);
  let pos_flip = [];
    for (let dir of Board.DIRS) {
      let positions = _positionsToFlip(this, pos, color, dir);
      if (positions !== null) pos_flip = pos_flip.concat(positions);
    }
  for (let pos of pos_flip) pos.flip();
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  let str = "";
  this.grid.forEach(row => {
    row.forEach(piece => {
      if (piece) str += piece.toString() + " ";
      else str += " ";
    });
    str += '\n';
  });
  return str;
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) return false;
  for (let dir of Board.DIRS) {
    if (_positionsToFlip(this, pos, color, dir) !== null) return true;
  }
  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  const moves = [];
  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {      
      if (this.validMove([i, j], color)) {
        moves.push([i, j]);
      }
    }
  }
  return moves;
};

module.exports = Board;


board = new Board();

// board.getPiece([10, 10]);

console.log(board.print());

const fillBoard = function (board) {
  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      board.grid[i][j] = new Piece("white");
    }
  }
  board.grid[3][4] = new Piece("black");
  board.grid[4][3] = new Piece("black");
};

fillBoard(board);
console.log(board.print());