// API_KEY
const apiKey = 'cde6cda9ffa1932943d5de6d39a56657';
const btn = document.querySelector('button');
const result = document.querySelector('#weatherResult');

// クリック時のイベント
btn.addEventListener('click', () => {
  result.textContent = 'Loading...';

  const lat = document.querySelector('#latitude').value;
  const lon = document.querySelector('#longitude').value;

  // オブジェクト生成
  const request = new XMLHttpRequest();

  // レスポンスの受け取り
  request.onreadystatechange = () => {
    if (request.readyState === 4 && request.status === 200) {
      const data = request.response;
      const city = data.name;
      const weather = data.weather[0].main;
      const description = data.weather[0].description;
      result.textContent = `${city}の天気は${weather}。${description}`;
    }
  }

  // サーバーへのリクエスト（非同期通信を開始）
  request.open('GET', `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&lang=ja&appid=${apiKey}`);
  request.responseType = 'json';
  request.send();
});
