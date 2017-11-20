class AddDataColumnToMedia < ActiveRecord::Migration
  def change
    add_column :media, :data, :binary
  end
end
