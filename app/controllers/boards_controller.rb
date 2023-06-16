class BoardsController < ApplicationController
  def index
    @boards = Board.all
    @boards = @boards.includes(:tags).tagged_with(params[:tag_name]) if params[:tag_name].present?
    @boards = @boards.page(params[:page]).per(21)
  end

  def show
    @board = Board.find(params[:id])
  end

  def likes
    @like_boards = current_user.like_boards.page(params[:page]).per(21)
  end
end
