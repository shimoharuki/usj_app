class Question < ApplicationRecord
  has_many :answers
  has_many :choices, dependent: :destroy
  belongs_to :user
end
