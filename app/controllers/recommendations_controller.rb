class RecommendationsController < ApplicationController
  def create
    if Recommendation.exists?(user_id: current_user.id)
      redirect_to recommendations_path
    else
      @answers = []
      @recommendation = Recommendation.new
      @recommendation.user_id = current_user.id
      @answers = Answer.where(user_id: current_user.id)
      @recommendation.first_recommend(@answers)
      @recommendation.second_recommend(@answers)
      @recommendation.third_recommend(@answers)
      @boards = @boards.uniq { |board| board.id }
      @boards.each do |board|
        @recommendation.boards << board
      end

      @answers.each do |answer|
        @recommendation.answers << answer
      end
      @recommendation.save
    end
  end

  def index
    create
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
