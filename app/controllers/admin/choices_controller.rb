class Admin::ChoicesController < Admin::BaseController
  before_action :set_choice, only: %i[show edit update destroy]
  def new
    question_id = params[:question_id]
    @question = Question.find(question_id)
    @choice = Choice.new
  end

  def index
    question_id = params[:question_id]
    @questions = Question.all
    @choices = Choice.all
  end

  def show
    question_id = @choice.question_id
    @question = Question.find(question_id)
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      redirect_to admin_choices_path, success: '成功しました'
    else
      flash.now['danger'] = '失敗しましたん'
      render :new
    end
  end

  def edit
    question_id = params[:question_id]
    @question = Question.find(question_id)
  end

  def update
    if @choice.update(choice_params)
      redirect_to admin_choices_path, success: '成功しました'
    else
      flash.now[:danger] = '失敗しました'
      render :edit
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:choice_name, :question_id)
  end

  def set_choice
    @choice = Choice.find(params[:id])
  end
end
