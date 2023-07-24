class RenameTypeInReleases < ActiveRecord::Migration[7.0]
  def change
    rename_column :releases, :type, :release_type
  end
end
