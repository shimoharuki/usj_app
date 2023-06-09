class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  enum role: { general: 0, admin: 1 }

  validates :email, uniqueness: true
  validates :email, presence: true
  has_many :boards, dependent: :destroy
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true
  has_many :likes, dependent: :destroy
  has_many :like_boards, through: :likes, source: :board
  has_many :answers, dependent: :destroy
  has_one :recommendation, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email id name role updated_at]
  end

  def like(board)
    like_boards << board
  end

  def unlike(board)
    like_boards.destroy(board)
  end

  def like?(board)
    like_boards.include?(board)
  end
end
