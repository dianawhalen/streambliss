class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :watchlist_releases
  has_many :releases, through: :watchlist_releases
end
