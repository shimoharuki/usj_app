class Recommendation < ApplicationRecord
  has_many :board_recommendations, dependent: :destroy
  has_many :boards, through: :board_recommendations
  has_many :answer_recommendations, dependent: :destroy
  has_many :answers, through: :answer_recommendations
  ATTRACTION_CHOICE = 'とにかくアトラクションに乗りたい'.freeze
  FOOD_CHOICE = 'パークの美味しい食事が食べたい'.freeze
  EVENT_CHOICE = '期間限定イベントを楽しみたい'.freeze
  PREPARATION_CHOICE = '準備'.freeze
  FAMILY_CHOICE = '家族'.freeze
  FRIEND_CHOICE = '友達'.freeze
  LOVER_CHOICE = '恋人'.freeze
  OTHER_CHOICE = 'その他'.freeze
  SNW_CHOICE = 'スーパーニンテンドーワールド'.freeze
  JAWS_CHOICE = 'アミティエリア(ジョーズ)'.freeze
  WR_CHOICE = 'ワンダーランドエリア'.freeze
  JP_CHOICE = 'ジュラシックパークエリア'.freeze
  HP_CHOICE = 'ハリーポッターエリア'.freeze
  MNR_CHOICE = 'ミニオンパーク'.freeze
  OTHERAREA_CHOICE = 'その他'.freeze

  def first_recommend(answers)
    @answers = answers
    @boards = []
    @answers_with_choices = @answers.select do |answer|
      choices = JSON.parse(answer.choices)
      process_choice(choices, ATTRACTION_CHOICE, 'atraction')
      process_choice(choices, FOOD_CHOICE, 'food')
      process_choice(choices, EVENT_CHOICE, 'event')
      process_choice(choices, PREPARATION_CHOICE, 'preparation')
      # 他の選択肢に対する処理を追加する場合は、同様に呼び出す
    end
  end

  def second_recommend(answers)
    @answers = answers
    @boards = []
    @answers_with_choices = @answers.select do |answer|
      choices = JSON.parse(answer.choices)
      process_choice(choices, FAMILY_CHOICE, 'family')
      process_choice(choices, FRIEND_CHOICE, 'friend')
      process_choice(choices, LOVER_CHOICE, 'lover')
      process_choice(choices, OTHER_CHOICE, 'other')
      # 他の選択肢に対する処理を追加する場合は、同様に呼び出す
    end
  end

  def third_recommend(answers)
    @answers = answers
    @answers_with_choices = @answers.select do |answer|
      choices = JSON.parse(answer.choices)
      process_choice(choices, SNW_CHOICE, 'SNW')
      process_choice(choices, JAWS_CHOICE, 'JAWS')
      process_choice(choices, WR_CHOICE, 'WR')
      process_choice(choices, JP_CHOICE, 'JP')
      process_choice(choices, HP_CHOICE, 'HP')
      process_choice(choices, MNR_CHOICE, 'MNR')
      process_choice(choices, OTHERAREA_CHOICE, 'other_area')
      # 他の選択肢に対する処理を追加する場合は、同様に呼び出す
    end
  end

  private

  def process_choice(choices, choice, tag_name)
    @boards += Board.joins(:tags).where('tags.name = ?', tag_name) if choices.include?(choice)
  end
end
