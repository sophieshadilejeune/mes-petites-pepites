class Place < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :category
  belongs_to :user
  belongs_to :city
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 300 }
  validates :address, presence: true
end
