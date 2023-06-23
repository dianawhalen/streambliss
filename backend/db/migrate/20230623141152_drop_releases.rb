class DropReleases < ActiveRecord::Migration[7.0]
  def up
    drop_table :favorites
    drop_table :releases
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
