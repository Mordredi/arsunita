class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :num_of_seats
      t.integer :price_for_general
      t.string :venue
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
