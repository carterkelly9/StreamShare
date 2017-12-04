class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :owner_id
      t.string :guest_id

      t.timestamps null: false
    end
  end
end
