class AddDefaultToArtsWorkerInUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :arts_worker, false
  end
end
