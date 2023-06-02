class BoardsController < ApplicationController
    def index
        @boards = Board.all
        if params[:tag_name].present?
            @boards = @boards.tagged_with(params[:tag_name])
        end
        @boards = @boards.page(params[:page]).per(40)
    end
    def show
        @board = Board.find(params[:id])
    end
end
