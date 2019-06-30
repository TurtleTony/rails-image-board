class DropTableOldVoting < ActiveRecord::Migration[5.2]
  def change
    drop_table :upvotes
    drop_table :downvotes
  end
end
