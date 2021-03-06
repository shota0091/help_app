class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,null: false
      t.string :explanation,null: false
      t.string :image, null: false
      t.string :obtain, null: false
      t.integer :address_id,null: false
      t.integer :license_id,null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
