echo "パスワードマネージャーへようこそ！"
while true; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Reset Password/Exit)："
  read choose
  case $choose in
    "Exit")
      echo "Thank you!"
      exit
      ;;
    "Add Password")
      ./add.sh
      ;;
    "Get Password")
      ./get.sh
      ;;
    "Reset Password")
      ./reset.sh
      ;;
    * )
      echo "入力が間違えています。Add Password/Get Password/Reset Password/Exit から入力してください。"
  esac
done
