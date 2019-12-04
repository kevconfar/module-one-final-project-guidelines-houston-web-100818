
class ParanormalExperience < ActiveRecord::Base

    belongs_to :haunt
    # belongs_to :ghost_hunters

    def haunt_by_experience
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        num = self.id.to_i
        h = Haunt.find_by_id(num)
        h.name_location
    end


    def self.vis_array
        arr = []
        ParanormalExperience.all.collect do |exp|
            if exp.experience.include? "visual"
                arr << exp
            end
        end
        arr
    end

    def self.aud_array
        arr = []
        ParanormalExperience.all.collect do |exp|
            if exp.experience.include? "auditory"
                arr << exp
            end
        end
        arr
    end

    def self.phys_array
        arr = []
        ParanormalExperience.all.collect do |exp|
            if exp.experience.include? "physical"
                arr << exp
            end
        end
        arr
    end


        

end