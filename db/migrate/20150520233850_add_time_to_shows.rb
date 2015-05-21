class AddTimeToShows < ActiveRecord::Migration
  def change
    add_column :shows, :time, :datetime
  end
end
