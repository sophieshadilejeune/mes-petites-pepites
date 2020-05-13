class User < ApplicationRecord
  extend FriendlyId
  friendly_id :nickname, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :cities, through: :locations
  has_many :categories, through: :places
  include PgSearch::Model
  pg_search_scope :search,
  against: [:email, :nickname],
  using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  validates :nickname, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  end
