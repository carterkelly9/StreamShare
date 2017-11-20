class AddUserIdToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :user_id, :string
  end
end
