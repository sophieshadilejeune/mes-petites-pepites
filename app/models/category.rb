class Category < ApplicationRecord
  has_many :places, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end

