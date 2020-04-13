module Message
  
  module_function

  # エラーメッセージ
  def error_message
    puts <<~EOS

        入力内容に誤りがあります。
        クイズを終了します。（再度実行してください）

    EOS
  end


end