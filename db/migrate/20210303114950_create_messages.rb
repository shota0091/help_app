class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user ,foreign_key: true,nul: false
      t.references :room ,foreign_key: true,nul: false
      t.text :messages
      t.text :image
      t.timestamps
    end
  end
end
