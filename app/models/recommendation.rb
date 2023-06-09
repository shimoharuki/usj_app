class Recommendation < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  belongs_to :board
end
