// 1. 奇数が含まれるかの判定
const hasOdd = numbers => {
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0) {
      return false;
    }
  }
};

hasOdd([1, 2, 3, 4, 5]);

// 2. 奇数の抽出
const odd = numbers => {
  let oddNumbers = [];
  numbers.forEach(num => {
    num % 2 !== 0 ? oddNumbers.push(num) : '';
  });
  return oddNumbers;
};

odd([1, 2, 3, 4, 5]);

// 3. 2乗の計算
const square = numbers => {
  return numbers.map(num => {
    return num ** 2;
  });
};

let result = square([1, 2, 3, 4, 5]);
console.log(result);