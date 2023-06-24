class Source < ApplicationRecord
  has_many :release_sources
  has_many :releases, through: :release_sources
end
