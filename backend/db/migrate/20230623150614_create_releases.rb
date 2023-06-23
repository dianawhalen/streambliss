class CreateReleases < ActiveRecord::Migration[7.0]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :type
      t.integer :show_id
      t.integer :year
      t.string :result_type
      t.string :poster_url

      t.timestamps
    end
  end
end
