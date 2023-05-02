echo "パスワードマネージャーへようこそ！"
# Exitが入力されるまで終了しない
while true; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Reset Password/Exit)："
  read choose
  case $choose in
    "Exit")
      echo "Thank you!"
      exit
      ;;
    # Add Passwordと入力することで登録に移行
    "Add Password")
      ./add.sh
      ;;
    # Get Passwordと入力することで検索に移行
    "Get Password")
      ./get.sh
      ;;
    # Reset Passwordと入力することで削除選択に移行
    "Reset Password")
      ./reset.sh
      ;;
    * )
      echo "入力が間違えています。Add Password/Get Password/Reset Password/Exit から入力してください。"
  esac
done
