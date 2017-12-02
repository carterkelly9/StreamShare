class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :owner_id
      t.string :medium_id
      t.string :key

      t.timestamps null: false
    end
  end
end
