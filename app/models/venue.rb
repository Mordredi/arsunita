class Venue < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :num_of_seats, :address_one, :city, :province, :country, :name, :description, :presence => true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{address_one} #{address_two}, #{city}, #{provice}, #{country}"
  end
end
