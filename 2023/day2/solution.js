const fs = require("fs");

try {
  const data = fs.readFileSync("input.txt", "utf8").split("\n");

  console.log("Part1: " + data.reduce((acc, game) => acc + gamePart1(game), 0));

  console.log("Part2: " + data.reduce((acc, game) => acc + gamePart2(game), 0));
} catch (error) {
  console.log(error);
}

function gamePart1(gameStr) {
  const [gameLabel, rawSets] = gameStr.split(": ");

  if (gameIsPossible(gameSets(rawSets))) {
    return gameId(gameLabel);
  } else {
    return 0;
  }
}

function gamePart2(gameStr) {
  const [gameLabel, rawSets] = gameStr.split(": ");

  return minCubesRequired(gameSets(rawSets));
}

function gameId(gameLabel) {
  const numStr = gameLabel.match(/[0-9]+/g)[0];
  return Number.parseInt(numStr);
}

function gameSets(rawSets) {
  const sets = rawSets.split("; ");

  return sets.map((set) => {
    let cubes = set.split(", ");
    let cubeCounts = {};
    cubes.forEach((cube) => {
      let [count, color] = cube.split(" ");
      cubeCounts[color] = Number.parseInt(count);
    });

    return cubeCounts;
  });
}

// part 1
function gameIsPossible(gameSets) {
  for (let i = 0; i < gameSets.length; i++) {
    // 12 red cubes, 13 green cubes, and 14 blue cubes
    if (
      gameSets[i]["blue"] > 14 ||
      gameSets[i]["green"] > 13 ||
      gameSets[i]["red"] > 12
    ) {
      return false;
    }
  }

  return true;
}

// part 2
function minCubesRequired(gameSets) {
  let [maxRed, maxBlue, maxGreen] = [0, 0, 0];

  for (let i = 0; i < gameSets.length; i++) {
    if (gameSets[i]["blue"] > maxBlue) maxBlue = gameSets[i]["blue"];
    if (gameSets[i]["green"] > maxGreen) maxGreen = gameSets[i]["green"];
    if (gameSets[i]["red"] > maxRed) maxRed = gameSets[i]["red"];
  }

  // console.log(maxRed + " " + maxBlue + " " + maxGreen);
  return maxRed * maxBlue * maxGreen;
}
