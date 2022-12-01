const a = "abcdef"; //contains no letters that appear exactly two or three times.
const b = "bababc"; //contains two a and three b, so it counts for both.
const c = "abbcde"; //contains two b, but no letter appears exactly three times.
const d = "abcccd"; //contains three c, but no letter appears exactly two times.
const e = "aabcdd"; //contains two a and two d, but it only counts once.
const f = "abcdee"; //contains two e.
const g = "ababab"; //contains three a and three b, but it only counts once.

const challengeInput =
  "uqcipadzntnheslgvjjozmkfyr,uqcipadzwtnhexlzvxjobmkfkr,cqcipadpwtnheslgyxjobmkfyr,ubnipadzwtnheslgvxjobmkfyw,uqcisadzwtnheslgvxjfbmkfor,uqcisaezwtnheslgvxkobmkfyr,uqcguadzwtnheslgvxjobmkfir,uqcipadzmtnhesldvxdobmkfyr,uqcipadzwtzheslgdxjtbmkfyr,uquipadzwtcheslgvxjobmkfbr,uqctpadzwtnhesjbvxjobmkfyr,ueciparzwtnheslgvxjobmkfyx,uqcipadzwtnhessgvxjkbmkfkr,uqcipamzwtnheslgvxioamkfyr,uciizadzwtnheslgvxjobmkfyr,uqcieadzwtnhesfgvxeobmkfyr,fqcipadzwtnreslgvkjobmkfyr,uqcipadzrtnherlgvxjobmklyr,uqcypadzwtnheslgvxjobmkxfr,uqcipadzwtnhemlgvxjobmvfur,uwciuadzwwnheslgvxjobmkfyr,uqcipadzwtnhcscgvxjobmkuyr,upripadzwtnheslovxjobmkfyr,uqcipadzltnheslgvxjobmkftc,uqcipadzwtnheslgvgjobmifsr,uqoipadzwtnheslgvxjosmkfkr,uqcipadzwtbhesrqvxjobmkfyr,uqcipadzwtnheslpvxjobmhfyx,uhcinadzwtnheslgvxjybmkfyr,uqcipadzwtnhhslgvxjabmkbyr,uecipadzwtnheslgvxjobqyfyr,uqcipadfwtnheslwvxjobgkfyr,uqcipadzvtnheshgvxzobmkfyr,fqcipadzwtcheslgvxjobmkfyt,uecipadzwtnheslgpxjbbmkfyr,uqclpadzwtnheslgvnjobukfyr,qqciprdzetnheslgvxjobmkfyr,uqcipahpwtnheslgvxjtbmkfyr,uqcidadzwtnhesljvxyobmkfyr,uqciradswtnqeslgvxjobmkfyr,uqcipadzwtrhmslgvxjobmkfyf,urcipadzjtnheslgvxfobmkfyr,uqcipadzwznheslgvxjobmkfcv,uqcipadowtnheslgyxjobmkfym,uqcigadzwtnheslgvxjoomkmyr,uqjipafzwtnheslgvejobmkfyr,uqcioadzwtnhhslgvxzobmkfyr,uqcgpadkwtnheslgvxjobhkfyr,ufciiadewtnheslgvxjobmkfyr,uqoipadzwtnheslgvxjllmkfyr,uqcipadzutnheslgwxxobmkfyr,uqcipadzwtlheslgaxjobmkfwr,uqcbpadzutnheslgvxjbbmkfyr,uucipadzwvnhesngvxjobmkfyr,uqcifadzwtnceslgvxjoumkfyr,ujcipadzwteheslgvxjobmkfyj,uqcipadzwtnheslqvxjobmkuyp,uqcipadzwtnheslgvxjoxmkxyw,uqcipaduwtnheslgvujmbmkfyr,uicipadnwtnheslgvxjobmbfyr,uqcipadzwteheslgvxjobbmfyr,uqcipadzwgnneslgvxjobmklyr,uqcipadzxtnhwslgvbjobmkfyr,uqcipaxwwtnheslxvxjobmkfyr,uocipadzwtnheslgvxjobqdfyr,uqciaauzwtnheslgtxjobmkfyr,uncipagzwtnkeslgvxjobmkfyr,uqcipadzwtnhehlgvxjohdkfyr,uqcipadzwtnheslgvxjobmspyz,uccipadzwtnhvsltvxjobmkfyr,uacipagzwtnheslgvxjoqmkfyr,tqcipaduwtnheslgvxjobmmfyr,uqcipadzwtnheslgvxqebmifyr,uecipadthtnheslgvxjobmkfyr,uocipadzwtnhdslgvkjobmkfyr,uqcipadtwtnheslgvxhobmufyr,uqkipadzwtnleslgtxjobmkfyr,uqcipadzjunheslgvxjobmnfyr,ubcipadzwtvheslgvxjobmkfyf,uqcipadzwpfheslgvxjsbmkfyr,uocipadzwtndeslgvxjobmmfyr,uqcipadzwtnheslgtxjobhkfyq,uqcipadzwtrheslgvxjobmyfya,uqcipadzwtvheslgvxjolgkfyr,uqcipidzwtaheslgvxjobmkfxr,uyzixadzwtnheslgvxjobmkfyr,uqyihadzwtnhedlgvxjobmkfyr,uqcipadzwtnhesltvejobqkfyr,uqciptdzwtnheslgyxlobmkfyr,uqcipzdzwtnhzslgvxjosmkfyr,uqcipadzwtnbeslgexjobmkfvr,uqcipadzwtnheslcwxjobmkkyr,uqcapadzwcnheslgvxjolmkfyr,uqcjpadzwtnhejlgvxjxbmkfyr,uqcipadwwtxweslgvxjobmkfyr,uqmipadzwtnhezlgvxjobmkyyr,uqcipubzwtnpeslgvxjobmkfyr,uecvpadzwtnheslgvxjocmkfyr,uqcipadzwfnheslgvxjibmkdyr,uqcipadzwtnheslgvxvfbykfyr,uqcipadzwtnheslgvgjoimkfyt,dqcqpaqzwtnheslgvxjobmkfyr,uqcipbdzwtnheslgvxjobmkghr,jqcipadzwtnheslgvxjgbmkzyr,uqcipadzwtnheslgvxqkqmkfyr,uqcipadzptnheslgvxjxbokfyr,uucijadzwtwheslgvxjobmkfyr,uccfpadzwtnheslgvxjobpkfyr,uqcipadzwtnheslgvxjobakeyq,uqcipadzwtnheolgvxqobjkfyr,imiipadzwtnheslgvxjobmkfyr,uqcehadzwtnheslgvxjobmkuyr,uqcipadzztnheslgvxjorokfyr,rqcixadzwtnheelgvxjobmkfyr,uqcipadzwtzheslgvxjodmkfyi,uqcipaezwtnwuslgvxjobmkfyr,uqcipadzwtnheslggxjobjkfyq,uqcipadzwkghesagvxjobmkfyr,uqcypqdzwtnheslgvxjobakfyr,iqcipadzwtnhezltvxjobmkfyr,uxcimadzwtnheslgvxjobmxfyr,uqcipaizwtvhwslgvxjobmkfyr,uqcipafzwtnheslgvxjpbmkfym,uqcipadzwinheslgvxlobmpfyr,uqcupadzwtnheslkvxmobmkfyr,uqcapadzwtnhesrgvxjobmkfsr,urcipafzwtnheslgvxjobmkfur,uqcipaczwtnheslgvbjobmknyr,uqcizadzztgheslgvxjobmkfyr,uqcipfdzwtnhesxgvxjobmkfyw,uqcipbdzwtnhyslgvxjobmcfyr,uqcipadzwanhezlgvxjobmkfwr,uvcipadzwtnheslgvxjbkmkfyr,uqcipajzwtnseslgvxjobmkfyq,uqcipvdzwtnheslgvmlobmkfyr,uqcipadzdgnheslgmxjobmkfyr,uqcipddzwtnhestgvpjobmkfyr,umcipadzwtdheslgvxjzbmkfyr,uqciuwdzwtnheslgvxjobmkflr,uqcipadzwtnheslgsxabbmkfyr,uceipadzwtnheslgvxjobgkfyr,mqcipadzwtnhesrgvxjobmjfyr,aqcipadvwtnheslgvxjobmkryr,uqsipadzwtnofslgvxjobmkfyr,uqcixadzwtfheslgvxjzbmkfyr,uqcipadnwfnheslgvxjohmkfyr,uqcivadzwtnheslfvxjobmkfyz,uqciprdzwtnheslgvxjobmkjir,uqcipadhbtnheslgvxjoxmkfyr,fqcipadzwtnhesfgvxjobmkfye,uqoipqdzwtnheqlgvxjobmkfyr,uqcipadzwtnhesltvxmobmkzyr,uqcipadzwtnhebqgvsjobmkfyr,uqcipadzwtnheslglxjobmfbyr,gqcipadzwtgheslgvxjobwkfyr,uqcipadzwtnheslgfxjzbmlfyr,ujcnpadzwtnheslrvxjobmkfyr,ujcivadzwtnheglgvxjobmkfyr,uqcitadzwgnheslgvxjofmkfyr,uqcipahzatnhmslgvxjobmkfyr,uqzipaizwtnheslgvujobmkfyr,uqcipadzltnheylgvnjobmkfyr,uqcidadzwtnhwsljvxyobmkfyr,uqcipadzwtihetlgvxjobhkfyr,oqcipabzwtnheslgvfjobmkfyr,uqcipadzwtnveslgvxjobzkfzr,uqcipadzwtjheslgqxjobmlfyr,uqcnpadzztnheslgvxjobmkoyr,uqciuadzwonheslgvxjobmkfyz,tqcipadzwtnheslgvxaobmqfyr,uqcipadtwtnhqslgvxjobmkeyr,uqcipadzwbnheslgvajobmsfyr,ubcopadzwtnhgslgvxjobmkfyr,uqcipydzwtwheslgvxjobakfyr,cqbijadzwtnheslgvxjobmkfyr,uscipadowtnheslgvxjobmkfcr,uqcipadzwtgheslnvxjobskfyr,uqcipzdzwtnzeslgkxjobmkfyr,uqcipawzwtnhrslgbxjobmkfyr,uqcipadzatchyslgvxjobmkfyr,uqcipadzotnpeslgvxjobmjfyr,uqcipagzwtnheslgvxjobmvfyt,uqcipadzwhnheslgvxyobmkfyo,uqcipadzwtnheslgmqjobmkfyc,uqcupadzwgnheslgvcjobmkfyr,uqcipabzwbnheslgvxjobmkwyr,uqciiadzwtnheslgvxjobmkfmz,uqkipauzwtnheslgvxjjbmkfyr,uqcipidzetnheslgvxjobmkfyi,uqcipadzwtnheslgqxjokmkfmr,uqcipadzqtnhesllvxjobmkfyk,uqccpadzwtnheslgmxsobmkfyr,uqcipadzwteheslgvljfbmkfyr,uqcipadxwinheslgaxjobmkfyr,uqcipadzwtnheslhvxyobmkfjr,aqcipadzwnnheslgvxjqbmkfyr,uvcipadzwtnheszgvxjobmkfyg,uqcipahzmtnheslgvxjobmkfir,ukcipadzbtnheslgvxjobmkfyb,uqcipadzwtnhemlgvqjobmkfpr,uqcipadzwtnheslgvmeobmkfpr,uqciphdrwtnheslgvxjobmkfyw,uqcipadzwtnheslevxqobzkfyr,uqcipadzwknzeslgvxnobmkfyr,wqcipadzwjnheslgvxjobbkfyr,uqcipadzwtdheslgvmjobmkjyr,uqvipadzwtnhextgvxjobmkfyr,uqhipadzwtnheslwvxjzbmkfyr,uqcipadzwtnherlgsxjobmksyr,uqcipadzwtnhesqgvxjotmvfyr,udcipadzwtnhekwgvxjobmkfyr,uqcjprdzwtnheslgvxjobmkfpr,uqcipadzatnheclgvqjobmkfyr,uqcbpadzctnheslqvxjobmkfyr,uqcipadzqtnhesluvxjobrkfyr,uqcipadzwtnhcslgvxjoomwfyr,uqcppadzwxnheslgwxjobmkfyr,uqcipadcwtnheslrvxjdbmkfyr,ukcipadzwtnhhslgvxjobmkgyr,uqckpadzwtnheslgvxjokmkiyr,uqcspadzwtjheslgvxjobmkfjr,uqcipadpwtnhsslgvxjobmkfyu,uqcepadzwtnheilgvbjobmkfyr,jqcipadiwtnheslgvxjobmkjyr,uqcipadzrtnseslgqxjobmkfyr,sqmipadzwtnhewlgvxjobmkfyr,uqcieadzhtnheslgvgjobmkfyr,uqcipadzwkwhewlgvxjobmkfyr,uqcipadzwtzheslgvxjpbqkfyr,uzcipadzjtnheslgvxjobmlfyr,uqcipadzwtnheslnvxjobmkfee,uqciyanzwtnheslgvxjoimkfyr,uqcipadqwtnheswghxjobmkfyr,uycipadzwtnheslovxjobmofyr,uqcipadzwtnheslgvxcozmxfyr,uqmipadzwtnxezlgvxjobmkfyr,uqcipadzftnheslgvxjotmkffr,aqcipaizwtnhesagvxjobmkfyr,uqcipcdzwtnheslgoajobmkfyr,uqcypadgwtnhesbgvxjobmkfyr,uqcipcdzwtnheslgvxjebmkfyb,uhcvpadzwtnheslgvxjobzkfyr,uqcipadzwtnpesagvxmobmkfyr,uqcipadzwtnidslgvxjobmkfor,uqcipadkwtnhesigvxjzbmkfyr,uqcypadlwtnheslsvxjobmkfyr,qqcipadzwtnheswgvxjobmkoyr,uqcipadzwtnheslgvxjhbmmcyr,uqcipadzwtnhesogvxjormkfmr,uqcipadzwtnhetcgvxgobmkfyr";

