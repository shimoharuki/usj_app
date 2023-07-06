class BoardsController < ApplicationController
  autocomplete :board, :title, :limit =>2, :full => true
  def index
  end

  def show
    @board = Board.find(params[:id])
  end

  def likes
    @like_boards = current_user.like_boards.page(params[:page]).per(15)
  end
end
