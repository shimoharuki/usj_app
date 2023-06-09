class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @question = Question.find_by(question_text: 'どのようにUSJを楽しみたいですか。')
      @choice = Choice.find_by(question_id: @question.id)
      redirect_to new_answer_path(question_id: @question.id, choice_id: @choice.id)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
