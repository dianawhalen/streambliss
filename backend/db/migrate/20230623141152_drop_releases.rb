class DropReleases < ActiveRecord::Migration[7.0]
  def up
    drop_table :releases
  end

  def down
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
