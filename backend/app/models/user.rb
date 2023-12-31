class User < ApplicationRecord
  has_secure_password
  has_one :watchlist
  has_many :watchlist_releases, through: :watchlist
  has_many :favorites, dependent: :destroy
  has_many :favorite_releases, through: :favorites, source: :release

  validates :username, :email, presence: true
end
