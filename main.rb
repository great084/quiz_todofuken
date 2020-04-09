        # 都道府県のデータ
        pref_data = [
            { pref: "静岡県", capital: "静岡市", region: "中部地方"},
            { pref: "愛知県", capital: "名古屋市", region: "中部地方"},
            { pref: "三重県", capital: "津市", region: "中部地方"},
            { pref: "岐阜県", capital: "岐阜市", region: "中部地方"},
            { pref: "長野県", capital: "長野市", region: "中部地方"},
            { pref: "富山県", capital: "富山市", region: "中部地方"},
            { pref: "福井県", capital: "福井市", region: "中部地方"},
            { pref: "石川県", capital: "金沢市", region: "中部地方"}
        ]

# モードの選択
# （県名から県庁所在地あて、県庁所在地から県名あて）
puts <<~TEXT
    ######  都道府県クイズ　START！！  ######
    クイズのモードは、２つあるよ。
    1 : 都道府県名から県庁所在地を答える
    2 : 県庁所在地から県名を答える
    ####################################
TEXT

print "クイズのモードを選んで、入力してね。(1 or 2): "
inputs_1 = gets.chomp.to_i
# p "#{inputs_1} : #{inputs_1.class}"

# 入力内容のチェック　＆　エラーメッセージ
if (1..2) === inputs_1
    QUIZ_MODE = inputs_1
else
    puts <<~EOS
        入力内容に誤りがあります。
        再度入力してください
    EOS
end
# クイズ数・地域別の選択
puts <<~TEXT

    クイズの数は１〜４７問の間で選べるよ！
TEXT
print "こたえるクイズ数を、入力してね。(1 〜 47): "
inputs_2 = gets.chomp.to_i
# p "#{inputs_2} : #{inputs_2.class}"
# 入力内容のチェック　＆　エラーメッセージ
if (1..47) === inputs_2
    QUIZ_COUNT = inputs_2
else
    puts <<~EOS
        入力内容に誤りがあります。
        再度入力してください
    EOS
end



# クイズ出題＆回答
class Quiz

    def initialize(mode, count)
        @mode = mode
        @count = count

    end

    def create_quiz(data)
        quiz_order = (0..6).to_a.shuffle.slice(0..@count-1)
        @quiz_all = quiz_order.map{ |n| data[n] }
        # puts @quiz_all
    end

    def question
        puts  "---------------------------------"
        case @mode
        when 1
            @quiz_all.each do |quiz|
                print "問題：【#{quiz[:pref]}】の県庁所在地は？: "
                answer = gets.chomp
                puts (answer == quiz[:capital]) ? '正解！' : '違います！'
                puts  "---------------------------------"
            end                
        when 2
            @quiz_all.each do |quiz|
                print "問題：【#{quiz[:capital]}】がある都道府県は？: "
                answer = gets.chomp
                puts (answer == quiz[:pref]) ? '正解！' : '違います！'
                puts  "---------------------------------"
            end                
        else
            #
        end
    end

end

# 成績発表

quiz = Quiz.new(QUIZ_MODE, QUIZ_COUNT)
quiz.create_quiz(pref_data)
quiz.question
