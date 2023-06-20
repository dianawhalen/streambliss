class Release < ApplicationRecord
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
end
