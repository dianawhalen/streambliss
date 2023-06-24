class ReleaseSource < ApplicationRecord
  belongs_to :release
  belongs_to :source
end
