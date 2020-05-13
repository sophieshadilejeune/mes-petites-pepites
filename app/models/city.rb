class City < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :locations
  has_many :users, through: :locations
  has_many :places
  validates :name, presence: true, uniqueness: true
end
