class Question < ApplicationRecord
    acts_as_taggable
    has_many :answers
    has_many :choices, dependent: :destroy
    belongs_to :user

end
