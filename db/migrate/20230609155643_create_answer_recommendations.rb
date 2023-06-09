class CreateAnswerRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_recommendations do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :recommendation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
