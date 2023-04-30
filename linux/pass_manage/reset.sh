while true; do
  read -p "登録されたパスワードをすべて削除しますか？(y/n)" choose
  case $choose in
    "y")
    cat /dev/null > data.txt
    echo "登録パスワードを削除しました。"
    break
    ;;
    "n")
    break
    ;;
    *)
    echo "y または n を入力してください。" 
    ;;
  esac
done
