class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.datetime :date
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
