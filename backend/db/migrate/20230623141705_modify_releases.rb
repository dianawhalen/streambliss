class ModifyReleases < ActiveRecord::Migration[7.0]
  def change
    remove_column :releases, :tmdb_id, :string
    remove_column :releases, :tmdb_type, :string
    remove_column :releases, :imdb_id, :string
    remove_column :releases, :season_number, :integer
    remove_column :releases, :poster_url, :string
    remove_column :releases, :source_release_date, :date
    remove_column :releases, :source_id, :integer
    remove_column :releases, :source_name, :string
    remove_column :releases, :is_original, :boolean
    remove_column :releases, :watchlist_id, :bigint

    add_column :releases, :show_id, :integer
    add_column :releases, :year, :integer
    add_column :releases, :result_type, :string
    add_column :releases, :poster_url, :string
  end
end
