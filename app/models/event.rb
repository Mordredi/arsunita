class Event < ActiveRecord::Base

  validates :start_date, :end_date, :price_for_general, :name, :description, :presence => true

  belongs_to :user
  belongs_to :venue

  has_many :shows
  accepts_nested_attributes_for :shows, :reject_if => :all_blank, :allow_destroy => true

  has_many :event_members
  accepts_nested_attributes_for :event_members, :reject_if => :all_blank, :allow_destroy => true

  has_many :tickets, through: :shows

end
