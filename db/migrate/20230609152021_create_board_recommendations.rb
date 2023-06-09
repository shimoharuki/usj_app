class CreateBoardRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :board_recommendations do |t|
      t.references :board, null: false, foreign_key: true
      t.references :recommendation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
