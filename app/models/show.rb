class Show < ActiveRecord::Base
  belongs_to :event
  has_many :tickets

  validates :date, :presence => true
end
