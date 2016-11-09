class Restaurant < ApplicationRecord

  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true

  validates :category, inclusion: CATEGORIES

  scope :sorted_by_ratings, -> { all.sort_by { |restaurant| -restaurant.average_rating } }

  def average_rating
    avg = reviews.reduce(0) { |sum, review| sum += review.rating.to_f  } / reviews.count
    avg.round(2)
  end
end
