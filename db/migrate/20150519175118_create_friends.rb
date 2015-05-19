class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
