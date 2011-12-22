class Venue < ActiveRecord::Base
    validates :name,  :presence => true
    validates :address, :presence => true, :length => { :minimum => 5 }
end
