class Ticket < ActiveRecord::Base
  belongs_to :show
  has_one :event, through: :show
  belongs_to :user

  validates :num_of_general, :presence => true
  before_save :check_capacity

  def cost_of_tickets
    event.price_for_general * num_of_general
  end

  def check_capacity
    show.available?(num_of_general)
  end
end
