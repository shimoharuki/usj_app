class RecommendationsController < ApplicationController
  def create
    if Recommendation.exists?(user_id: current_user.id)
      redirect_to recommendations_path
    else
      @answers = []
      @boards = []
      firsr_recommend
      second_recommend
      third_recommend
      @recommendation = Recommendation.new
      @recommendation.user_id = current_user.id

      @boards.each do |board|
        @recommendation.boards << board
      end

      @answers.each do |answer|
        @recommendation.answers << answer
      end
      @recommendation.boards = @recommendation.boards.uniq { |board| board.id }
      @recommendation.save
      redirect_to recommendations_path
    end
  end

  def index
    @recommendations = Recommendation.where(user_id: current_user.id)
    @boards = []
    @recommendations.each do |recommendation|
      recommendation.boards.each do |board|
        @boards << board
      end
    end
    @recommendation_boards = current_user.recommendation.boards.page(params[:page]).per(21)
  end
end
