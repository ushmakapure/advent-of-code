let fs = require("fs");

let input = fs.readFileSync("6.in", "utf8");

// parse input ==> create set of coordinates
let set = new Set();
let locId = 0;
input.split("\n").forEach(element => {
  let locations = element.split(", ");
  set.add({
    x: Number.parseInt(locations[0]),
    y: Number.parseInt(locations[1]),
    id: locId
  });
  locId++;
});
// console.log(set);
// find max for x & y to get boundaries
let max = [...set].reduce(
  (acc, value) => {
    acc.x = Math.max(acc.x, value.x);
    acc.y = Math.max(acc.y, value.y);
    return acc;
  },
  { x: 0, y: 0 }
);
console.log("max: ");
console.log(max);
// create map of every coordinate (x, y) => closest
// for each coordinate ==> iterate through set ==> find closest

// just make a grid instead
let dist = new Map();
for (let i = 0; i <= max.x; i++) {
  for (let j = 0; j <= max.y; j++) {
    let coordinate = { x: i, y: j };
    let closest = findClosest(set, coordinate, max);
    dist.set(coordinate, { x: closest.x, y: closest.y, id: closest.id });
  }
}

function findClosest(set, coordinate, max) {
  return [...set].reduce(
    (closest, element) => {
      let xDist = Math.abs(coordinate.x - element.x);
      let yDist = Math.abs(coordinate.y - element.y);

      if (xDist + yDist < closest.dist) {
        closest.x = element.x;
        closest.y = element.y;
        closest.dist = xDist + yDist;
        closest.id = element.id;
      }
      return closest;
    },
    { x: max.x, y: max.y, dist: Infinity }
  );
}

// remove any (x,y) where either x or y is a boundary
dist.forEach((value, key) => {
  if (key.x < 1 || key.y < 1 || key.x >= max.x || key.y >= max.y) {
    const iterator1 = set.entries();
    for (let entry of iterator1) {
      if (entry[0].id === value.id) {
        set.delete(entry[0]);
      }
    }
  }
});

// console.log(max);
// console.log(set);
// console.log(dist);
// count number of keys left with each closest letter
let counts = [...set].reduce((acc, entry) => {
  let arr = [];
  arr.push(entry.id);
  let count = 0;
  dist.forEach((value, key) => {
    if (value.id === entry.id) {
      count++;
    }
  });
  arr.push(count);
  acc.push(arr);
  return acc;
}, []);

console.log(counts);

// find max count
let answer = counts.reduce(
  (result, entry) => {
    if (entry[1] > result.count) {
      result.count = entry[1];
      result.id = entry[0];
    }
    return result;
  },
  { id: null, count: 0 }
);
// console.log(answer);
