class CreateReleaseSources < ActiveRecord::Migration[6.0]
  def change
    create_table :release_sources do |t|
      t.references :release, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
