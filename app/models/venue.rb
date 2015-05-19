class Venue < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :num_of_seats, :address_one, :city, :province, :country, :name, :description, :presence => true
end
