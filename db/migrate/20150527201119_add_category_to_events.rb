class AddCategoryToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :category, index: true, foreign_key: true, :default => 7
  end
end
