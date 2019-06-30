class AddFilterToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :filter, :integer
  end
end
