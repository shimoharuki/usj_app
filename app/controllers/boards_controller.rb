class BoardsController < ApplicationController
  def index
    @search = Board.ransack(params[:q])
    @boards = @search.result(distinct: true).includes(:tags).tagged_with(params[:tag_name]) if params[:tag_name].present?
    @boards = @boards.page(params[:page]).per(15)

    respond_to do |format|
      format.html 
      format.json { render json: @boards }
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def likes
    @like_boards = current_user.like_boards.page(params[:page]).per(15)
  end
end
