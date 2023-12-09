const fs = require("fs");

function cardPoints(filename) {
  try {
    // Read input and parse it
    const input = fs
      .readFileSync(filename, "utf8")
      .split("\n")
      .map((line) =>
        line
          .replace(/Card\s*\d*\: /g, "")
          .split(" | ")
          .map((section) =>
            section
              .split(" ")
              .map((number) => Number.parseInt(number))
              .filter(Boolean)
          )
      );

    return input.reduce((acc, card) => acc + score(card[0], card[1]), 0);
  } catch (error) {
    console.log(error);
  }
}

function score(winningNums, myNums) {
  let score = 0;
  winningNums.forEach((winningNum) => {
    if (myNums.includes(winningNum)) {
      if (score === 0) score = 1;
      else score *= 2;
    }
  });

  return score;
}

console.log("Part 1 sample: " + cardPoints("sample.txt"));
console.log("Part 1 input: " + cardPoints("input.txt"));

// {
//     cardId: 1,
//     winningNums: [],
//     myNums: [],
//     copies: 1
// }
function partTwo(filename) {
  // Read input and parse it
  const input = fs
    .readFileSync(filename, "utf8")
    .split("\n")
    .map((line) => {
      cardId = Number.parseInt(line.match(/\d+/g)[0]);
      cardNums = line
        .replace(/Card\s*\d*\: /g, "")
        .split(" | ")
        .map((section) =>
          section
            .split(" ")
            .map((number) => Number.parseInt(number))
            .filter(Boolean)
        );

      return {
        cardId: cardId,
        winningNums: cardNums[0],
        myNums: cardNums[1],
        copies: 1,
      };
    });

  let sum = 0;
  for (let curr = 0; curr < input.length; curr++) {
    let card = input[curr];

    if (curr === 19) console.log(card);

    sum += card.copies;
    let matches = countMatches(card.winningNums, card.myNums);
    if (curr === 19) console.log(matches);

    console.log(
      `Processing card: ${curr}    Matches found: ${matches}     copies: ${card.copies}     sum thus far: ${sum}`
    );

    for (let cardWon = 1; cardWon <= matches; cardWon++) {
      won = input[curr + cardWon];
      if (won) won.copies += card.copies;
    }
  }

  return input.reduce((acc, card) => acc + card.copies, 0);
}

function countMatches(winningNums, myNums) {
  let count = 0;
  winningNums.forEach((winningNum) => {
    if (myNums.includes(winningNum)) {
      count += 1;
    }
  });

  return count;
}

console.log("Part 2 sample: " + partTwo("sample.txt"));
console.log("Part 2 input: " + partTwo("input.txt"));
