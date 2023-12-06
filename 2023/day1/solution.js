const fs = require("fs");

// part 1
try {
  const data = fs.readFileSync("sample1.txt", "utf8").split("\n");

  //   console.log(data);

  const result = data.reduce((acc, curr) => {
    nums = [...curr].filter((char) => !isNaN(char));

    twoDigit = nums[0] + nums[nums.length - 1];

    return acc + Number.parseInt(twoDigit);
  }, 0);

  //   console.log(result);
} catch (err) {
  console.error(err);
}

// part 2

try {
  const numberWords = {
    one: "o1e",
    two: "t2o",
    three: "t3e",
    four: "f4r",
    five: "f5e",
    six: "s6x",
    seven: "s7n",
    eight: "e8t",
    nine: "n9e",
  };

  const regex = /one|two|three|four|five|six|seven|eight|nine/gm;

  const data = fs
    .readFileSync("input1.txt", "utf8")
    .split("\n")
    .map((curr) => {
      let matches = curr.match(regex);

      if (matches) {
        while (matches && matches.length > 0) {
          first = matches[0];
          curr = curr.replace(first, numberWords[first]);

          matches = curr.match(regex);
        }
      }

      return curr;
    });

  const result = data.reduce((acc, curr) => {
    const nums = [...curr].filter((char) => !isNaN(char));

    const twoDigit = nums[0] + nums[nums.length - 1];

    return acc + Number.parseInt(twoDigit);
  }, 0);

  console.log(result);
} catch (err) {
  console.error(err);
}
