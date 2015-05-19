class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :num_of_seats
      t.string :name
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :province
      t.string :country
      t.decimal :latitude, :scale => 6, :precision => 9
      t.decimal :longitude, :scale => 6, :precision => 9

      t.timestamps null: false
    end
  end
end
