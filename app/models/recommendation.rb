class Recommendation < ApplicationRecord
  has_many :board_recommendations, dependent: :destroy
  has_many :boards, through: :board_recommendations
  has_many :ansewr_recommendations, dependent: :destroy
  has_many :answers, through: :ansewr_recommendations
end
