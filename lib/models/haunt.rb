class Haunt < ActiveRecord::Base

    has_many :paranormal_experiences
    # has_many :ghost_hunters, through: :paranormal_experiences

    def location_of_haunt
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\n           NAME: #{self.name} | LOCATION: #{self.city}, #{self.state}\n\n #{self.description}\n\n\n#{line}\n\n"
    end

    # def haunt_by_experience
    #     line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
    #     arr = []
    #     Haunt.all.collect do |haunt|
    #         if haunt.id.to_i == self.id.to_i
    #             arr << "\nNAME:  #{haunt.name}\nLOCATION:  #{haunt.city}, #{haunt.state}\nABOUT: \n#{haunt.description}\n\n\n#{line}"
    #         end
    #     end
    #     arr
    # end

    def haunt_state
        Haunt.all.where(state:)
    end










        


end

