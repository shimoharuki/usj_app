class AddChoiceIdToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :choice, foreign_key: true
  end
end
