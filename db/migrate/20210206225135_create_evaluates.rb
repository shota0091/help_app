class CreateEvaluates < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluates do |t|
      t.integer :speedy
      t.integer :kindness
      t.integer :frantically
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
