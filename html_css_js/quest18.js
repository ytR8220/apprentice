// 例外処理を使うことができる

const checkDivisibleByFive = num => {
  try {
    if (num % 5 !== 0) { throw new Error('数値は5で割り切れません'); }
    return true;
  }
  catch (e) {
    console.log(e.message);
  }
  finally {
    console.log('処理を終了します。');
  }
}

console.log(checkDivisibleByFive(10));