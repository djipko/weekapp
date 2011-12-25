class Event < ActiveRecord::Base
  validates :title, :presence => true
  belongs_to :venue
  validates :venue, :presence => true
  has_many :comments
end
