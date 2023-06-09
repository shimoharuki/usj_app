class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: %i[show edit update destroy]
  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to new_admin_choice_path(question_id: @question.id), success: '成功しました'
    else
      flash.now['danger'] = '失敗しましたん'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to edit_admin_choice_path(question_id: @question.id), success: '編集しました'
    else
      flash.now[:danger] = '失敗しました'
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to admin_choices_path, success: '削除しました'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question_text)
  end
end
