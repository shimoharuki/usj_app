class AnswerRecommendation < ApplicationRecord
  belongs_to :answer
  belongs_to :recommendation
end
