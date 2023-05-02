# 暗号化された保管ファイルを復号化
openssl enc -d -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in enc-data.txt -out data.txt
while true; do
  # 検索するサービス名の入力を求める
  read -p "サービス名を入力してください:" service
  # 入力があれば以下を処理
  if [ -n "$service" ]; then
    # 入力されたサービス名がファイルのどこかの行に含まれるのかを確認すると同時に、その行の1つ目の要素と一致しているか確認して、両方満たせば行全体を変数に格納する
    search=$(grep -w $service data.txt | awk -F':' '$1=="'"$service"'"{print}')
    # 上記で行が返ってこれば以下を処理
    if [ -n "$search" ]; then
      user=$(echo $search | awk -F':' '{ print $2 }')
      pass=$(echo $search | awk -F':' '{ print $3 }')
      echo "サービス名:$service"
      echo "ユーザー名:$user"
      echo "パスワード:$pass"
      # ファイルを暗号化
      openssl enc -e -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in data.txt -out enc-data.txt
      # 復号化ファイルの削除
      rm data.txt
      break
    # 上記で何も返ってこなければ以下を処理
    else
      echo "そのサービスは登録されていません。"
      read -p "サービスの登録を行いますか？(y / n)" register
      case $register in
        "y")
        # ファイルを暗号化
        openssl enc -e -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in data.txt -out enc-data.txt
        # 復号化ファイルの削除
        rm data.txt
        ./add.sh
        break
        ;;
        *)
        echo "もう一度入力してください。"
        ;;
      esac
    fi
  # 入力がなければ以下を処理
  else
    read -p "前のページに戻りますか？(y / n)" choose
    case $choose in
      "y")
        # ファイルを暗号化
        openssl enc -e -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in data.txt -out enc-data.txt
        # 復号化ファイルの削除
        rm data.txt
        break
        ;;
      *)
        echo "もう一度入力してください。"
        ;;
    esac
  fi
done
