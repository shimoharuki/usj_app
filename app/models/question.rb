class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :choices, dependent: :destroy
  belongs_to :user
end
