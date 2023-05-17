class Admin::BoardsController < Admin::BaseController
    def new
        @board = Board.new
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to boards_path, success:"投稿しました"
        else
            flash.now['danger'] = "失敗しましたん"
            render :new
        end
    end

    private

    def board_params
      params.require(:board).permit(:title, :body)
    end
end
