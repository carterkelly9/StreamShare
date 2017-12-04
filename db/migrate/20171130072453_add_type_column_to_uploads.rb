class AddTypeColumnToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :type, :string
  end
end
