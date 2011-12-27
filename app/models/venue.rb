class Venue < ActiveRecord::Base
    validates :name,  :presence => true
    validates :address, :presence => true, :length => { :minimum => 5 }

    has_many :events, :dependent => :destroy
    belongs_to :user
end
