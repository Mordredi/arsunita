class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :num_of_general
      t.belongs_to :show, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
