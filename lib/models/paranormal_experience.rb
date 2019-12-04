
class ParanormalExperience < ActiveRecord::Base

    belongs_to :haunt
    # belongs_to :ghost_hunters

    def haunt_by_experience
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        arr = []
        Haunt.all.collect do |haunt|
            if haunt.id.to_i == self.id.to_i
                arr << "\nNAME:  #{haunt.name}\nLOCATION:  #{haunt.city}, #{haunt.state}\nABOUT: \n#{haunt.description}\n\n\n#{line}"
            end
        end
        arr
    end


  
end
