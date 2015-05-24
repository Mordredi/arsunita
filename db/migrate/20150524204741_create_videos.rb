class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :url

      t.timestamps null: false
    end
  end
end
