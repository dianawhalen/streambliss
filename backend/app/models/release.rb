class Release < ApplicationRecord
  has_many :release_sources
  has_many :sources, through: :release_sources
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
