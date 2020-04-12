
# 都道府県データ　[外出し予定]
pref_data = [
    { pref: "北海道", capital: "札幌市", region: "北海道・東北地方"},
    { pref: "青森県", capital: "青森市", region: "北海道・東北地方"},
    { pref: "岩手県", capital: "盛岡市", region: "北海道・東北地方"},
    { pref: "秋田県", capital: "秋田市", region: "北海道・東北地方"},
    { pref: "宮城県", capital: "仙台市", region: "北海道・東北地方"},
    { pref: "山形県", capital: "山形市", region: "北海道・東北地方"},
    { pref: "福島県", capital: "福島市", region: "北海道・東北地方"},
    { pref: "青森県", capital: "札幌市", region: "北海道・東北地方"},
    { pref: "栃木県", capital: "宇都宮市", region: "関東地方"},
    { pref: "群馬県", capital: "前橋市", region: "関東地方"},
    { pref: "茨城県", capital: "水戸市", region: "関東地方"},
    { pref: "千葉県", capital: "千葉市", region: "関東地方"},
    { pref: "埼玉県", capital: "さいたま市", region: "関東地方"},
    { pref: "東京都", capital: "新宿区", region: "関東地方"},
    { pref: "神奈川県", capital: "横浜市", region: "関東地方"},
    { pref: "静岡県", capital: "静岡市", region: "中部地方"},
    { pref: "愛知県", capital: "名古屋市", region: "中部地方"},
    { pref: "三重県", capital: "津市", region: "中部地方"},
    { pref: "長野県", capital: "長野市", region: "中部地方"},
    { pref: "岐阜県", capital: "岐阜市", region: "中部地方"},
    { pref: "新潟県", capital: "新潟市", region: "中部地方"},
    { pref: "富山県", capital: "富山市", region: "中部地方"},
    { pref: "福井県", capital: "福井市", region: "中部地方"},
    { pref: "石川県", capital: "金沢市", region: "中部地方"},
    { pref: "滋賀県", capital: "大津市", region: "関西地方"},
    { pref: "京都府", capital: "京都市", region: "関西地方"},
    { pref: "奈良県", capital: "奈良市", region: "関西地方"},
    { pref: "和歌山県", capital: "和歌山市", region: "関西地方"},
    { pref: "大阪府", capital: "大阪市", region: "関西地方"},
    { pref: "兵庫県", capital: "神戸市", region: "関西地方"},
    { pref: "岡山県", capital: "岡山市", region: "中国・四国地方"},
    { pref: "鳥取県", capital: "鳥取市", region: "中国・四国地方"},
    { pref: "島根県", capital: "松江市", region: "中国・四国地方"},
    { pref: "広島県", capital: "広島市", region: "中国・四国地方"},
    { pref: "山口県", capital: "山口市", region: "中国・四国地方"},
    { pref: "香川県", capital: "高松市", region: "中国・四国地方"},
    { pref: "愛媛県", capital: "松山市", region: "中国・四国地方"},
    { pref: "徳島県", capital: "徳島市", region: "中国・四国地方"},
    { pref: "高知県", capital: "高知市", region: "中国・四国地方"},
    { pref: "福岡県", capital: "福岡市", region: "九州・沖縄地方"},
    { pref: "佐賀県", capital: "佐賀市", region: "九州・沖縄地方"},
    { pref: "長崎県", capital: "長崎市", region: "九州・沖縄地方"},
    { pref: "大分県", capital: "大分市", region: "九州・沖縄地方"},
    { pref: "熊本県", capital: "熊本市", region: "九州・沖縄地方"},
    { pref: "宮崎県", capital: "宮崎市", region: "九州・沖縄地方"},
    { pref: "鹿児島県", capital: "鹿児島市", region: "九州・沖縄地方"},
    { pref: "沖縄県", capital: "那覇市", region: "九州・沖縄地方"}
]

# エラーメッセージ[外出し予定]
def error_message
    puts <<~EOS

        入力内容に誤りがあります。
        クイズを終了します。（再度実行してください）

    EOS
end




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
    error_message
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
    error_message
    exit
end

quiz = Quiz.new(QUIZ_MODE, QUIZ_COUNT, pref_data)
# quiz.create_quiz(pref_data)
# quiz.question

quiz_order = quiz.create_quiz_order
quiz.question