class CreateReleases < ActiveRecord::Migration[7.0]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :type
      t.integer :tmdb_id
      t.string :tmdb_type
      t.string :imdb_id
      t.integer :season_number
      t.string :poster_url
      t.date :source_release_date
      t.integer :source_id
      t.string :source_name
      t.boolean :is_original
      t.references :watchlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
