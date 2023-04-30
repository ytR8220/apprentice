while true; do
  read -p "サービス名を入力してください:" service
  if [ -n "$service" ]; then
    search=$(grep $service data.txt)
    if [ $? = 0 ]; then
      user=$(echo $search | awk -F':' '{ print $2 }')
      pass=$(echo $search | awk -F':' '{ print $3 }')
      echo "サービス名:$service"
      echo "ユーザー名:$user"
      echo "パスワード:$pass"
      break
    else
      echo "そのサービスは登録されていません。"
      read -p "サービスの登録を行いますか？(y / n)" register
      case $register in
        "y")
        ./add.sh
        break
        ;;
        *)
        echo "もう一度入力してください。"
        ;;
      esac
    fi
  else
    read -p "前のページに戻りますか？(y / n)" choose
    case $choose in
      "y")
        break
        ;;
      *)
        echo "もう一度入力してください。"
        ;;
    esac
  fi
done

