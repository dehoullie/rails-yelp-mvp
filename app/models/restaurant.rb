class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # Validations
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian),
    message: "%{value} is not a valid restaurant category" }

  def average_rating
    return false if reviews.empty?
    reviews.average(:rating).to_f.round(1)
  end
end
