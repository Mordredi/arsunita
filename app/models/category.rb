class Category < ActiveRecord::Base

  has_many :events

  valdiates :name, :presence => true

end
