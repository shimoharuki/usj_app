class AddChoicesToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :choices, :string
  end
end
