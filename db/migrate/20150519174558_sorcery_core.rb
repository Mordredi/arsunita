class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :first_name
      t.string :last_name
      t.string :profession
      t.text :description
      t.string :avatar
      t.boolean :arts_worker
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end