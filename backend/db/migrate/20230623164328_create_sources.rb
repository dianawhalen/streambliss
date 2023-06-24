class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources do |t|
      t.integer :source_id
      t.string :source_name
      t.string :stream_type
      t.string :logo_url
      t.timestamps
    end
  end
end
