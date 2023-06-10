class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :choice
  has_many :recommendations, through: :ansewr_recommendations
  has_many :ansewr_recommendations, dependent: :destroy
end
