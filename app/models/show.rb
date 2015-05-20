class Show < ActiveRecord::Base
  belongs_to :event
  has_many :tickets

  validates :date, :presence => true
  before_create :within_event_run?

  def within_event_run?
    @event = Event.find(event_id)
    date >= @event.start_date && date <= @event.end_date
  end

  def available?(num_of_general)
    @event = Event.find(event_id)
    @venue = Venue.find(@event.venue_id)
    tickets_for_show = tickets.all
    tickets_for_show.sum(:num_of_general) + num_of_general <= @venue.num_of_seats
  end

end
