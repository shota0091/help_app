class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.refarence :user ,foreign_key: true,nul: false
      t.refarence :room ,foreign_key: true,nul: false
      t.timestamps
    end
  end
end
