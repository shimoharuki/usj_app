class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @choice = Choice.find(params[:choice_id])
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.save
      check_question_text
    else
      render :new
    end
  end

  private

  def answer_params
    {
      question_id: params[:question_id],
      choice_id: params[:choice_id],
      choices: params.dig(:answer, :choices) || []
    }
  end

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
