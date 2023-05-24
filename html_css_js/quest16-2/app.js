const digits = document.querySelectorAll('.digit');
const operators = document.querySelectorAll('.operator');
const equals = document.querySelector('#equals');
const clear = document.querySelector('#clear');
const display = document.querySelector('#display');

let firstOperand = '';

// 入力した値をdisplayに表示する
let count = 0;
const pushDigit = digits => {
  digits.forEach(digit => {
    digit.addEventListener('click', () => {
      if (display.textContent === '0') {
        display.textContent = digit.textContent;
      } else if (firstOperand && count === 0) {
        display.textContent = digit.textContent;
      } else {
        display.textContent += digit.textContent;
      };
      cCount = 0;
      count++;
    });
  });
};


pushDigit(digits);

// 演算子を押した時の処理
let operator = '';
operators.forEach(ope => {
  ope.addEventListener('click', () => {
    switch (ope.textContent) {
      case '+':
        if (firstOperand) {
          equal();
          display.textContent = firstOperand;
        } else {
          firstOperand = Number(display.textContent);
        };
        count = 0;
        operator = '+';
        break;
      case '-':
        if (firstOperand) {
          equal();
          display.textContent = firstOperand;
        } else {
          firstOperand = Number(display.textContent);
        };
        count = 0;
        operator = '-';
        break;
      case '*':
        if (firstOperand) {
          // equal();
          display.textContent = firstOperand;
        } else {
          firstOperand = Number(display.textContent);
        };
        count = 0;
        operator = '*';
        break;
      case '/':
        if (firstOperand) {
          equal();
          display.textContent = firstOperand;
        } else {
          firstOperand = Number(display.textContent);
        };
        count = 0;
        operator = '/';
        break;
    };
  });
});

// =を押した時の処理
const equal = () => {
  switch (operator) {
    case '+':
      firstOperand += Number(display.textContent);
      display.textContent = firstOperand;
      break;
    case '-':
      firstOperand -= Number(display.textContent);
      display.textContent = firstOperand;
      break;
    case '*':
      firstOperand *= Number(display.textContent);
      display.textContent = firstOperand;
      break;
    case '/':
      firstOperand /= Number(display.textContent);
      display.textContent = firstOperand;
      break;
  }
};
equals.addEventListener('click', () => {
  equal();
});

// Cを押した時の処理
let cCount = 0;
clear.addEventListener('click', () => {
  if (cCount === 0) {
    display.textContent = '0';
    cCount++;
  } else {
    display.textContent = '0';
    firstOperand = '';
    cCount = 0;
  }
});