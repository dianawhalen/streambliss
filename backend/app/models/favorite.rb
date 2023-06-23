class Favorite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :release, dependent: :destroy
end
