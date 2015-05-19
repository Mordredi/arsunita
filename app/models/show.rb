class Show < ActiveRecord::Base
  belongs_to :event
  has_many :tickets

  validates :date, :presence => true
  validate :date, :within_event_run?

  def within_event_run?
    @event = Event.find(event_id)
    date >= @event.start_date && date <= @event.end_date
  end

end
