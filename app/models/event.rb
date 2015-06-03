class Event < ActiveRecord::Base

  belongs_to :venue
  belongs_to :category
  belongs_to :user

  has_many :shows
  accepts_nested_attributes_for :shows, :reject_if => :all_blank, :allow_destroy => true

  has_many :event_members
  accepts_nested_attributes_for :event_members, :reject_if => :all_blank, :allow_destroy => true

  has_many :tickets, through: :shows

  validates :start_date, :end_date, :price_for_general, :name, :description, :presence => true

  before_create :end_of_day

  def start_of_day
    self.start_date.beginning_of_day
  end

  def end_of_day
    self.end_date = end_date.end_of_day
  end

end