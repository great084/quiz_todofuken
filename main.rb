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
        num_correct = 0
        num = 1
        case @mode
        when 1
            @quiz_order.each do |data_no|
                print "問題 #{num}：【#{@data[data_no][:pref]}】の県庁所在地は？: "
                answer = gets.chomp
                if answer == @data[data_no][:capital]
                    puts '正解！'
                    num_correct += 1
                else
                    puts '違います！'
                end
                puts  "---------------------------------"
                num += 1
            end
            return num_correct
        when 2
            @quiz_order.each do |data_no|
                print "問題 #{num}：【#{@data[data_no][:capital]}】がある都道府県は？: "
                answer = gets.chomp
                if answer == @data[data_no][:pref]
                    puts '正解！'
                    num_correct += 1
                else
                    puts '違います！'
                end
                puts  "---------------------------------"
                num += 1
            end
            return num_correct
        else
            #
        end
    end           
        
end

# クイズモードの選択
Message.start_message

Message.mode_promt_message
quiz_mode = gets.chomp.to_i

# 入力内容のチェック
unless (1..2) === quiz_mode
    Message.error_message
    exit
end

# クイズ数・地域別の選択
Message.count_promt_message
quiz_count = gets.chomp.to_i

# 入力内容のチェック
unless (1..47) === quiz_count
    Message.error_message
    exit
end

quiz = Quiz.new(quiz_mode, quiz_count, pref_data)
quiz.create_quiz_order
correct_count = quiz.question
Message.result_message(quiz_count, correct_count)
