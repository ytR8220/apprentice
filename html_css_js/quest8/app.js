const button = document.querySelector('.js-btn');
const output = document.querySelector('.js-output');

const greet = name => {
  output.textContent = `Hello, ${name}!`;
}

button.addEventListener('click', () => {
  let input = document.querySelector('.js-input');
  let value = input.value;
  if (value === '') return alert('Please enter your name');
  greet(value);
  input.value = '';
});