class Event < ActiveRecord::Base
  validates :title, :presence => true
  belongs_to :venue
  belongs_to :user
  validates :venue, :presence => true
  has_many :comments, :dependent => :destroy
end
