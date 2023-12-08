const fs = require("fs");

let visited = new Set();

try {
  const input = fetchData("input.txt");

  let adjacentDigits = []; // part 1
  let gearRatios = []; //part 2

  for (let r = 0; r < input.length; r++) {
    for (let c = 0; c < input[r].length; c++) {
      // part 1
      //   const symbol = input[r][c].match(/[^\d|\.]/g);

      if (input[r][c] === "*") {
        // part 1: if (symbol != null && symbol.length > 0) {
        //   check if adjacent cols are digits
        currAdjacentDigits = [];
        for (let i = -1; i <= 1; i++) {
          if (input[r + i][c - 1].match(/\d/g)) {
            currAdjacentDigits.push(dfsDigits(input, r + i, c - 1));
            // adjacentDigits.push(dfsDigits(input, r + i, c - 1));
          }
          if (input[r + i][c + 1].match(/\d/g)) {
            currAdjacentDigits.push(dfsDigits(input, r + i, c + 1));
            // adjacentDigits.push(dfsDigits(input, r + i, c + 1));
          }
        }

        // check top and bottom
        if (input[r + 1][c].match(/\d/g)) {
          currAdjacentDigits.push(dfsDigits(input, r + 1, c));
          //   adjacentDigits.push(dfsDigits(input, r + 1, c));
        }
        if (input[r - 1][c].match(/\d/g)) {
          currAdjacentDigits.push(dfsDigits(input, r - 1, c));
          //   adjacentDigits.push(dfsDigits(input, r - 1, c));
        }

        currAdjacentDigits = currAdjacentDigits.filter(Boolean);
        if (currAdjacentDigits.length === 2) {
          const ratio = currAdjacentDigits.reduce((acc, item) => acc * item);
          gearRatios.push(ratio);
        }
      }
    }
  }

  //   console.log(adjacentDigits.reduce((acc, item) => acc + item));
  console.log(gearRatios.reduce((acc, item) => acc + item));
} catch (error) {
  console.log(error);
}

function fetchData(filepath) {
  let input = fs
    .readFileSync(filepath, "utf8")
    .split("\n")
    .map((line) => ("." + line + ".").split(""));

  let padding = [];
  for (let a = 0; a < input[0].length; a++) {
    padding.push(".");
  }

  input.push(padding);
  input.unshift(padding);

  return input;
}

function dfsDigits(input, initialRow, initialCol) {
  let stack = [];
  let digit = [];

  stack.push([initialRow, initialCol, "left", input[initialRow][initialCol]]);

  while (stack.length > 0) {
    let [r, c, direction, letter] = stack.pop();

    if (!visited.has(`${r}, ${c}`)) {
      visited.add(`${r}, ${c}`);

      if (direction === "left") {
        digit.unshift(input[r][c]);
      } else {
        digit.push(input[r][c]);
      }

      // if left or right is a digit then add it to the list
      if (input[r][c - 1].match(/\d/g)) {
        stack.push([r, c - 1, "left", input[r][c - 1]]);
      }

      if (input[r][c + 1].match(/\d/g)) {
        stack.push([r, c + 1, "right", input[r][c + 1]]);
      }
    }
  }

  if (digit.length > 0) {
    // console.log(digit);
    return Number.parseInt(digit.join(""));
  }
}
