class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  pg_search_scope :search,
  against: [:email, :nickname],
  using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  validates :nickname, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :reviews

  end
