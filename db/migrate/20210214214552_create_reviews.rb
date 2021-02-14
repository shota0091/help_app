class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :speedy
      t.integer :kindness
      t.integer :frantically
      t.integer :reviewer_id
      t.integer :reviewing_id
      t.timestamps
    end
  end
end
