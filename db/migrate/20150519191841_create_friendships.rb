class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friendee_id
      t.integer :friender_id
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
