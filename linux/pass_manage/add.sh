# 登録を行う
while true; do
  # サービス名を入力するまで入力を求める
  while true; do
    read -p "サービス名を入力してください:" service
    if [ -n "$service" ]; then
      break
    fi
  done
  # ユーザー名を入力するまで入力を求める
  while true; do
    read -p "ユーザー名を入力してください:" user
    if [ -n "$user" ]; then
      break
    fi
  done
  # パスワードを入力するまで入力を求める
  while true; do
    read -p "パスワードを入力してください:" pass
    if [ -n "$pass" ]; then
      break
    fi
  done
  echo "パスワードの追加は成功しました。"
  break
done

# すべて入力を終えると保管ファイルを復号化して追加上書きする
openssl enc -d -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in enc-data.txt -out data.txt
echo "$service:$user:$pass" >> data.txt
# ファイルに追加したらファイルを暗号化する
openssl enc -e -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in data.txt -out enc-data.txt
rm data.txt
