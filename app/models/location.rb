class Location < ApplicationRecord
  belongs_to :city
  belongs_to :user
  validates :city_id, uniqueness: { scope: :user_id, message: ": You already added this city" }
end
