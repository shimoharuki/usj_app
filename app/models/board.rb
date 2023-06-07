class Board < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :recommendations
  acts_as_taggable
  def self.ransackable_attributes(_auth_object = nil)
    %w[title body created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[user]
  end
end
