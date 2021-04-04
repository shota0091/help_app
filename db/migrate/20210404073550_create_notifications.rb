class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :visitor, null: false, foreign_key: { to_table: :users }
      t.references :visited, null: false, foreign_key: { to_table: :users }
      t.references :room, foreign_key: true
      t.references :message, foreign_key: true
      t.string :action
      t.boolean :cheaked

      t.timestamps
    end
  end
end
