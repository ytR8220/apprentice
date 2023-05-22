// 2. 要素ノードの変更
document.querySelector('h1').textContent = 'シンプルブログ';

// 3. イベントハンドラの設定
const btn = document.querySelector('input[type=submit]');
btn.addEventListener('click', () => {
  btn.attributes.type.value = 'button';
  const title = document.querySelector('#title');
  const content = document.querySelector('#content');
  console.log(`タイトル：${title.value}\n本文：${content.value}`);
  createNode(title.value, content.value);
  title.value = '';
  content.value = '';
});

// 4. 要素ノードの追加
const posts = document.querySelector('#posts');
const createNode = (title, content) => {
  const wrapper = document.createElement('div');
  const titleElement = document.createElement('h2');
  const contentElement = document.createElement('p');
  titleElement.textContent = title;
  contentElement.textContent = content;
  wrapper.appendChild(titleElement);
  wrapper.appendChild(contentElement);
  wrapper.style.display = 'flex';
  wrapper.style.alignItems = 'center';
  wrapper.style.gap = '8px';
  posts.appendChild(wrapper);
  nodeCount++;
  if (nodeCount >= 4) {
    posts.removeChild(posts.firstElementChild);
  }
};

// 6. スタイルの変更
posts.addEventListener('mouseover', () => {
  posts.style.backgroundColor = 'yellow';
});
posts.addEventListener('mouseleave', () => {
  posts.style.backgroundColor = '#fff';
});

// 7. 要素ノードの削除
let nodeCount = posts.childElementCount;