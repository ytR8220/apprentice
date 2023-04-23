# "Hello World"を出力する関数
def hello
  print 'Hello World'
end

hello()

# 名前を引数に受け取り、与えられた名前の挨拶メッセージを出力する関数
def greeting(name)
  print "こんにちは、#{name}さん。"
end

print 'お名前を教えてください =>'
name = gets.chomp.to_s
greeting(name)