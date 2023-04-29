# 1.ファイルを操作できる
- $ cat /etc/hosts
# 2.ファイルの中身をスクロール表示
- $ less /etc/hots
# 3.ファルの作成
- $ touch READEME.md
# 4.ファイル名の変更
- $ mv READEME.md TMP.md
# 5.ファイルのコピー
- $ cp TMP.md COPY.md
# 6.ファイルの削除
- $ rm TMP.md
# 7.シンボリックリンク
- $ ln -s README.md README_SYMBOLIC.md
# 8.ファイルの検索
- $ find . -type f -name "*README*"  // これでファイル名にREADMEが含まれる全てのファイルを抽出
- $ grep -rnw './' -e 'README'  // これでREADMEという文字列が含まれるファイルと、その文字列が存在する行数を表示
# 9.検索
- $ grep '\<a' sample.txt  // aから始まる単語を検索
- $ grep 'a\b' sample.txt  // aで終わる単語を検索
- $ grep 'a' sample.txt  // aが含まれる単語を検索
