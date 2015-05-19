class Event < ActiveRecord::Base

  validates :start_date, :end_date, :price_for_general, :name, :description, :presence => true

  belongs_to :user

  has_many :shows
  has_many :tickets, through: :shows

end
