class Admin::BoardsController < Admin::BaseController
  before_action :set_board, only: %i[show edit update destroy]
  def index
    @search = Board.ransack(params[:q])
    @boards = @search.result(distinct: true).includes(:user).order(created_at: :desc)
    @boards = Board.tagged_with("#{params[:tag_name]}") if params[:tag_name]
    @boards = @boards.page(params[:page]).per(10)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to admin_boards_path, success: '投稿しました'
    else
      flash.now['danger'] = '失敗しましたん'
      render :new
    end
  end

  def edit; end
  def show; end

  def update
    if @board.update(board_params)
      redirect_to admin_board_path(@board), success: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Board.model_name.human)
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to admin_boards_path, success: '削除しました'
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body, :tag_list)
  end
end
