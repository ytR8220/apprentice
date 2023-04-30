while true; do
  read -p "サービス名を入力してください:" service
  read -p "ユーザー名を入力してください:" user
  read -p "パスワードを入力してください:" pass
  if [ -n "$service" ] && [ -n "$user" ] && [ -n "$pass" ]; then
    echo "パスワードの追加は成功しました。"
    break
  fi
done
echo "$service:$user:$pass" >> data.txt
