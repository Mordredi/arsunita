class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.belongs_to :user, index: true, foreign_key: true
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
