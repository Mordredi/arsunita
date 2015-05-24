class AddDefaultToFriendsAccepted < ActiveRecord::Migration
  def change
    change_column_default :friendships, :confirmed, false
  end
end
