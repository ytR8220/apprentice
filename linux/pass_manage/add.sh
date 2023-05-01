while true; do
  read -p "サービス名を入力してください:" service
  read -p "ユーザー名を入力してください:" user
  read -p "パスワードを入力してください:" pass
  if [ -n "$service" ] && [ -n "$user" ] && [ -n "$pass" ]; then
    echo "パスワードの追加は成功しました。"
    break
  fi
done
openssl enc -d -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in enc-data.txt -out data.txt
echo "$service:$user:$pass" >> data.txt
openssl enc -e -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in data.txt -out enc-data.txt
rm data.txt
