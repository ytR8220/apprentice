// 1. 書籍プリンター

books = ['『JavaScript入門』山田太郎', '『JavaScriptの絵本』山田次郎'];

const printBooks = books => {
  books.forEach(val => {
    console.log(val);
  });
}

// 2. ユーザーパーミッションチェッカー
let users = [
  {
    username: '山田',
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: '佐藤',
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false
    }
  },
];

const checkPermission = (user, per) => {
  let result = users.find(val => val.username === user);
  console.log(result);
  if (result.permissions[per]) {
    console.log(true);
  } else {
    console.log(false);
  }
}

checkPermission('山田', 'canWrite');

// 3. メソッド
// ① => ◯
// ② => ◯
// ③ => ◯
// ④ => ×