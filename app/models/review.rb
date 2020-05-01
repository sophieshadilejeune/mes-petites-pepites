class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :content, length: { minimum: 3, maximum: 200 }
  validates :content, presence: true
  validates :content, uniqueness: true
  validates :rating, presence: true
end
