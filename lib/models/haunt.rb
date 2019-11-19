class Haunt < ActiveRecord::Base

    has_many :paranormal_experiences
    has_many :ghost_hunters, through: :paranormal_experiences

end

