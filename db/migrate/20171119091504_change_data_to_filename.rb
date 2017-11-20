class ChangeDataToFilename < ActiveRecord::Migration
  def change
    rename_column :media, :data, :filename
  end
end
