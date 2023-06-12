class AddRecommendationIdToBoards < ActiveRecord::Migration[7.0]
  def change
    add_reference :boards, :recommendation, null: false, foreign_key: true
  end
end
