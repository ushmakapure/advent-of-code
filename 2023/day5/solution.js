const fs = require("fs");

function part1(filename) {
  const map = processInput(filename);
  const locations = map[map.length - 1];
  return locations.sort((a, b) => a - b)[0];
}

function processInput(filename) {
  try {
    const input = fs.readFileSync(filename, "utf8").split("\n");
    let seeds = input[0].match(/\d+/g).map((x) => Number.parseInt(x));

    let [map, mapNames, mapIndex] = [[seeds], ["seed"], 0];

    for (let i = 2; i < input.length; i++) {
      if (input[i].match("map")) {
        mapIndex += 1;
        // 'fertilizer-to-water map:'
        // converts to sourceName === 'fertilizer' and destinationName === 'water'
        const [sourceName, _, destinationName] = input[i]
          .split(" ")[0]
          .split("-");

        mapNames[mapIndex] = sourceName;
        mapNames[mapIndex + 1] = destinationName;
      } else if (input[i].match(/\d+/g)) {
        let [destinationRangeStart, sourceRangeStart, rangeLength] = input[i]
          .match(/\d+/g)
          .map((x) => Number.parseInt(x));

        const prevVals = map[mapIndex - 1];
        let currVals = map[mapIndex] || new Array(map[0].length).fill(null);

        for (let j = 0; j < prevVals.length; j++) {
          const element = prevVals[j];
          // part 1
          if (
            sourceRangeStart <= element &&
            element <= sourceRangeStart + rangeLength - 1
          ) {
            // console.log("is in range");
            const distanceFromRangeStart = element - sourceRangeStart;
            currVals[j] = destinationRangeStart + distanceFromRangeStart;
          }
        }

        for (let k = 0; k < currVals.length; k++) {
          if (currVals[k] === null) {
            currVals[k] = prevVals[k];
          }
        }
        map[mapIndex] = currVals;
      }
    }

    return map;
  } catch (error) {
    console.log(error);
  }
}

console.log(`Part 1 sample: ${part1("sample.txt")}`);
console.log(`Part 1 solution: ${part1("input.txt")}`);
