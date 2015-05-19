class Event < ActiveRecord::Base

  validates :start_date, :end_date, :price_for_general, :name, :description

  belongs_to :user

  has_many :shows

end
