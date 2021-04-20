class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :following, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
