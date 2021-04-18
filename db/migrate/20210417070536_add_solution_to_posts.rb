class AddSolutionToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :solution, :string
  end
end
