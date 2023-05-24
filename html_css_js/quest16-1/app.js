// Enterによる送信を防ぐ
document.querySelector('form').addEventListener('submit', (e) => {
  e.preventDefault();
});

const todoInput = document.querySelector('#todo-input');
const addBtn = document.querySelector('#add-button');
const todoList = document.querySelector('#todo-list');
let todos = [];

// エレメントを作成
const createTodo = (todoText) => {
  const li = document.createElement('li');
  const input = document.createElement('input');
  const span = document.createElement('span');
  const button = document.createElement('button');
  li.classList.add('todo-item');
  input.type = 'checkbox';
  input.addEventListener('change', todoCheck);
  button.classList.add('delete-button');
  button.textContent = '削除';
  button.addEventListener('click', deleteTodo);
  span.textContent = todoText;
  li.appendChild(input);
  li.appendChild(span);
  li.appendChild(button);
  return li;
};

// 追加
addBtn.addEventListener('click', () => {
  todos.push(createTodo(todoInput.value));
  todos.forEach(todo => {
    todoList.appendChild(todo);
  });
  todoInput.value = '';
});

// Enterキーでも追加できるように
todoInput.addEventListener('keydown', (e) => {
  if (e.key === 'Enter') {
    todos.push(createTodo(todoInput.value));
    todos.forEach(todo => {
      todoList.appendChild(todo);
    });
    todoInput.value = '';
  }
});

// 削除
const deleteTodo = (e) => {
  e.target.parentNode.remove();
}

// チェックが入ったら取り消し線を引く
const todoCheck = (e) => {
  if (e.target.checked) {
    e.target.nextElementSibling.style.textDecoration = 'line-through';
  } else {
    e.target.nextElementSibling.style.textDecoration = 'none';
  }
};