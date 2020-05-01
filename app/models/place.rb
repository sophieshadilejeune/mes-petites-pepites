class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :category
  has_many :reviews
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 300 }
end
