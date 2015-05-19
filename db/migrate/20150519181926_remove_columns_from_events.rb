class RemoveColumnsFromEvents < ActiveRecord::Migration
  change_table :events do |t|
    t.remove :num_of_seats, :venue, :address_one, :address_two, :city, :province, :country, :latitude, :longitude
  end
end
