class CreateWatchlistReleases < ActiveRecord::Migration[7.0]
  def change
    create_table :watchlist_releases do |t|
      t.references :watchlist, null: false, foreign_key: true
      t.references :release, null: false, foreign_key: true

      t.timestamps
    end
  end
end
