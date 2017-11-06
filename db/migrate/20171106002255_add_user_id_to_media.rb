class AddUserIdToMedia < ActiveRecord::Migration
  def change
    add_column :media, :user_id, :string
  end
end
