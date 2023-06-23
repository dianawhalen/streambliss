class WatchlistRelease < ApplicationRecord
  belongs_to :watchlist
  belongs_to :release
end
