class AddRecommendationIdToBoards < ActiveRecord::Migration[7.0]
  def change
    add_reference :boards, :recommendation, foreign_key: true
  end
end