// console.log(checksum(challengeInput));
("abcde,axcye");

function checksum(input) {
  const parsed = parse(input);
  let doubles = 0;
  let triples = 0;
  parsed.forEach(element => {
    let doubleFound = false;
    let tripleFound = false;
    const map = countLetters(element);
    map.forEach((value, key) => {
      if (value === 2) doubleFound = true;
      else if (value === 3) tripleFound = true;
    });
    if (doubleFound) doubles++;
    if (tripleFound) triples++;
  });
  return doubles * triples;
}
("abcde,fghij,klmno,pqrst,fguij,axcye,wvxyz");
console.log(matchingIds(challengeInput));

function matchingIds(input) {
  const parsed = parse(input);
  let mismatchIndex;
  let firstWord;
  let secondWord;
  for (let i = 0; i < parsed.length; i++) {
    const first = parsed[i];
    for (let j = i + 1; j < parsed.length; j++) {
      if (parsed[i].length != parsed[j].length) continue;
      const second = parsed[j];

      let firstIter = first[Symbol.iterator]();
      let secondIter = second[Symbol.iterator]();
      let firstChar = firstIter.next();
      let secondChar = secondIter.next();
      let mismatchAllowed = true;
      for (let k = 0; k < parsed[i].length; k++) {
        if (parsed[i][k] !== parsed[j][k]) {
          if (mismatchAllowed) {
            mismatchIndex = k;
            firstWord = i;
            secondWord = j;
            mismatchAllowed = false;
          } else {
            mismatchIndex = null;
            firstWord = null;
            secondWord = null;
            continue;
          }
        }
      }
      if (firstWord && secondWord && mismatchIndex) break;
    }
    if (firstWord && secondWord && mismatchIndex) break;
  }

  console.log(parsed[firstWord]);
  console.log(parsed[secondWord]);

  // console.log(parsed[firstWord]);

  //   console.log(parsed[firstWord].substring(0, mismatchIndex));
  //   console.log(parsed[firstWord].substring(mismatchIndex + 1));
  const result =
    parsed[firstWord].substring(0, mismatchIndex) +
    parsed[firstWord].substring(mismatchIndex + 1);

  return result;
}

function parse(input) {
  return input.split(",");
}

function countLetters(string) {
  let map = new Map();
  let iterator = string[Symbol.iterator]();
  let char = iterator.next();

  while (!char.done) {
    if (map.has(char.value)) {
      map.set(char.value, map.get(char.value) + 1);
    } else {
      map.set(char.value, 1);
    }
    char = iterator.next();
  }
  return map;
}
