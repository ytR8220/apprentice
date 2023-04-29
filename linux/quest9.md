# 1.ファイルのオーナーとグループ
- $ ls -l REEADME.md
- -rw-r--r-- 1 root root 0 Apr 29 05:23 README.md
# 2.ファイルのパーミッション
- rootユーザーに読み込みと書き込みの権限が付与されており、rootグループと他のユーザーは読み込みのみ許可されている。
# 3.ファイルのパーミッションの設定
- -rw-r--r-- 1 user user 0 Apr 29 05:23 README.md
- $ chmod u+rwx README.md
- -rwxr--r-- 1 user user 0 Apr 29 05:23 README.md
# 4.ディレクトリのパーミッションの設定
- drwxr-xr-x 2 user user 4096 Apr 29 05:35 permission
- $ chmod g+w permission
- drwxrw-r-x 2 user user 4096 Apr 29 05:35 permission
# 5.スーパーユーザー
- drwxr-xr-x 2 root root 4096 Apr 29 05:41 superuser
