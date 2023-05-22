// 温度チェッカー
const input = document.querySelector('.js-input');
const button = document.querySelector('.js-btn');
const outputTemp = document.querySelector('.js-outputTemp');
const outputEven = document.querySelector('.js-outputEven');

const checkTemperature = temperature => {
  if (temperature >= 50) {
    return 'Hot';
  } else if (temperature < 50 && temperature >= -50) {
    return 'nice';
  } else {
    return 'Cold';
  };
};

const checkOddorEven = number => {
  if (number % 2 === 0) {
    return 'Even';
  } else {
    return 'Odd';
  };
};

button.addEventListener('click', () => {
  let value = input.value;
  if (value === '') return alert('Please enter a temperature');
  outputTemp.textContent = `${value}度は${checkTemperature(value)}`;
  outputEven.textContent = `${value}は${checkOddorEven(value)}`;
  input.value = '';
});
