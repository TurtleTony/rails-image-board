class CreateDownvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :downvotes do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
