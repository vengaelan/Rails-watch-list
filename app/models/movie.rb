class Movie < ApplicationRecord
  # Associations
  has_many :bookmarks

  # Validations
  validates :title,:overview, presence: true
  validates :title, uniqueness: true
end
