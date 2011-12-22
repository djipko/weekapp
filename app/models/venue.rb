class Venue < ActiveRecord::Base
    validates :name,  :presence => true
    validates :address, :presence => true, :length => { :minimum => 5 }

    has_many :events
end
