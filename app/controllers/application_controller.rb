class ApplicationController < ActionController::Base
  before_action :set_board
  private


  def set_board
    @search = Board.ransack(params[:q])
    @boards = @search.result(distinct: true).includes(:user).order(created_at: :desc)
    @boards = @boards.page(params[:page]).per(10)
  end
end
