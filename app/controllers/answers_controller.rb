class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    #質問文3つを@questionsに代入
    #@questionsをもとにchoiceも取得
    @questions = Question.where(question_text: [
      'どのようにUSJを楽しみたいですか。',
      '誰とUSJに遊びに行きますか。',
      'お目当てのエリアはありますか。'
    ])
    @choices = Choice.where(question_id: @questions.pluck(:id))
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      redirect_to recommendations_path, info: '作成しました。左上のおすすめからご覧ください。'
    else
      render :new
    end
  end

  private

  def answer_params
    {
      question_id: 1,
      choice_id: 1,
      choices: params.dig(:answer, :choices) || []
    }
  end


  def check_choices
    @choices = @answer.choices
    @choices = JSON.parse(@choices)
    return unless @choices == ['', '', '', '', '', '']

    @choice = Choice.find_by(id: params[:choice_id])
    @answer.choices = ['準備']
  end
end
