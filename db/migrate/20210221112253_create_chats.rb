class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.text :message
      t.string :image
      t.references :messenger, null: false, foreign_key: { to_table: :users }
      t.references :messenging, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
