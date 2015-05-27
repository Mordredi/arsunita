class AddImageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :image, :string, :default => "http://upload.wikimedia.org/wikipedia/commons/8/89/The_Main_House_Theatre,_The_Maltings_Theatre_%26_Arts_Centre,_Berwick-upon-Tweed,_March_2009.jpg"
  end
end
