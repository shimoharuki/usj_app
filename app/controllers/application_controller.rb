class ApplicationController < ActionController::Base
  before_action :set_board

  protect_from_forgery with: :exception
  # 第 1 引数 => model名 :user (必須)
  # 第 2 引数 => column名 :name (必須)
  # 第 3 引数 => オプション full: true (任意)
  autocomplete :board, :title, full: true # 追加
  private

  def set_board
    @search = Board.ransack(params[:q])
    @boards = @search.result(distinct: true).includes(:user).order(created_at: :desc)
    @boards = @boards.page(params[:page]).per(10)
  end
end
