class Ticket < ActiveRecord::Base
  belongs_to :show
  has_one :event, through: :show
  belongs_to :user

  validates :num_of_general, :presence => true

  def cost_of_tickets
    @show = Show.find(show_id)
    @event = @show.event
    @event.price_for_general * num_of_general
  end
end
