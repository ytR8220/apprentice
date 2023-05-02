# 暗号化された保管ファイルを復号化
openssl enc -d -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in enc-data.txt -out data.txt
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
# ファイルを暗号化
openssl enc -e -aes-256-cbc -base64 -pbkdf2 -pass pass:123456 -in data.txt -out enc-data.txt
# 復号化ファイルの削除
rm data.txt
