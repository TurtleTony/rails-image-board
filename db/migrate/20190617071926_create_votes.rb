class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.integer :voteable_id
      t.string :voteable_type
      t.integer :value

      t.timestamps
    end
  end
end
