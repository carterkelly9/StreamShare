class AddMediumToShare < ActiveRecord::Migration
  def change
    add_column :shares, :medium_id, :string
  end
end
