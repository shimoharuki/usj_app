class BoardRecommendation < ApplicationRecord
  belongs_to :board
  belongs_to :recommendation
end
