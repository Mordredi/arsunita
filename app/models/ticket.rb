class Ticket < ActiveRecord::Base
  belongs_to :show
  belongs_to :event, :through => :show
  belongs_to :user


  validates :num_of_general, :presence => true

  def cost_of_tickets
    show = Show.find(id: show_id)
    event = Event.find(id: show.event_id)
    event.price_for_general * num_of_general
  end
end
