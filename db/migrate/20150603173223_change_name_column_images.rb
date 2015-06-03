class ChangeNameColumnImages < ActiveRecord::Migration
  change_table :images do |t|
    t.rename :name, :image
  end
end
