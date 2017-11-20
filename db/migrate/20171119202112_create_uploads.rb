class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :title
      t.binary :attachment

      t.timestamps null: false
    end
  end
end
