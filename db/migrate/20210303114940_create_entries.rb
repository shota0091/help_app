class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.refarence :user,foreign_key: true,null: false
      t.refarence :room,foreign_key: true,null: false
      t.timestamps
    end
  end
end
