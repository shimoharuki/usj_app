class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :choice
  has_many :recommendations, through: :answer_recommendations
  has_many :answer_recommendations, dependent: :destroy
end
