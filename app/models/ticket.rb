class Ticket < ActiveRecord::Base
  belongs_to :show
  belongs_to :user

  validates :num_of_general, :presence => true
end
