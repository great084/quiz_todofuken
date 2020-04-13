require './prefecture'
require './message'



# クイズ出題＆回答
class Quiz

    def initialize(mode, count, data)
        @mode = mode
        @count = count
        @data = data
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

Message.start_message

Message.mode_promt_message
QUIZ_MODE = gets.chomp.to_i

# 入力内容のチェック
unless (1..2) === QUIZ_MODE
    Message.error_message
    exit
end

# クイズ数・地域別の選択
Message.count_promt_message
QUIZ_COUNT = gets.chomp.to_i

# 入力内容のチェック
unless (1..47) === QUIZ_COUNT
    Message.error_message
    exit
end

quiz = Quiz.new(QUIZ_MODE, QUIZ_COUNT, pref_data)
quiz.create_quiz_order
quiz.question
