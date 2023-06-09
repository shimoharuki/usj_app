class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :choice
  has_many :recommendations, through: :ansewr_recommendations
  has_many :ansewr_recommendations, dependent: :destroy

  def check_question_text
    @question_text = @question.question_text
    if @question_text == 'どのようにUSJを楽しみたいですか。'
      @question = Question.find_by(question_text: '誰とUSJに遊びに行きますか。')
      @choice = Choice.find_by(question_id: @question.id)
      redirect_to new_answer_path(question_id: @question.id, choice_id: @choice.id)
    elsif @question_text == '誰とUSJに遊びに行きますか。'
      @question = Question.find_by(question_text: 'お目当てのエリアはありますか。')
      @choice = Choice.find_by(question_id: @question.id)
      redirect_to new_answer_path(question_id: @question.id, choice_id: @choice.id)
    else
      redirect_back_or_to main_index_path
    end
  end
end
