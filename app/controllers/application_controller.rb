class ApplicationController < ActionController::Base
  before_action :set_board

  def firsr_recommend
    @answers = Answer.where(user_id: current_user.id)
    @answers_with_choices = @answers.select do |answer|
      answer.choices.include?('とにかくアトラクションに乗りたい') || answer.choices.include?('パークの美味しい食事が食べたい') || answer.choices.include?('たくさんの写真を撮りたい') || answer.choices.include?('ランダム')
    end

    @answers_with_choices.each do |answer|
      choices = JSON.parse(answer.choices)

      @boards += Board.joins(:tags).where('tags.name = ?', 'atraction') if choices.include?('とにかくアトラクションに乗りたい')

      @boards += Board.joins(:tags).where('tags.name = ?', 'food') if choices.include?('パークの美味しい食事が食べたい')

      @boards += Board.joins(:tags).where('tags.name = ?', 'picture') if choices.include?('たくさんの写真を撮りたい')

      @boards += Board.joins(:tags).where('tags.name = ?', 'randam') if choices.include?('ランダム')

      # 他の選択肢に対する処理を追加する場合は、同様に条件分岐を行う
    end
  end

  def second_recommend
    @answers = Answer.where(user_id: current_user.id)
    @answers_with_choices = @answers.select do |answer|
      answer.choices.include?('家族') || answer.choices.include?('友達') || answer.choices.include?('恋人') || answer.choices.include?('その他')
    end

    @answers_with_choices.each do |answer|
      choices = JSON.parse(answer.choices)

      @boards += Board.joins(:tags).where('tags.name = ?', 'family') if choices.include?('家族')

      @boards += Board.joins(:tags).where('tags.name = ?', 'friend') if choices.include?('友達')

      @boards += Board.joins(:tags).where('tags.name = ?', 'lover') if choices.include?('恋人')

      @boards += Board.joins(:tags).where('tags.name = ?', 'other') if choices.include?('その他')
      # 他の選択肢に対する処理を追加する場合は、同様に条件分岐を行う
    end
  end

  def third_recommend
    @answers = Answer.where(user_id: current_user.id)
    @answers_with_choices = @answers.select do |answer|
      answer.choices.include?('スーパーニンテンドーワールド') || answer.choices.include?('アミティエリア(ジョーズ)') || answer.choices.include?('ワンダーランドエリア') || answer.choices.include?('ジュラシックパークエリア') || answer.choices.include?('ハリーポッターエリア') || answer.choices.include?('ミニオンパーク') || answer.choices.include?('その他')
    end

    @answers_with_choices.each do |answer|
      choices = JSON.parse(answer.choices)

      @boards += Board.joins(:tags).where('tags.name = ?', 'SNW') if choices.include?('スーパーニンテンドーワールド')

      @boards += Board.joins(:tags).where('tags.name = ?', 'JAWS') if choices.include?('アミティエリア(ジョーズ)')

      @boards += Board.joins(:tags).where('tags.name = ?', 'WR') if choices.include?('ワンダーランドエリア')

      @boards += Board.joins(:tags).where('tags.name = ?', 'JP') if choices.include?('ジュラシックパークエリア')

      @boards += Board.joins(:tags).where('tags.name = ?', 'HP') if choices.include?('ハリーポッターエリア')

      @boards += Board.joins(:tags).where('tags.name = ?', 'MNR') if choices.include?('ミニオンパーク')

      @boards += Board.joins(:tags).where('tags.name = ?', 'other_area') if choices.include?('その他')
      # 他の選択肢に対する処理を追加する場合は、同様に条件分岐を行う
    end
  end

  private

  def set_board
    @search = Board.ransack(params[:q])
    @boards = @search.result(distinct: true).includes(:user).order(created_at: :desc)
    @boards = @boards.page(params[:page]).per(10)
  end
end
