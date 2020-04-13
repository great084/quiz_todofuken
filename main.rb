require './prefecture'
require './message'



# クイズ出題＆回答
class Quiz

    def initialize(mode, count, data)
        @mode = mode
        @count = count
        @data = data
    end

    def create_quiz(data)
        quiz_order = (0..46).to_a.shuffle.slice(0..@count-1)
        @quiz_all = quiz_order.map{ |n| data[n] }
        # puts @quiz_all
    end

    def create_quiz_order
        @quiz_order = (0..46).to_a.shuffle.slice(0..@count-1)
    end

    def question
        puts  "---------------------------------"
        num = 1
        case @mode
        when 1
            @quiz_order.each do |data_no|
                print "問題 #{num}：【#{@data[data_no][:pref]}】の県庁所在地は？: "
                answer = gets.chomp
                puts (answer == @data[data_no][:capital]) ? '正解！' : '違います！'
                puts  "---------------------------------"
                num += 1
            end
        when 2
            @quiz_order.each do |data_no|
                print "問題 #{num}：【#{@data[data_no][:capital]}】がある都道府県は？: "
                answer = gets.chomp
                puts (answer == @data[data_no][:pref]) ? '正解！' : '違います！'
                puts  "---------------------------------"
                num += 1
            end
        else
            #
        end
    end           
        
end

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

# 入力内容のチェック
if (1..2) === inputs_1
    QUIZ_MODE = inputs_1
else
    Message.error_message
    exit
end

# クイズ数・地域別の選択
puts <<~TEXT

    クイズの数は１〜４７問の間で選べるよ！
TEXT
print "こたえるクイズ数を、入力してね。(1 〜 47): "
inputs_2 = gets.chomp.to_i

# 入力内容のチェック
if (1..47) === inputs_2
    QUIZ_COUNT = inputs_2
else
    Message.error_message
    exit
end

quiz = Quiz.new(QUIZ_MODE, QUIZ_COUNT, pref_data)
# quiz.create_quiz(pref_data)
# quiz.question

quiz_order = quiz.create_quiz_order
quiz.question